package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.databind.ObjectMapper;

import recycling.buyer.service.face.RecyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;
import recycling.dto.seller.Seller;

// 메뉴 - 재활용품
@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
	private RecyclingService recyclingService;
	
	@GetMapping("/main")
	public String rcyMain(Model model) {
		logger.info("/buyer/recycling/main [GET]");
		
		//상품 정보 로드
		List<Prd> list = recyclingService.selectPrdList();
		List<Prd> latestList = recyclingService.selectLatestList();
		List<Prd> HitList = recyclingService.selectHitList();
		
		//상품 이미지 로드
		List<PrdFile> prdImage = recyclingService.selectPrdImage();
		List<PrdFile> latestPrdImage = recyclingService.selectLatestPrdImage();
		List<PrdFile> hitPrdImage = recyclingService.selectHitPrdImage();
		
		
		model.addAttribute("list", list);
		model.addAttribute("latestList", latestList);
		model.addAttribute("HitList", HitList);
		
		model.addAttribute("prdImage", prdImage);
		model.addAttribute("latestPrdImage", latestPrdImage);
		model.addAttribute("hitPrdImage", hitPrdImage);
		
		return "buyer/recycling/main";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/findseller", method = RequestMethod.GET)
	public String findSeller(String sCode, String sAddr, Model model, HttpSession session) {
        
        ObjectMapper objectMapper = new ObjectMapper();
        
        // 판매자 찾기
        List<Seller> location = this.recyclingService.findSeller();
        
        List<Map<String, Object>> gpsList = new ArrayList<>();
        
        try {
        	location.forEach(seller -> {
        	    gpsList.add(objectMapper.convertValue(seller, Map.class));
//        		gpsList.add((Map<String, Object>) objectMapper.convertValue(seller, JSONObject.class));
        	});
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        model.addAttribute("gpsList", gpsList);
        model.addAttribute("location", location);

//        logger.info("11111111111111{}", gpsList);
//        logger.info("11111111111111{}", location);

        // 디비에 값을 불러오는게 아닌 직접 jsp에 주소 입력한것
//        return "buyer/recycling/findseller_origin";
        
        return "buyer/recycling/findseller";
        
        // 지도 마커 클릭하고 판매자 코드 클릭하면 상품 판매 리스트 넘기는거 수정 중
	}
        
	
	
	@GetMapping("/rcydetail")
	public String rcyDetail(
			@RequestParam("prdcode") String prdCode,
			Model model, Authentication authentication) {
		logger.info("/rcydetail [GET] - prdCode: {}", prdCode );
		
	    if (authentication != null && authentication.isAuthenticated()) {
	        // 세션이 존재하면 로그인 정보를 출력
	    	BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	        logger.info("상세페이지 조회 - 로그인 되어 있음, BuyerLogin 정보: {}", buyerLogin);
	    } else {
	        // 세션이 존재하지 않으면 비로그인 상태임을 안내
	        logger.info("상세페이지 조회 - 비로그인 상태입니다.");
	    }
		
		Prd prd = recyclingService.view(prdCode);
		
		if (prd == null) {
			return "not-found-page";
		}
		
		Seller seller = recyclingService.selectSeller(prd.getsCode());
		Buyer buyer = recyclingService.selectBuyerByBCode(seller.getbCode());
		int shipCnt = recyclingService.selectShipCnt(prd.getsCode());

		List<Map<String, Object>> qna = recyclingService.selectQnaList(prdCode);
		
		if (qna == null || qna.isEmpty()) {
			model.addAttribute("qnaMessage", "QnA가 존재하지 않습니다.");
		} else {
			model.addAttribute("qna", qna);
			model.addAttribute("qnaSize", qna.size());
		}
		
		model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);
		model.addAttribute("buyer", buyer);
		model.addAttribute("shipCnt", shipCnt);
		
		return "buyer/recycling/rcydetail";
	}
	

	@GetMapping("/rcycmt")
	public String sellerQST(@RequestParam("qstCode") String qstCode, Model model) {
		logger.info("/buyer/recycling/rcycmt [GET]");
		

		// 판매자 문의 조회 등의 기능 수행
		return "buyer/recycling/rcycmt";
	}
	
	
	
	@PostMapping("/writeProc")
	public String writeReview(
	        Authentication authentication,
	        Model model,
	        Rcy rcy,
	        @RequestParam("prdcode") String prdCode // 상품 코드를 직접 전달받음
	        ) {
	    logger.info("/buyer/recycling/writeReviewProc [POST]");

	    // 세션에서 로그인 정보 가져오기
	    BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

	    // 로그인 확인
	    if(buyerLogin == null) {
	                
	        model.addAttribute("error", "로그인 해주세요.");
	        return "redirect:/buyer/login";
	    }
	    
	    Buyer buyer = recyclingService.selectBuyerDetail(buyerLogin.getbId());
	    

	    rcy.setbCode(buyer.getbCode());
	    
	    // PRD_CODE 설정
	    rcy.setPrdCode(prdCode);
	    //날짜 초기화 및 설정
	    
	    int res = recyclingService.insertRcy(rcy);

	    // 상품 상세 페이지로 리다이렉트
	    return "redirect:/buyer/recycling/rcydetail?prdcode=" + prdCode;
	}
	
	

	
}

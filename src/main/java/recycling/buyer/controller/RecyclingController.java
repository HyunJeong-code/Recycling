package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.HashMap;
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

import recycling.buyer.service.face.BuyerService;
import recycling.buyer.service.face.RecyclingService;

import recycling.buyer.service.face.UpcyclingService;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Rcy;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.seller.Cmt;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

// 메뉴 - 재활용품
@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private RecyclingService recyclingService;
    @Autowired private BuyerService buyerService;
    @Autowired private UpcyclingService upcyclingService;
	
    
    @GetMapping("/main")
    public String rcyMain(Model model) {
        logger.info("/buyer/recycling/main [GET]");
        
        // 상품 정보 로드
        List<Prd> list = recyclingService.selectPrdList();
        
        // 각 리스트에 대한 썸네일과 상품 정보 가져오기
        List<Map<String, Object>> prdWithImagesList = new ArrayList<>();
        List<Map<String, Object>> latestPrdWithImagesList = new ArrayList<>();
        List<Map<String, Object>> hitPrdWithImagesList = new ArrayList<>();
        
        for (Prd prd : list) {
            Map<String, Object> prdWithImages = new HashMap<>();
            prdWithImages.put("prd", prd);
            prdWithImages.put("prdImageThumNames", recyclingService.selectPrdImageThums(prd.getPrdCode()));
            prdWithImagesList.add(prdWithImages);
        }
        
        for (Prd prd : recyclingService.selectLatestList()) {
            Map<String, Object> prdWithImages = new HashMap<>();
            prdWithImages.put("prd", prd);
            prdWithImages.put("prdImageThumNames", recyclingService.selectLatestPrdImageThums(prd.getPrdCode()));
            latestPrdWithImagesList.add(prdWithImages);
        }
        
        for (Prd prd : recyclingService.selectHitList()) {
            Map<String, Object> prdWithImages = new HashMap<>();
            prdWithImages.put("prd", prd);
            prdWithImages.put("prdImageThumNames", recyclingService.selectHitPrdImageThums(prd.getPrdCode()));
            hitPrdWithImagesList.add(prdWithImages);
        }
        
        model.addAttribute("prdWithImagesList", prdWithImagesList);
        model.addAttribute("latestPrdWithImagesList", latestPrdWithImagesList);
        model.addAttribute("hitPrdWithImagesList", hitPrdWithImagesList);
        
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
			for (Seller seller : location) {
				Map<String, Object> sellerMap = objectMapper.convertValue(seller, Map.class);
				List<Prd> prdList = recyclingService.findRcyBySellerCode(seller.getsCode());
				if (!prdList.isEmpty()) {
					sellerMap.put("prdCode", prdList.get(0).getPrdCode());
				} else {
					sellerMap.put("prdCode", ""); // 혹시 관련된 재활용품 코드가 없을 경우 빈 문자열로 설정
				}
				gpsList.add(sellerMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("gpsList", gpsList);
		model.addAttribute("location", location);

		return "buyer/recycling/findseller";

	}

	@GetMapping("/rcydetail")
	public String rcyDetail(
	        @RequestParam("prdCode") String prdCode,
	        Model model, Authentication authentication) {
	    logger.info("/rcydetail [GET] - prdCode: {}", prdCode);

	    if (authentication != null && authentication.isAuthenticated()) {
	        // 세션이 존재하면 로그인 정보를 출력하고 모델에 추가
	        BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	        logger.info("상세페이지 조회 - 로그인 되어 있음, BuyerLogin 정보: {}", buyerLogin);
	        model.addAttribute("buyerLogin", buyerLogin);
	    } else {
	        // 세션이 존재하지 않으면 비로그인 상태임을 안내
	        logger.info("상세페이지 조회 - 비로그인 상태입니다.");
	    }

	    Prd prd = recyclingService.view(prdCode);

	    if (prd == null) {
	        return "buyer/recycling/noneprd";
	    }

	    Seller seller = recyclingService.selectSeller(prd.getsCode());
	    Buyer buyer = recyclingService.selectBuyerByBCode(seller.getbCode());
	    int shipCnt = recyclingService.selectShipCnt(prd.getsCode());
	    
	    // 상품 썸네일 파일명 로드
	    String prdImageThumName = recyclingService.selectPrdImageThum(prdCode);
	    if (prdImageThumName == null) {
	        prdImageThumName = "error_400px.png"; // 기본 에러 이미지
	    }
	    logger.info("썸네일 이미지 파일명: {}", prdImageThumName);
	    
	    // 상세 이미지 파일명 로드
	    List<String> prdImageDetails = upcyclingService.selectPrdImageDetail(prdCode);
	    if (prdImageDetails == null || prdImageDetails.isEmpty()) {
	        prdImageDetails = List.of("error_860px.png"); // 기본 에러 이미지
	    }
	    logger.info("상세 이미지 파일명들: {}", prdImageDetails);

	    model.addAttribute("prd", prd);
	    model.addAttribute("prdImageThumName", prdImageThumName);
	    model.addAttribute("prdImageDetails", prdImageDetails);
	    model.addAttribute("seller", seller);

	    logger.info("Rcy 조회 시작 - prdCode: {}", prdCode);
	    List<Map<String, Object>> rcy = recyclingService.selectRcyList(prdCode);

	    if (rcy == null || rcy.isEmpty()) {
	        model.addAttribute("qnaMessage", "QnA가 존재하지 않습니다.");
	    } else {
	        for (Map<String, Object> rcyItem : rcy ) {
	            String rcyCode = (String) rcyItem.get("rcyCode");

	            // 판매자의 답변(Cmt) 가져오기
	            Cmt cmt = recyclingService.selectCmtByRcyCode(rcyCode);
	            if (cmt != null) {
	                // 가져온 답변을 Rcy 객체에 추가
	                String cmtAns = cmt.getCmtAns();
	                rcyItem.put("cmtAns", cmtAns);
	            }
	        }
	        model.addAttribute("rcy", rcy);
	        model.addAttribute("rcySize", rcy.size());
	    }

	    model.addAttribute("prd", prd);
	    model.addAttribute("seller", seller);
	    model.addAttribute("buyer", buyer);
	    model.addAttribute("shipCnt", shipCnt);

	    return "buyer/recycling/rcydetail";
	}

	
	@PostMapping("/writeProc")
	public String writeReview(
	        Authentication authentication,
	        Model model,
	        Rcy rcy,
	        @RequestParam("prdCode") String prdCode // 상품 코드를 직접 전달받음
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
	    return "redirect:/buyer/recycling/rcydetail?prdCode=" + prdCode;
	}

	
	@PostMapping("/rcycmt")
	public String rcyCmt(
	        Authentication authentication,
	        Model model,
	        Cmt cmt,
	        @RequestParam("rcyCode") String rcyCode, // 해당 질문의 코드
	        @RequestParam("prdCode") String prdCode
	) {
	    logger.info("/buyer/recycling/rcycmt [POST]");

	    // 세션에서 판매자 로그인 정보 가져오기
	    if (authentication == null || !authentication.isAuthenticated()) {
	        model.addAttribute("error", "로그인 해주세요.");
	        return "redirect:/seller/login";
	    }

	    Seller sellerLogin = (Seller) authentication.getPrincipal();

	    // 판매자 코드 설정
	    cmt.setsCode(sellerLogin.getsCode());
	    // 질문 코드 설정
	    cmt.setRcyCode(rcyCode);
	    // 답변 등록 처리
	    int res = recyclingService.insertCmt(cmt);
	    if (res <= 0) {
	        model.addAttribute("error", "답변 등록에 실패했습니다.");
	    }

	    // 리턴
	    return "redirect:/buyer/recycling/rcydetail?prdCode=" + prdCode;
	}

	
	@GetMapping("/pay")
	public String pay(Authentication authentication, Model model, String prdCode) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	    logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
		//아이디 상세 가져오기
		Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		
		//상품 정보 가져오기
		CartOrder prd = upcyclingService.selectCartOrder(prdCode);
		
		//상품 수량 확인 후 알림 메시지
		logger.info("{}",prd);
		if(prd.getcCnt() == 0) {
			model.addAttribute("msg", "해당 상품이 품절되었습니다.");
			model.addAttribute("url", "/buyer/recycling/main");
			return "/layout/alert";
		}
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("prd", prd);
		
		return "/buyer/recycling/pay";
	}
	
	@PostMapping("/pay")
	public String payProc( 
	 			 Authentication authentication
	 			 ,OrderDetail orderDetail
				 ,Orders order
				 , Model model
	 		 ) {
		logger.info("order: {}", order);
		logger.info("orderDetail: {}", orderDetail);
		
	 	BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
		order.setbCode(bCode);
		
		logger.info("order: {}", order);
		
		//주문 INSERT
		int res = buyerService.insertOrder(order);
		 
		//cartOrder 객체로 prd 수량 차감
		CartOrder cart = new CartOrder();
		 
		cart.setcCnt(orderDetail.getOrdCnt());
		cart.setPrdCode(orderDetail.getPrdCode());
		 
		//수량 차감
		int updateRes = buyerService.updatePrdCnt(cart);
		
		//prdCode
		String prdCode = orderDetail.getPrdCode();
		 
		//상품 정보 가져오기
		Prd prd = upcyclingService.selectPrd(prdCode);
		
		//상품 상세 데이터 삽입
		orderDetail.setOrdCode(order.getOrdCode());
		orderDetail.setPrdCode(prd.getPrdCode());
		orderDetail.setOrdName(prd.getPrdName());
		orderDetail.setOrdPrice(prd.getPrice());
		orderDetail.setOrdSum(orderDetail.getOrdCnt() * prd.getPrice());
		orderDetail.setSttNo(900);
		 
		//상품 상세 INSERT
		int ordRes = buyerService.insertOrderDetail(orderDetail);
        
		model.addAttribute("order", order);
		
		return "jsonView";
	}
	
	@GetMapping("/payinfo")
	public void payInfo(String ordCode, Model model) {
		logger.info("{}",ordCode);
		
		Orders order = buyerService.selectByordCode(ordCode);
		
		model.addAttribute("order", order);
	}
	
}

package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import recycling.buyer.service.face.RecyclingService;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;
import recycling.dto.seller.SellerAns;
import recycling.dto.seller.SellerQST;

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
		
		List<Prd> list = recyclingService.selectPrdList();
		
		model.addAttribute("list", list);
		
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
			Model model, HttpSession session) {
		logger.info("/rcydetail [GET] - prdCode: {}", prdCode );
		
	    if (session.getAttribute("buyerLogin") != null) {
	        // 세션이 존재하면 로그인 정보를 출력
	        BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyerLogin");
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

		List<Map<String, Object>> qna = recyclingService.selectQnaList(prdCode);
		
		if (qna == null || qna.isEmpty()) {
			model.addAttribute("qnaMessage", "QnA가 존재하지 않습니다.");
		} else {
			model.addAttribute("qna", qna);
			model.addAttribute("qnaSize", qna.size());
		}
		
		model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);
		
		return "buyer/recycling/rcydetail";
	}
	

	@GetMapping("/rcycmt")
	public String sellerQST(@RequestParam("qstCode") String qstCode, Model model) {
		logger.info("/buyer/recycling/rcycmt [GET]");
		

		// 판매자 문의 조회 등의 기능 수행
		return "buyer/recycling/rcycmt";
	}
	
	@PostMapping("/write")
	public String insertSellerQST(SellerQST sellerQST, RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/write [POST]");
		
		
		int result = recyclingService.insertSellerQST(sellerQST);
		redirectAttributes.addAttribute("qstCode", sellerQST.getQstCode());
		
		return "redirect:/buyer/recycling/rcycmt";
	}
	
	
	@PostMapping("/edit")
	public String editSellerQST(SellerQST sellerQST, RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/edit [POST]");
		
		int result = recyclingService.updateSellerQST(sellerQST);
		redirectAttributes.addAttribute("qstCode", sellerQST.getQstCode());
		
		return "redirect:/buyer/recycling/rcycmt";
	}
	
	
	@PostMapping("/delete")
	public String deleteSellerQST(@RequestParam("qstCode") String qstCode, RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/delete [POST] - qstCode: {}", qstCode);
		
		int result = recyclingService.deleteSellerQST(qstCode);
		redirectAttributes.addAttribute("qstCode", qstCode);
		
		return "redirect:/buyer/recycling/rcycmt";
	}
	
	
	@PostMapping("/rcycmt/writeAnswer")
	public String writeSellerAnswer(SellerAns sellerAns, RedirectAttributes redirectAttributes) {
        logger.info("/buyer/recycling/rcycmt/writeAnswer [POST]");
        
        int result = recyclingService.insertSellerAnswer(sellerAns);
        redirectAttributes.addAttribute("qstCode", sellerAns.getQstCode());
        
        return "redirect:/buyer/recycling/rcycmt";
    }
	
	
	@PostMapping("/rcycmt/editAnswer")
    public String editSellerAnswer(SellerAns sellerAns, RedirectAttributes redirectAttributes) {
        logger.info("/buyer/recycling/rcycmt/editAnswer [POST]");
        
        int result = recyclingService.updateSellerAnswer(sellerAns);
        redirectAttributes.addAttribute("qstCode", sellerAns.getQstCode());
        
        return "redirect:/buyer/recycling/rcycmt";
    }
	
	@PostMapping("/rcycmt/deleteAnswer")
    public String deleteSellerAnswer(@RequestParam("qnaCode") String qnaCode, @RequestParam("qstCode") String qstCode, RedirectAttributes redirectAttributes) {
        logger.info("/buyer/recycling/rcycmt/deleteAnswer [POST] - qnaCode: {}", qnaCode);
        
        int result = recyclingService.deleteSellerAnswer(qnaCode);
        redirectAttributes.addAttribute("qstCode", qstCode);
        
        return "redirect:/buyer/recycling/rcycmt";
    }
	
}

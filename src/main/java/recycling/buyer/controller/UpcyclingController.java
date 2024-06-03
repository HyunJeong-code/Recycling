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
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.UpcyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

@Controller
@RequestMapping("/buyer/upcycling")
public class UpcyclingController {
	
	@Autowired private UpcyclingService upcyclingService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public String upcyMain(Model model) {
		logger.info("/buyer/upcycling/main [GET]");
		
		List<Prd> list = upcyclingService.selectPrdList();
		
		model.addAttribute("list", list);
		
		return "buyer/upcycling/main";
	}
	
	
	@GetMapping("/upcydetail")
	public String  upcyDetail(
			@RequestParam("prdcode") String prdCode,
			Authentication authentication, Model model) {
		logger.info("/upcydetail [GET] - prdCode: {}", prdCode );
		
		if (authentication != null && authentication.isAuthenticated()) {
	        // 세션이 존재하면 로그인 정보를 출력
	    	BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	        logger.info("상세페이지 조회 - 로그인 되어 있음, BuyerLogin 정보: {}", buyerLogin);
	    } else {
	        // 세션이 존재하지 않으면 비로그인 상태임을 안내
	        logger.info("상세페이지 조회 - 비로그인 상태입니다.");
	    }
		
		Prd prd = upcyclingService.selectPrd(prdCode);
		
		if (prd == null) {
			return "not-found-page";
		}
		
		Seller seller = upcyclingService.selectSeller(prd.getsCode());
		
		List<Map<String, Object>> upcyvwlist = upcyclingService.selectRvwList(prdCode);
		
		if (upcyvwlist == null || upcyvwlist.isEmpty()) {
			model.addAttribute("reviewMessage", "리뷰가 존재하지 않습니다.");
		} else {
			model.addAttribute("upcyvwlist", upcyvwlist);
			model.addAttribute("rvwSize", upcyvwlist.size());
		}
		
        model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);
		
		return "buyer/upcycling/upcydetail";
		
	}
	
	
	@PostMapping("/cart")
	public String addCart(String prdCode, int bCode,
			Model model, HttpSession session) {
		logger.info("/cart [POST]");
		
		Prd prd = upcyclingService.selectPrd(prdCode);
		Buyer buyer = upcyclingService.selectBuyerCode(bCode);
		
		List<Prd> cartList = (List<Prd>) session.getAttribute("cartList");
		if (cartList == null) {
	        cartList = new ArrayList<>();
	    }
	    cartList.add(prd); // 장바구니에 상품 추가
	    session.setAttribute("cartList", cartList); // 세션에 장바구니 정보 저장
		
		
		return "redirect:/buyer/upcycling/main";
	}
	
	
	 @GetMapping("/upcyrvwform")
	 public String upcyrvwform(
			 @RequestParam("prdCode") String prdCode,
			 Authentication authentication,
			 Model model) {
	        logger.info("/upcyrvwform [GET]");
	        
	        //로그인 정보 불러오기
			 BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
			 
			// 로그인 확인
			 if (authentication == null || !authentication.isAuthenticated()) {
				 	// 비로그인 상태인 경우 로그인 페이지로 리다이렉트
				 return "redirect:/buyer/login";
			 }
			 
			 Buyer buyer = upcyclingService.selectBuyerDetail(buyerLogin.getbId());
			 model.addAttribute("buyer", buyer);
	        
	        return "/buyer/upcycling/upcyrvwform"; // 후기 작성 폼 페이지로 이동
	    }
	 
	 @PostMapping("/upcyrvwformProc")
	 public String upcyrvwformProc(
			 Model model,
			 @RequestParam("prdcode") String prdCode,
			 @RequestParam("upcyContent") String upcyContent,
			 @RequestParam("upcyGrade") int upcyGrade,
			 Authentication authentication) {
		 logger.info("/upcyrvwformProc [POST]");

		 // 로그인 확인
		 if (authentication == null || !authentication.isAuthenticated()) {
			 // 비로그인 상태인 경우 로그인 페이지로 리다이렉트
			 return "redirect:/buyer/login";
		 }
		 
		 //로그인 정보 불러오기
		 BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		 
		 if (buyerLogin == null) {
			 // BuyerLogin 객체가 null이면 로그인 페이지로 리다이렉트
			 return "redirect:/buyer/login";
		 }
		 
		 
		 Buyer buyer = upcyclingService.selectBuyerDetail(buyerLogin.getbId());
		 
		 if (buyer == null) {
			 // Buyer 객체가 null이면 오류 페이지로 리다이렉트
			 return "redirect:/buyer/loginr";
		 }
		 
		 logger.info("Received prdCode: " + prdCode);
		 
		 UpcyReview review = new UpcyReview();
		 review.setbCode(buyer.getbCode());
		 review.setPrdCode(prdCode);
		 review.setUpcyContent(upcyContent);
		 review.setUpcyGrade(upcyGrade);
		 
		 int res = upcyclingService.insertReview(review);
		 
		 return "redirect:/buyer/upcycling/upcydetail?prdcode=" + prdCode;
	 }
	 
	
	
}

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
			HttpSession session, Model model) {
		logger.info("/upcydetail [GET] - prdCode: {}", prdCode );
		
	    if (session.getAttribute("buyerLogin") != null) {
	        // 세션이 존재하면 로그인 정보를 출력
	        BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyerLogin");
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
	 public String upcyrvwform(@RequestParam("prdCode") String prdCode, Model model) {
	        logger.info("/upcyrvwform [GET]");
	        
	        model.addAttribute("prdCode", prdCode);
	        
	        return "upcyrvwform"; // 후기 작성 폼 페이지로 이동
	    }
	 
	 @PostMapping("/upcyrvwform")
	 public String upcyrvwformProc(
			 @RequestParam("upcyContent") String upcyContent,
			 @RequestParam("upcyGrade") int upcyGrade,
			 @RequestParam("prdCode") String prdCode,
			 HttpSession session) {
		 logger.info("/upcyrvwformProc [POST]");
		 
		 //로그인 정보 불러오기
		 BuyerLogin buyerLogin = (BuyerLogin)session.getAttribute("buyerLogin");
		 
		 if (buyerLogin == null) {
			 // 세션에 buyerLogin 정보가 없을 경우 처리
			 logger.error("BuyerLogin 정보가 세션에 없습니다. 세션 ID: " + session.getId());
			 return "redirect:/buyer/login"; // 로그인 페이지로 리다이렉트
		 }
		 
		 logger.info("BuyerLogin 정보: " + buyerLogin);
		 
		 String bCode = buyerLogin.getbCode();
		 
		 upcyclingService.insertReview(upcyContent, prdCode, bCode, upcyGrade);
		 
		 return "redirect:/buyer/upcycling/upcydetail?prdcode=" + prdCode;
	 }
	 
	 @GetMapping("/upcyrvwupdate")
	 public String upcyrvwupdate(@RequestParam("upcyCode") String upcyCode, Model model) {
		 logger.info("/upcyrvwupdate [GET]");
		 
		// 후기 상세 조회
		 UpcyReview upcyReview = upcyclingService.selectRvw(upcyCode);
		 model.addAttribute("upcyReview", upcyReview);
		 
		 return "upcyrvwupdate";
	 }
	 
	 @PostMapping("/upcyrvwupdateProc")
	 public String  upcyrvwupdate(
			 @RequestParam("upcyCode") String upcyCode
			 , @RequestParam("rvwContent") String upcyContent
			 ,@RequestParam("prdCode") String prdCode) {
		 
		 logger.info("/upcyrvwupdateProc [GET]");
		 upcyclingService.updateReview(upcyCode, upcyContent);
		 
		 
		 return "redirect:/buyer/upcycling/upcydetail?prdcode=" + prdCode;
		 
	 }
	 
	 @PostMapping("/upcyrvwdel")
	 public String upcyrvwdel(@RequestParam("upcyCode") String upcyCode, @RequestParam("prdCode") String prdCode) {
		 logger.info("/upcyrvwdel [POST]");
		 
		 upcyclingService.deleteReview(upcyCode);
		 
		 return "redirect:/buyer/upcycling/upcydetail?prdcode=" + prdCode;
	 }
	
	
}

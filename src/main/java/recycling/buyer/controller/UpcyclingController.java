package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.RecyclingService;
import recycling.buyer.service.face.UpcyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Review;
import recycling.dto.seller.Prd;

// 메뉴 - 업사이클링

@Controller
@RequestMapping("/buyer/upcycling")
public class UpcyclingController {
	
	@Autowired private UpcyclingService upcyclingService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public String upcyMain(Model model) {
		logger.info("/buyer/upcycling/main [GET]");
		
		List<Prd> list = upcyclingService.getPrdList();
		
		model.addAttribute("list", list);
		
		return "buyer/upcycling/main";
	}
	
	
	@GetMapping("/upcydetail")
	public String  upcyDetail(@RequestParam("prdcode") String prdCode, Model model, HttpSession session) {
		logger.info("/upcydetail [GET]");
		
		Prd prd = upcyclingService.view(prdcode);
		
		if (prd == null) {
			return "not-found-page";
		}
		
		model.addAttribute("prd", prd);
		return "buyer/upcycling/upcydetail";
		
	}
	
	
	@PostMapping("/cart")
	public String addCart(int prdno, int bCode,
			Model model, HttpSession session) {
		logger.info("/cart [POST]");
		
		Prd prd = upcyclingService.view(prdno);
		Buyer buyer = upcyclingService.selectBuyerCode(bCode);
		
		List<Prd> cartList = (List<Prd>) session.getAttribute("cartList");
		if (cartList == null) {
	        cartList = new ArrayList<>();
	    }
	    cartList.add(prd); // 장바구니에 상품 추가
	    session.setAttribute("cartList", cartList); // 세션에 장바구니 정보 저장
		
		
		return "redirect:/buyer/upcycling/main";
	}
	
	
	@GetMapping("/upcyvwlist")
	public void upcyvwlist(
			@RequestParam("review") Review review, int rvwCode, Model model) {
		logger.info("/upcyvwlist[GET]");
		
		List<Review> upcyvwlist = upcyclingService.getUpcyvwList();
		
		model.addAttribute("upcyvwlist", upcyvwlist);
	}
	
	
	 @GetMapping("/upcyrvwinfo")
	 public String upcyrvwinfo(@RequestParam("rvwCode") int rvwCode, Model model) {
	        logger.info("/upcyrvwinfo [GET]");
	        
	        // 후기 상세 조회
	        Review review = upcyclingService.selectReviewByCode(rvwCode);
	        model.addAttribute("review", review);
	        
	        return "upcyrvwinfo"; // 후기 상세 조회 페이지로 이동
	    }
	
	 @GetMapping("/upcyrvwform")
	 public String upcyrvwform() {
	        logger.info("/upcyrvwform [GET]");
	        
	        return "upcyrvwform"; // 후기 작성 폼 페이지로 이동
	    }
	 
	 @PostMapping("/upcyrvwform")
	 public String upcyrvwformProc(@RequestParam("rvwContent")String rvwContent, HttpSession session) {
		 logger.info("/upcyrvwformProc [POST]");
		 
		 //로그인 정보 불러오기
		 Buyer buyer = (Buyer)session.getAttribute("buyer");
		 
		 upcyclingService.writeReview(rvwContent, buyer);
		 
		 return "redirect:/buyer/upcyvwlist";
	 }
	 
	 @GetMapping("/upcyrvwupdate")
	 public String upcyrvwupdate(@RequestParam("rvwCode") int rvwCode, Model model) {
		 logger.info("/upcyrvwupdate [GET]");
		 
		// 후기 상세 조회
		 Review review = upcyclingService.selectReviewByCode(rvwCode);
		 model.addAttribute("review", review);
		 
		 return "upcyrvwupdate";
	 }
	 
	 @PostMapping("/upcyrvwupdateProc")
	 public String  upcyrvwupdate(
			 @RequestParam("rvwCode") int rvwCode
			 , @RequestParam("rvwContent") String rvwContent) {
		 
		 logger.info("/upcyrvwupdateProc [GET]");
		 upcyclingService.updateReview(rvwCode, rvwContent);
		 
		 
		 return "redirect:/buyer/upcycling/main";
		 
	 }
	 
	 @PostMapping("/upcyrvwdel")
	 public String upcyrvwdel(@RequestParam("rvwCode") int rvwCode) {
		 logger.info("/upcyrvwdel [POST]");
		 
		 upcyclingService.deleteReview(rvwCode);
		 
		 return "redirect:/buyer/upcycling/main";
	 }
	
	 
	
	
	
}

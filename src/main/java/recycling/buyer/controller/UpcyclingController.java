package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.List;

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

import recycling.buyer.service.face.BuyerService;
import recycling.buyer.service.face.UpcyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

@Controller
@RequestMapping("/buyer/upcycling")
public class UpcyclingController {
	
	@Autowired private UpcyclingService upcyclingService;
	@Autowired private BuyerService buyerService;
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
		Buyer buyer = upcyclingService.selectBuyerByBCode(seller.getbCode());
		int shipCnt = upcyclingService.selectShipCnt(prd.getsCode());
		
		model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);
		model.addAttribute("buyer", buyer);
		model.addAttribute("shipCnt", shipCnt);
		
		
		return "buyer/upcycling/upcydetail";
		
	}
	
	@GetMapping("/upcyvwlist")
	public String  upcyvwlist(@RequestParam("prdCode") String prdCode, Model model) {
		logger.info("/upcyvwlist [GET] - prdCode: {}", prdCode);
		
		List<UpcyReview> upcyvwlist = upcyclingService.selectRvwList(prdCode);
		
		model.addAttribute("upcyvwlist", upcyvwlist);
		
		return "buyer/upcycling/upcyvwlist";
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
	 
	   @GetMapping("/cart")
	   public String cart(Authentication authentication
	          , Cart cart
	          , Model model
	          , boolean isCart) {
	       
	       BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	       logger.info("buyerLogin : {}", buyerLogin);
		  
		   //cart에 bcode 추가
		   cart.setbCode(buyerLogin.getbCode());
		   
		   if(isCart) {
		      int res = upcyclingService.updatecCnt(cart);
		   }   else {
		      int res = upcyclingService.insertCart(cart);
		   }
		   
		   model.addAttribute("msg", "장바구니에 추가되었습니다.");
		   model.addAttribute("url", "/buyer/upcycling/main");
		   return "/layout/alert";
	   }
	 
	 @GetMapping("/pay")
	 public String pay(
			 Authentication authentication
			 , CartOrder cartOrder
			 , Model model
			 ) {
		 //logger.info("checkList : {}", checkList);
		 
		 BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	     logger.info("buyerLogin : {}", buyerLogin);
		
		 String bCode = buyerLogin.getbCode();
		
		 //아이디 상세 가져오기
		 Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		 
		 String prdCode = cartOrder.getPrdCode();
		 
		 //상품 정보 가져오기
		 CartOrder prd = upcyclingService.selectCartOrder(prdCode);
		 
		 //상품 수량 확인 후 알림 메시지
		 if(prd.getcCnt() < cartOrder.getcCnt()) {
				model.addAttribute("msg", "상품 수량이 부족합니다.");
				model.addAttribute("url", "/buyer/upcycling/main");
				return "/layout/alert";
		 } else if(prd.getcCnt() == 0) {
				model.addAttribute("msg", "해당 상품이 품절되었습니다.");
				model.addAttribute("url", "/buyer/upcycling/main");
				return "/layout/alert";
		 }
		 
		 cartOrder.setPrdName(prd.getPrdName());
		 cartOrder.setPrice(prd.getPrice());
		 cartOrder.setPrdFee(prd.getPrdFee());
		 cartOrder.setStoredName(prd.getStoredName());
		 
		 
		 //배송지 주소 가져오기
		 List<BuyerAdr> buyeradr = buyerService.selectBybCode(bCode); 
		 
		 logger.info("buyer : {}", buyeradr);
		
		 model.addAttribute("buyer", buyer);
		 model.addAttribute("cart", cartOrder);
		 model.addAttribute("buyeradr", buyeradr);
		 
		 return "/buyer/upcycling/pay";
	 }
	 
	 
	 @PostMapping("/pay")
 	 public String payProc( 
	 			 Authentication authentication
	 			 ,OrderDetail orderDetail
				 ,Orders order
				 , Model model
	 		 ) {
 		
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

	 @GetMapping("/cartchk")
	 public String cartChk(Authentication authentication
	  , Cart cart
	  , Model model) {
	  BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	      logger.info("buyerLogin : {}", buyerLogin);
	      
	      //cart에 bcode 추가
	      cart.setbCode(buyerLogin.getbCode());
	      
	      Integer cCnt = upcyclingService.selectcCnt(cart);
	      
	      logger.info("{}",cCnt);
	      
	      model.addAttribute("cCnt", cCnt);
	      
	      return "jsonView";
	 }
}
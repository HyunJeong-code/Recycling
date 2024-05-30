package recycling.buyer.controller;

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
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.buyer.UpcyReview;
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
	public String  upcyDetail(@RequestParam("prdcode") String prdCode, Model model, HttpSession session) {
		logger.info("/upcydetail [GET] - prdCode: {}", prdCode );
		
		Prd prd = upcyclingService.selectPrd(prdCode);
		
		if (prd == null) {
			return "not-found-page";
		}
		
		Seller seller = upcyclingService.selectSeller(prd.getsCode());
//		SellerProf sellerProf = upcyclingService.selectSellerProf(prd.getsCode());
		
		model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);
//		model.addAttribute("sellerProf", sellerProf);
		
		
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
	 public String upcyrvwform(@RequestParam("prdCode") String prdCode, Model model) {
	        logger.info("/upcyrvwform [GET]");
	        
	        model.addAttribute("prdCode", prdCode);
	        
	        return "upcyrvwform"; // 후기 작성 폼 페이지로 이동
	    }
	 
	 @PostMapping("/upcyrvwform")
	 public String upcyrvwformProc(
			 @RequestParam("upcyContent") String upcyContent,
			 @RequestParam("prdCode") String prdCode,
			 HttpSession session) {
		 logger.info("/upcyrvwformProc [POST]");
		 
		 //로그인 정보 불러오기
		 Buyer buyer = (Buyer)session.getAttribute("buyer");
		 
		 upcyclingService.insertReview(upcyContent, prdCode, buyer);
		 
		 return "redirect:/buyer/upcycling/upcyvwlist?prdCode=" + prdCode;
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
			 , @RequestParam("rvwContent") String upcyContent) {
		 
		 logger.info("/upcyrvwupdateProc [GET]");
		 upcyclingService.updateReview(upcyCode, upcyContent);
		 
		 
		 return "redirect:/buyer/upcycling/main";
		 
	 }
	 
	 @PostMapping("/upcyrvwdel")
	 public String upcyrvwdel(@RequestParam("upcyCode") String upcyCode) {
		 logger.info("/upcyrvwdel [POST]");
		 
		 upcyclingService.deleteReview(upcyCode);
		 
		 return "redirect:/buyer/upcycling/main";
	 }
	
	 
	 @GetMapping("/pay")
	 public void pay(
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
		 Prd prd = upcyclingService.selectPrd(prdCode);
		 
		 cartOrder.setPrdName(prd.getPrdName());
		 cartOrder.setPrice(prd.getPrice());
		 cartOrder.setPrdFee(prd.getPrdFee());
		 
		 
		 //배송지 주소 가져오기
		 List<BuyerAdr> buyeradr = buyerService.selectBybCode(bCode);
		 
		 logger.info("buyer : {}", buyeradr);
		
		 model.addAttribute("buyer", buyer);
		 model.addAttribute("cart", cartOrder);
		 model.addAttribute("buyeradr", buyeradr);
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
		 }	else {
			 int res = upcyclingService.insertCart(cart);
		 }
		 
		 model.addAttribute("msg", "장바구니에 추가되었습니다.");
		 model.addAttribute("url", "/buyer/upcycling/main");
		 return "/layout/alert";
	}
	
}

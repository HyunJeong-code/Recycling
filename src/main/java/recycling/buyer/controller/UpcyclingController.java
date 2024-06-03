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
	
//	@GetMapping("/upcyvwlist")
//	public String  upcyvwlist(@RequestParam("prdCode") String prdCode, Model model) {
//		logger.info("/upcyvwlist [GET] - prdCode: {}", prdCode);
//		
//		List<UpcyReview> upcyvwlist = upcyclingService.selectRvwList(prdCode);
//		
//		model.addAttribute("upcyvwlist", upcyvwlist);
//		
//		return "buyer/upcycling/upcyvwlist";
//	}
	
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

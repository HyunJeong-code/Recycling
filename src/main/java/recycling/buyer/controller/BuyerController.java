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

import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BuyerService buyerService;
	@Autowired HttpSession session;
	
	@GetMapping("/cart")
	public void cart(Model model) {
		
		//테스트용 세션***********************************************테스트
		session.setAttribute("bCode", "BUY0000002");
		
		String bCode = (String)session.getAttribute("bCode");
		
		//해당 session의 Cart List 정보
		List<CartOrder> bf_list = buyerService.selectAllCart(bCode);
		
		//재고 부족 알림 메시지
		String msg = "";
		
		//현재 상품 재고과 장바구니에 담긴 상품 수량 확인
		for(CartOrder e : bf_list) {
			Integer count = buyerService.selectPrdCnt(e.getPrdCode());
			logger.info("prd count : {}", count);
			logger.info("cart count : {}", e.getcCnt());
			
			
			
			//재고가 부족할시 장바구니에서 DELETE
			if(count < e.getcCnt()) {
				
				//처음이 아닐때 컴마 추가
				if(msg != "") {
					msg += ", ";
				}
				//
				msg += e.getPrdName();
				
				logger.info("{} 상품의 재고가 부족합니다", e.getPrdName());
				int res = buyerService.deleteCart(e.getcCode());
				
			}
		}
		
		//msg가 빈칸이 아닐시 메시지 추가
		if(msg != "") {
			msg += " 상품의 수량이 부족하여 장바구니에서 제외되었습니다.";
		}
		
		List<CartOrder> list = buyerService.selectAllCart(bCode);
		
		//logger.info("{}",msg);
		//logger.info("{}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("msg", msg);
	}
	
	@PostMapping("/cartupdate")
	public String cartupdate(Cart cart, Model model) {
		logger.info("cartupdate : {}", cart);
		
		CartOrder cartOrder = buyerService.selectBycCode(cart.getcCode());
		
		Integer prdCnt = buyerService.selectPrdCnt(cartOrder.getPrdCode());

		int cntRes = 0;
		
		//수량 확인
		if(prdCnt >= cart.getcCnt()) {
			cntRes = buyerService.updatecCnt(cart);
		}
		
		model.addAttribute("cntRes", cntRes);
		
		return "jsonView";
	}
	
	@PostMapping("/cartdel")
	public String cartdel(@RequestParam(value = "arr[]") List<String> list) {
		logger.info("cartdel : {}", list);
		
		for(String cCode : list) {
			int deleteRes = buyerService.deleteCart(cCode);  
		}
		
		return "jsonView"; 
	}
	
	@GetMapping("/pay")
	public void pay(
			@RequestParam List<String> checkList,
			Model model
			) {
		//logger.info("checkList : {}", checkList);
		
		//테스트용 세션***********************************************테스트
		session.setAttribute("bCode", "BUY0000002");
		
		String bCode = (String)session.getAttribute("bCode");
		
		BuyerAdr buyeradr = buyerService.selectBybCode(bCode); 
		
		List<CartOrder> list = new ArrayList<CartOrder>();
		
		for (String cCode : checkList) {
			CartOrder cart = buyerService.selectBycCode(cCode);
            
            list.add(cart);
        }
		
		//logger.info("list : {}", list);
		//logger.info("buyer : {}", buyeradr);
		
		model.addAttribute("clist", list);
		model.addAttribute("buyer", buyeradr);
		
		//List<Cart> list = buyerService.selectAllCart(bCode);
		
	}
	
	@PostMapping("/pay")
	public String payProc(
				Orders order
				, Model model
				, @RequestParam("cartList[]") List<String> cartList
			) {
		
		//테스트용 세션***********************************************테스트
		session.setAttribute("bCode", "BUY0000002");
		String bCode = (String)session.getAttribute("bCode");
		
		order.setbCode(bCode);
		
		logger.info("order: {}", order);
		logger.info("cartList: {}", cartList);
		
		int res = buyerService.insertOrder(order);
		
		for (String cCode : cartList) {
			
			OrderDetail orderDetail = new OrderDetail();
			//카트담긴것 Order_detail로 인서트
			CartOrder cartOrder = buyerService.selectBycCode(cCode);
			
			orderDetail.setOrdCode(order.getOrdCode());
			orderDetail.setPrdCode(cartOrder.getPrdCode());
			orderDetail.setOrdName(cartOrder.getPrdName());
			orderDetail.setOrdPrice(cartOrder.getPrice());
			orderDetail.setOrdCnt(cartOrder.getcCnt());
			orderDetail.setOrdSum(cartOrder.getcCnt() * cartOrder.getPrice());
			orderDetail.setSttNo(900);
			
			int ordRes = buyerService.insertOrderDetail(orderDetail);
			
			//수량 차감
			CartOrder cart = buyerService.selectBycCode(cCode);
			int updateRes = buyerService.updatePrdCnt(cart);
			
			//카트 DELETE
			int deleteRes = buyerService.deleteCart(cCode);  
        }
		
		model.addAttribute("order", order);
		
		return "jsonView";
	}
	
	@GetMapping("/payinfo")
	public void payinfo(@RequestParam("ordCode") String ordCode, Model model) {
		logger.info("{}",ordCode);
		
		Orders order = buyerService.selectByordCode(ordCode);
		
		model.addAttribute("order", order);
	}
	
	@GetMapping("/myorder")
	public void myorder(Model model) {
		
		//테스트용 세션***********************************************테스트
		session.setAttribute("bCode", "BUY0000002");
		String bCode = (String)session.getAttribute("bCode");
		
		List<MyOrder> list = buyerService.selectOrderDetailBybCode(bCode);
		
		model.addAttribute("list", list);
	}
	

	// 회원 정보 관리 메인 (비밀번호 입력)
	@GetMapping("/mymain")
	public String myMain(
			HttpSession session
			) {
		
		logger.info("/buyer/mypage/mymain [GET]");
		
		Boolean isChecked = (Boolean) session.getAttribute("isChecked");
		
		if(isChecked != null && isChecked) {
			
			Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
			
			String buyerType = currentBuyer.getbCtCode();
		
			if("P".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailpri";
				
			} else if ("C".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailcmp";
				
			}
			
		}
		
		return "/buyer/mypage/mymain";
		
	}
	
	// 회원 정보 관리 메인 (비밀번호 입력) 처리
	@PostMapping("/mymain")
	public String myMainProc(
			@RequestParam("password") String password,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mymain [POST]");
		
		// 현재 로그인된 구매자 정보
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "/buyer/login";
			
		}
		
		// 비밀번호 확인
		if(buyerService.verifyPw(currentBuyer.getbId(), password)) {
			
			// 구매자 유형
			String buyerType = currentBuyer.getbCtCode();
			
			session.setAttribute("currentBuyer", currentBuyer);
			
			if("P".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailpri";
				
			} else if ("C".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailcmp";
				
			}
			
		}
		
		model.addAttribute("error", "비밀번호가 틀렸습니다.");
		
		return "/buyer/mypage/mymain";
		
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/changepw")
	public void changePw(
			HttpSession session
			) {
		
		logger.info("/buyer/mypage/changepw [GET]");
		
	}
	
	// 비밀번호 변경 처리
	@PostMapping("/changepw")
	public String changePwProc(
			@RequestParam("currentPw") String currentPw,
			@RequestParam("newPw") String newPw,
			@RequestParam("confirmPw") String confirmPw,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/changepw [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/mypage/mymain";
			
		}
		
		if(!buyerService.verifyPw(currentBuyer.getbId(), currentPw)) {
			
			model.addAttribute("error", "현재 비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		if(!newPw.equals(confirmPw)) {
			
			model.addAttribute("error", "새 비밀번호가 일치하지 않습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		buyerService.changePw(currentBuyer.getbId(), newPw);
		
		model.addAttribute("success", "비밀번호가 변경되었습니다.");
		
		return "/buyer/mypage/changepw";
		
	}
	
	
	// 회원 정보 변경 (개인)
	@GetMapping("/mydetailpri")
	public void myDetailPri(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailpri [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return;
			
		}
		
		model.addAttribute("currentBuyer", currentBuyer);
		
	}
	
	// 회원 정보 변경 처리 (개인)
	@PostMapping("/mydetailpri")
	public String myDetailPriProc(
			Buyer buyer,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailpri [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/mypage/mymain";
			
		}
		
		buyer.setbCode(currentBuyer.getbCode());
		
		// 세션의 currentBuyer를 새로운 buyer 객체로 업데이트
		session.setAttribute("currentBuyer", buyer);
		
		model.addAttribute("success", "개인 정보가 수정되었습니다.");
		
		return "/buyer/mypage/mydetailpri";
		
	}
	
	// 회원 정보 변경 (기업)
	@GetMapping("/mydetailcmp")
	public void myDetailCmp(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailcmp [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
		Cmp cmp = buyerService.getCmpDetail(currentBuyer.getbCode());
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("cmp", cmp);
		
	}
	
	// 회원 정보 변경 처리 (기업)
	@PostMapping("/mydetailcmp")
	public String myDetailCmpProc(
			Buyer buyer,
			Cmp cmp,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailcmp [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/mypage/mymain";
			
		}
		
		buyer.setbCode(currentBuyer.getbCode());
		cmp.setbCode(currentBuyer.getbCode());
		
		buyerService.updateCmpDetail(buyer, cmp);
		session.setAttribute("currentBuyer", buyer);
		
		model.addAttribute("success", "기업 정보가 수정되었습니다.");
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제)
	@GetMapping("/myaddr")
	public void myAddr(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/myaddr [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
		List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdrList(currentBuyer);
		
		model.addAttribute("buyerAdrList", buyerAdrList);
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제) 처리
	@PostMapping("/myaddr")
	public String myAddrProc(
			@RequestParam("action") String action,
			@RequestParam(value = "adrCode", required = false) String adrCode,
			BuyerAdr buyerAdr,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/myaddr [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		buyerAdr.setbCode(currentBuyer.getbCode());
		
		List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdrList(currentBuyer.getbCode());
		
		switch(action) {
			case "register":
				
				if(buyerAdrList.size() >= 3) {
					
					model.addAttribute("error", "배송지는 최대 3개까지 등록할 수 있습니다.");
					
				} else {
					
					buyerService.registerAdr(buyerAdr);
					model.addAttribute("success", "배송지가 등록되었습니다.");
					
				}
				
				break;
				
			case "update":
				
				buyerAdr.setAdrCode(adrCode);
				buyerService.updateAdr(buyerAdr);
				model.addAttribute("success", "배송지가 수정되었습니다.");
				break;
				
			case "delete":
				
				buyerService.deleteAdr(adrCode);
				model.addAttribute("success", "배송지가 삭제되었습니다.");
				break;
		
			default:
				
				model.addAttribute("error", "에러입니다.");
				break;
		
		}
		
		buyerAdrList = buyerService.getBuyerAdrList(currentBuyer.getbCode());
		
		model.addAttribute("buyerAdrList", buyerAdrList);
		
		return "/buyer/mypage/myaddr";
		
	}
	
	// 회원 탈퇴
	@GetMapping("/outbuyer")
	public void outBuyer(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/outbuyer [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
	}
	
	// 회원 탈퇴 처리
	@PostMapping("/outbuyer")
	public String outBuyerProc(
			@RequestParam("password") String password,
			@RequestParam(value = "privacyConsent", required = false) String ps,
			@RequestParam(value = "infoConsent", required = false) String is,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/outbuyer [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/login";
			
		}
		
		if(!buyerService.verifyPw(currentBuyer.getbId(), password)) {
			
			model.addAttribute("error", "비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/outbuyer";
			
		}
		
		if(ps == null || "agree".equals(ps) || is == null || !"agree".equals(is)) {
			
			model.addAttribute("error", "약관을 동의해주세요.");
			
			return "/buyer/mypage/outbuyer";
			
		}
		
		buyerService.deleteBuyer(currentBuyer.getbCode());
		
		session.invalidate();
		
		return "redirect:/buyer/login";
		
	}
	
	// 멤버쉽 관리
	@GetMapping("/myrank")
	public void myRank(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/myrank [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
		BuyerRank buyerRank = buyerService.getBuyerRank(currentBuyer.getRankNo());
		
		model.addAttribute("buyer", currentBuyer);
		model.addAttribute("buyerRank", buyerRank);
		
	}
	
}
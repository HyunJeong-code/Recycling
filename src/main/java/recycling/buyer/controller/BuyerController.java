package recycling.buyer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;


import org.springframework.security.core.annotation.AuthenticationPrincipal;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;



// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyerService buyerService;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	@Autowired HttpSession session;
	@Autowired private JavaMailSenderImpl mailSender;
	
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
	public String cartUpdate(Cart cart, Model model) {
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
	public String cartDel(@RequestParam(value = "arr[]") List<String> list) {
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
		logger.info("buyer : {}", buyeradr);
		
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
	public void payInfo(@RequestParam("ordCode") String ordCode, Model model) {
		logger.info("{}",ordCode);
		
		Orders order = buyerService.selectByordCode(ordCode);
		
		model.addAttribute("order", order);
	}
	
	@GetMapping("/myorder")
	public void myOrder(Model model) {
		
		//테스트용 세션***********************************************테스트
		session.setAttribute("bCode", "BUY0000002");
		String bCode = (String)session.getAttribute("bCode");
		
		List<MyOrder> list = buyerService.selectOrderDetailBybCode(bCode);
		
		model.addAttribute("list", list);
	}
	
	@PostMapping("/EmailAuth")
	@ResponseBody
	public int emailAuth(String email) {
		logger.info("/buyer/EmailAuth [GET]");
		
		logger.info("Email : {}", email);
		
		// 6자리 인증번호 난수로 생성
		Random rdn = new Random();
		int chkNum = rdn.nextInt(888888) + 111111;
		
		// 이메일 보낼 양식
		String setFrom = "tptkd__777@naver.com";
		String toMail = email;
		String title = "[새활용] 회원가입 인증번호 입니다.";
		String content = "인증 번호는 " + chkNum + " 입니다."
						+ "<br>" 
						+ "해당 인증 번호를 이메일 인증 번호 입력란에 입력해주세요.";
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper help = new MimeMessageHelper(mail, true, "utf-8");
			
			help.setFrom(setFrom);
			help.setTo(toMail);
			help.setSubject(title);
			help.setText(content, true);
			
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return chkNum;
	}
	
	@GetMapping("/myorderdetail")
	public void myOrderDetail() {
		
		
		
	}
	
	@GetMapping("/myorderchk")
	public void myOrderChk() {
		
		
		
	}
	
	@GetMapping("/changeorder")
	public void changeOrder() {
		
		
		
	}

	// 회원 정보 관리 메인 (비밀번호 입력)
	@GetMapping("/mymain")
	public String myMain() {
		
		logger.info("/buyer/mypage/mymain [GET]");
		
		return "/buyer/mypage/mymain";
		
	}
	
	// 회원 정보 관리 메인 (비밀번호 입력) 처리
	@PostMapping("/mymain")
	public String myMainProc(
			String password,
			Model model
			) {
		
		logger.info("/buyer/mypage/mymain [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		// 비밀번호 확인
		if(!buyerService.verifyPw(buyerLogin.getbId(), password)) {
			
			model.addAttribute("error", "비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/mymain";
		
		}
		
		if("P".equals(buyerLogin.getbCtCode())) {

			return "redirect:/buyer/mypage/mypagepri";
				
		} else if ("C".equals(buyerLogin.getbCtCode())) {
				
			return "redirect:/buyer/mypage/mypagecmp";
		
		} else {
			
			model.addAttribute("error", "처리할 수 없습니다.");
			
			return "/buyer/mypage/mymain";
			
		}
		
	}
	
	// 개인 마이페이지 메인화면
	@GetMapping("/mypagepri")
	public String myPagePri(Model model) {
		
		logger.info("/buyer/mypage/mypagepri [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		BuyerRank buyerRank = buyerService.getBuyerRank(buyer.getRankNo());
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("buyerRank", buyerRank);
		
		return "/buyer/mypage/mypagepri";
		
	}
	
	// 기업 마이페이지 메인화면
	@GetMapping("/mypagecmp")
	public String myPageCmp(Model model) {
		
		logger.info("/buyer/mypage/mypagecmp [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		Cmp cmp = buyerService.getCmpDetail(buyerLogin.getbId());
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("cmp", cmp);
		
		return "/buyer/mypage/mypagecmp";
		
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/changepw")
	public String changePw(
			HttpSession session
			) {
		logger.info("/buyer/mypage/changepw [GET]");
		
//		return "buyer/mypage/changepw";
		
	}
	
	// 비밀번호 변경 처리
	@PostMapping("/changepw")
	public String changePwProc(
			@RequestParam("newPw") String newPw,
			@RequestParam("confirmPw") String confirmPw,
			Authentication authentication,
			Model model
			) {
		
		logger.info("/buyer/mypage/changepw [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		String oldPw = buyerLogin.getbPw();
		String enPw = pwEncoder.encode(newPw);
		buyerLogin.setbPw(enPw);
		int res = buyerService.changePw(buyerLogin);
		
		logger.info("res : {}", res);
		
		model.addAttribute("success", "비밀번호가 변경되었습니다.");
		
		return "redirect:/buyer/mypage/changepw";
		
	}
	
	// 회원 정보 변경 (개인)
	@GetMapping("/mydetailpri")
	public String myDetailPri(Model model) {
		
		logger.info("/buyer/mypage/mydetailpri [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		
		model.addAttribute("currentBuyer", currentBuyer);
		
		return "/buyer/mypage/mydetailpri";
		
	}
	
	// 회원 정보 변경 처리 (개인)
	@PostMapping("/mydetailpri")
	public String myDetailPriProc(Buyer buyer,Model model) {
		
		logger.info("/buyer/mypage/mydetailpri [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer currentBuyer = buyerService.updateBuyerDetail(buyer);
		
		currentBuyer.setbId(buyerLogin.getbId());
		
		model.addAttribute("success", "개인 정보가 수정되었습니다.");
		
		return "redirect:/buyer/mypage/mydetailpri";
		
	}
	
	// 회원 정보 변경 (기업)
	@GetMapping("/mydetailcmp")
	public String myDetailCmp(Model model) {
		
		logger.info("/buyer/mypage/mydetailcmp [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		Cmp cmp = buyerService.getCmpDetail(buyerLogin.getbId());
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("cmp", cmp);
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 회원 정보 변경 처리 (기업)
	@PostMapping("/mydetailcmp")
	public String myDetailCmpProc(
			Buyer buyer,
			Cmp cmp,
			@RequestParam("cmpFile") MultipartFile cmpFile,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailcmp [POST]");
		
		if(!cmpFile.isEmpty()) {
			
			String fileName = System.currentTimeMillis() + "_" + cmpFile.getOriginalFilename();
			String filePath = "D:/uploads/" + fileName;
			
			File destFile = new File(filePath);
			
			try {
				
				cmpFile.transferTo(destFile);
				
			} catch (IOException e) {
				
				model.addAttribute("error", "파일 업로드 실패: " + e.getMessage());
				
				return "/buyer/mypage/mydetailcmp";
				
			}
			
		}
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		buyer.setbCode(buyerLogin.getbCode());
		cmp.setbCode(buyerLogin.getbCode());
		
		Buyer currentBuyer = buyerService.updateBuyerDetail(buyer);
		Cmp currentCmp = buyerService.updateCmpDetail(cmp);
				
		currentBuyer.setbId(buyerLogin.getbId());
		currentCmp.setbCode(buyerLogin.getbId());
		
		model.addAttribute("success", "기업 정보가 수정되었습니다.");
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제)
	@GetMapping("/myaddr")
	public String myAddr(Model model) {
		
		logger.info("/buyer/mypage/myaddr [GET]");
		
		BuyerLogin buyer = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "/buyer/login";
			
		}
		
		List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdrList(buyer.getbCode());
		
		if(buyerAdrList == null || buyerAdrList.isEmpty()) {
			
			model.addAttribute("error", "등록된 배송지 정보가 없습니다.");
			
		} else {
			
			model.addAttribute("buyerAdrList", buyerAdrList);
			
		}
		
		return "/buyer/mypage/myaddr";
		
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
		
		BuyerLogin buyer = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		buyerAdr.setbCode(buyer.getbCode());
		
		List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdrList(buyer.getbCode());
		
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
		
		buyerAdrList = buyerService.getBuyerAdrList(buyer.getbCode());
		
		model.addAttribute("buyerAdrList", buyerAdrList);
		
		return "/buyer/mypage/myaddr";
		
	}
	
	// 회원 탈퇴
	@GetMapping("/outbuyer")
	public void outBuyer(Model model) {
		
		logger.info("/buyer/mypage/outbuyer [GET]");
		
		BuyerLogin buyer = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
	}
	
	// 회원 탈퇴 처리
	@PostMapping("/outbuyer")
	public String outBuyerProc(
			String password,
			@RequestParam(value = "privacyConsent", required = false) String ps,
			@RequestParam(value = "infoConsent", required = false) String is,
			Model model
			) {
		
		logger.info("/buyer/mypage/outbuyer [POST]");
		
		BuyerLogin buyer = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyer == null) {
			
			return "redirect:/buyer/login";
			
		}
		
		if(!buyerService.verifyPw(buyer.getbId(), password)) {
			
			model.addAttribute("error", "비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/outbuyer";
			
		}
		
		if("agree".equals(ps) && "agree".equals(is)) {
			
			buyerService.deleteBuyer(buyer.getbCode());
			
			session.invalidate();
			
			return "redirect:/buyer/login";
			
		} else {
			
			model.addAttribute("error", "모든 약관에 동의해주세요.");
			
			return "/buyer/mypage/outbuyer";
			
		}
		
	}
	
}
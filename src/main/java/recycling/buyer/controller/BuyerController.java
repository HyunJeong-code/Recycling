package recycling.buyer.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
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

import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;

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
	public void cart(Authentication authentication, Model model, HttpSession session) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
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
			Authentication authentication
			, @RequestParam List<String> checkList
			, Model model
			, HttpSession session
			) {
		//logger.info("checkList : {}", checkList);
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
		BuyerAdr buyeradr = buyerService.selectBybCode(bCode); 
		
		List<CartOrder> list = new ArrayList<CartOrder>();
		
		for (String cCode : checkList) {
			CartOrder cart = buyerService.selectBycCode(cCode);
            
            list.add(cart);
        }
		
		logger.info("buyer : {}", buyeradr);
		
		model.addAttribute("clist", list);
		model.addAttribute("buyer", buyeradr);
		
	}
	
	@PostMapping("/pay")
	public String payProc(
				Authentication authentication
				,Orders order
				, Model model
				, @RequestParam("cartList[]") List<String> cartList
				, HttpSession session
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
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
	public void myOrder(Model model, Authentication authentication) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
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
	public String myMain(
			Model model) {
		
		logger.info("/buyer/mypage/mymain [GET]");
		
		return "/buyer/mypage/mymain";
		
	}
	
	// 회원 정보 관리 메인 (비밀번호 입력) 처리
	@PostMapping("/mymain")
	public String myMainProc(
			Authentication authentication,
			String password,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("/buyer/mypage/mymain [POST]");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		// 비밀번호 확인
		if(!pwEncoder.matches(password, buyerLogin.getbPw())) {
			model.addAttribute("error", "비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/mymain";
		}
		
		if(buyerLogin.getbCtCode().equals("P")) {

			return "redirect:/buyer/mypage/mypagepri";
				
		} else if (buyerLogin.getbCtCode().equals("C")) {
				
			return "redirect:/buyer/mypage/mypagecmp";
		
		} else {
			
			model.addAttribute("error", "처리할 수 없습니다.");
			
			return "/buyer/mypage/mymain";
			
		}
		
	}
	
	// 개인 마이페이지 메인화면
	@GetMapping("/mypagepri")
	public String myPagePri(
			Authentication authentication,
			Model model) {
		
		logger.info("/buyer/mypage/mypagepri [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
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
	public String myPageCmp(
			Authentication authentication,
			Model model) {
		
		logger.info("/buyer/mypage/mypagecmp [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
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
			Authentication authentication,
			Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		logger.info("/buyer/mypage/changepw [GET]");
		
		return "buyer/mypage/changepw";
		
	}
	
	// 비밀번호 변경 처리
	@PostMapping("/changepw")
	public String changePwProc(
			Authentication authentication,
			@RequestParam("currentPw") String currentPw,
			@RequestParam("newPw") String newPw,
			@RequestParam("confirmPw") String confirmPw,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("/buyer/mypage/changepw [POST]");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		if(!pwEncoder.matches(currentPw, buyerLogin.getbPw())) {
			
			model.addAttribute("error", "현재 비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		if(!newPw.equals(confirmPw)) {
			
			model.addAttribute("error", "새 비밀번호가 일치하지 않습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		buyerService.changePw(buyerLogin, pwEncoder.encode(newPw));
		
		model.addAttribute("success", "비밀번호가 변경되었습니다.");
		
		return "redirect:/buyer/mypage/changepw";
		
	}
	
	// 회원 정보 변경 (개인)
	@GetMapping("/mydetailpri")
	public String myDetailPri(
			Authentication authentication,
			Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("/buyer/mypage/mydetailpri [GET]");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		BuyerRank buyerRank = buyerService.getBuyerRank(currentBuyer.getRankNo());
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("buyerRank", buyerRank);
		
		return "/buyer/mypage/mydetailpri";
		
	}
	
	// 회원 정보 변경 처리 (개인)
	@PostMapping("/mydetailpri")
	public String myDetailPriProc(
			Authentication authentication,
			Buyer buyer,
			@RequestParam("buyerProf") MultipartFile buyerProf,
			@RequestParam(value = "adSms", required = false, defaultValue = "N") String adSms,
	        @RequestParam(value = "adEmail", required = false, defaultValue = "N") String adEmail,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("/buyer/mypage/mydetailpri [POST]");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		buyer.setbCode(buyerLogin.getbCode());
		buyer.setbCtCode(buyerLogin.getbCtCode());
		
		// 광고성 정보 수신 여부
		buyer.setAdSms(adSms);
		buyer.setAdEmail(adEmail);
		
		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		
		// 기존 비밀번호 유지
		if(buyer.getbPw() == null || buyer.getbPw().isEmpty()) {
			
			buyer.setbPw(currentBuyer.getbPw());
			
		}
		
		// 프로필 이미지 처리
		if(buyerProf != null && !buyerProf.isEmpty()) {
			
			String fileName = System.currentTimeMillis() + "_" + buyerProf.getOriginalFilename();
			String filePath = "D:/uploads/" + fileName;
			
			try {
				
				buyerProf.transferTo(new File(filePath));
				
				// 파일 이름을 세션에 저장
				session.setAttribute("buyerProfName", fileName);
				
			} catch (IOException e) {
				
				model.addAttribute("error", "파일 업로드 실패: " + e.getMessage());
				
				return "redirect:/buyer/mypage/mydetailpri";
				
			}
			
		}
		
		int updateResult = buyerService.updateBuyerDetail(buyer);
		
		if(updateResult == 0) {
			
			logger.info("업데이트 실패: {}", buyer);
			
			model.addAttribute("error", "업데이트 실패");
			
			return "redirect:/buyer/mypage/mydetailpri";
			
		}
		
		model.addAttribute("success", "개인 정보가 수정되었습니다.");
		
		return "redirect:/buyer/mypage/mydetailpri";
		
	}
	
	// 회원 정보 변경 (기업)
	@GetMapping("/mydetailcmp")
	public String myDetailCmp(
			Authentication authentication,
			Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("/buyer/mypage/mydetailcmp [GET]");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		Cmp currentCmp = buyerService.getCmpDetail(buyerLogin.getbCode());
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("currentCmp", currentCmp);
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 회원 정보 변경 처리 (기업)
	@PostMapping("/mydetailcmp")
	public String myDetailCmpProc(
			Authentication authentication,
			Buyer buyer,
			Cmp cmp,
			@RequestParam("cmpFile") MultipartFile cmpFile,
			@RequestParam("cmpProf") MultipartFile cmpProf,
			@RequestParam(value = "adSms", required = false, defaultValue = "N") String adSms,
	        @RequestParam(value = "adEmail", required = false, defaultValue = "N") String adEmail,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("/buyer/mypage/mydetailcmp [POST]");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		buyer.setbCode(buyerLogin.getbCode());
		buyer.setbCtCode(buyerLogin.getbCtCode());
		
		// 광고성 정보 수신 여부
		buyer.setAdSms(adSms);
		buyer.setAdEmail(adEmail);
		
		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		
		// 기존 비밀번호 유지
		if(buyer.getbPw() == null || buyer.getbPw().isEmpty()) {
			
			buyer.setbPw(currentBuyer.getbPw());
			
		}
		
		// 프로필 이미지 처리
		if (cmpProf != null && !cmpProf.isEmpty()) {
            
			String fileName = System.currentTimeMillis() + "_" + cmpProf.getOriginalFilename();
			String filePath = "D:/uploads/" + fileName;

			try {
            
				cmpProf.transferTo(new File(filePath));
               
				// 파일 이름을 세션에 저장
				session.setAttribute("cmpProfName", fileName);
        
			} catch (IOException e) {
             
				model.addAttribute("error", "파일 업로드 실패: " + e.getMessage());
            
				return "redirect:/buyer/mypage/mydetailcmp";
            
			}
        
		}
		
		// 사업자 등록증 처리
		if(cmpFile != null && !cmpFile.isEmpty()) {
			
			String fileName = System.currentTimeMillis() + "_" + cmpFile.getOriginalFilename();
			String filePath = "D:/uploads/" + fileName;
			
			try {
				
				cmpFile.transferTo(new File(filePath));
				
				// 파일 이름을 세션에 저장
				session.setAttribute("cmpFileName", fileName);
				
			} catch (IOException e) {
				
				model.addAttribute("error", "사업자 등록증 업로드 실패: " + e.getMessage());
				
				return "/buyer/mypage/mydetailcmp";
				
			}
			
		}
		
		int updateBuyerResult = buyerService.updateBuyerDetail(buyer);
		int updateCmpResult = buyerService.updateCmpDetail(cmp);
		
		
		if(updateBuyerResult == 0 || updateCmpResult == 0) {
			
			logger.info("업데이트 실패: {}, {}",  buyer, cmp);
			
			model.addAttribute("error", "업데이트 실패");
			
			return "redirect:/buyer/mypage/mydetailcmp";
			
		}
		
		model.addAttribute("success", "기업 정보가 수정되었습니다.");
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제)
	@GetMapping("/myaddr")
	public String myAddr(
			Authentication authentication,
			Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
        if (buyerLogin == null) {
        
        	model.addAttribute("error", "로그인 해주세요.");
            
        	return "redirect:/buyer/login";
        
        }

        List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdr(buyerLogin.getbCode());
        
        model.addAttribute("buyerAdrList", buyerAdrList);
        
        return "/buyer/mypage/myaddr";
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제) 처리
	@PostMapping("/myaddr")
	public String myAddrProc(
			Authentication authentication,
			@RequestParam("action") String action, 
			@RequestParam(value = "adrCode", required = false) String adrCode,
			@RequestParam(value = "adrName", required = false) String adrName, 
			@RequestParam(value = "adrPhone", required = false) String adrPhone, 
			@RequestParam(value = "adrPostcode", required = false) String adrPostcode, 
			@RequestParam(value = "adrAddr", required = false) String adrAddr, 
			@RequestParam(value = "adrDetail", required = false) String adrDetail,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
        if (buyerLogin == null) {
        
        	model.addAttribute("error", "로그인 해주세요.");
        	
        	return "redirect:/buyer/login";
        
        }

        String bCode = buyerLogin.getbCode();

        if("register".equals(action)) {
        	
        	BuyerAdr buyerAdr = new BuyerAdr();
        	
        	buyerAdr.setbCode(bCode);
        	buyerAdr.setAdrName(adrName);
        	buyerAdr.setAdrPhone(adrPhone);
        	buyerAdr.setAdrPostcode(adrPostcode);
        	buyerAdr.setAdrAddr(adrAddr);
        	buyerAdr.setAdrDetail(adrDetail);
        	buyerAdr.setAdrChk("N");
        	
        	buyerService.registerBuyerAdr(buyerAdr);
        	
        } else if ("update".equals(action)) {
        	
        	BuyerAdr buyerAdr = new BuyerAdr();
        	
        	buyerAdr.setAdrCode(adrCode);
        	buyerAdr.setAdrName(adrName);
        	buyerAdr.setAdrPhone(adrPhone);
        	buyerAdr.setAdrPostcode(adrPostcode);
        	buyerAdr.setAdrAddr(adrAddr);
        	buyerAdr.setAdrDetail(adrDetail);
                
        	buyerService.updateBuyerAdr(buyerAdr);
        	
        } else if ("delete".equals(action)) {
        	
        	buyerService.deleteBuyerAdr(adrCode);
        	
        } else if ("setDefault".equals(action)) {
        	
        	buyerService.unsetDefaultAdr(bCode);
        	buyerService.setDefaultAdr(adrCode, bCode);
        	
        }
        
        List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdr(bCode);
        
        model.addAttribute("buyerAdrList", buyerAdrList);
        
        return "buyer/mypage/myaddr";

	}
	
	// 회원 탈퇴
	@GetMapping("/outbuyer")
	public String outBuyer(
			@AuthenticationPrincipal BuyerLogin buyerLogin,
			Model model) {
		
		logger.info("/buyer/mypage/outbuyer [GET]");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		return "/buyer/mypage/outbuyer";
		
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
		
//		if(buyerService.verifyPw(buyer.getbId(), password) == 0) {
//			
//			model.addAttribute("error", "비밀번호가 틀렸습니다.");
//			
//			return "/buyer/mypage/outbuyer";
//			
//		}
		
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
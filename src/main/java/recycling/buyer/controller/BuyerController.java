package recycling.buyer.controller;

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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.CmpFile;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.seller.Change;
import recycling.page.face.PageService;
import recycling.seller.service.face.SellingService;
import recycling.util.PagingAndCtg;

//마이페이지 - 회원 정보 관련
@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyerService buyerService;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	@Autowired HttpSession session;
	@Autowired private JavaMailSenderImpl mailSender;
	@Autowired private PageService pageService;
	@Autowired private SellingService sellingService;
	
	@GetMapping("/cart")
	public void cart(Authentication authentication, Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg) {

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
        // 문의글 페이지 수 계산
  		PagingAndCtg upPaging = new PagingAndCtg();
  		
  		upPaging = pageService.upPageBuyer(curPage, sCtg, search, buyerLogin.getbCode());

  		int upPage = buyerService.selectCntAllCart(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        
  		logger.info("upPaging : {}", upPaging);
  		upPaging.setUser(buyerLogin.getbCode());
  		
  		
        
		// 해당 session의 Cart List 정보
		List<CartOrder> bf_list = buyerService.selectAllCart(upPaging);

		// 재고 부족 알림 메시지
		String msg = "";

		// 현재 상품 재고과 장바구니에 담긴 상품 수량 확인
		for (CartOrder e : bf_list) {
			Integer count = buyerService.selectPrdCnt(e.getPrdCode());
			logger.info("prd count : {}", count);
			logger.info("cart count : {}", e.getcCnt());

			// 재고가 부족할시 장바구니에서 DELETE
			if (count < e.getcCnt()) {

				// 처음이 아닐때 컴마 추가
				if (msg != "") {
					msg += ", ";
				}
				//
				msg += e.getPrdName();

				logger.info("{} 상품의 재고가 부족합니다", e.getPrdName());
				int res = buyerService.deleteCart(e.getcCode());

			}
		}

		// msg가 빈칸이 아닐시 메시지 추가
		if (msg != "") {
			msg += " 상품의 수량이 부족하여 장바구니에서 제외되었습니다.";
		}

		List<CartOrder> list = buyerService.selectAllCart(upPaging);

		// logger.info("{}",msg);
		// logger.info("{}", list);

		model.addAttribute("list", list);
		model.addAttribute("msg", msg);
		model.addAttribute("buyerLogin", buyerLogin);
		
		//paging
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/buyer/mypage/cart");
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
		
		//아이디 상세 가져오기
		Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		
		//배송지 주소 가져오기
		List<BuyerAdr> buyeradr = buyerService.selectBybCode(bCode); 
		
		//선택한 주문카트 리스트
		List<CartOrder> list = new ArrayList<CartOrder>();
		
		for (String cCode : checkList) {
			CartOrder cart = buyerService.selectBycCode(cCode);
         
         list.add(cart);
     }
		
		logger.info("buyer : {}", buyeradr);
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("clist", list);
		model.addAttribute("buyeradr", buyeradr);
	}
	
	@PostMapping("/pay")
	public String payProc(
				Authentication authentication
				,Orders order
				, Model model
				, @RequestParam("cartList[]") List<String> cartList
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
	public void myOrder(Authentication authentication, Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg) {

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		
		
		// 문의글 페이지 수 계산
  		PagingAndCtg upPaging = new PagingAndCtg();
  		
  		//
  		upPaging = pageService.upPageBuyer(curPage, sCtg, search, buyerLogin.getbCode());

  		
  		int upPage = buyerService.selectCntOrderDetailBybCode(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        
  		logger.info("upPaging : {}", upPaging);
  		upPaging.setUser(buyerLogin.getbCode());

		List<MyOrder> list = buyerService.selectOrderDetailBybCode(upPaging);

		model.addAttribute("list", list);
		model.addAttribute("buyerLogin", buyerLogin);
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/buyer/mypage/myorder");
	}
	
	@GetMapping("/myorderdetail")
	public void myOrderDetail(String orddtCode, Model model) {
		OrderDetail orderDetail = buyerService.selectByorddtCode(orddtCode);
		Orders order = buyerService.selectByordCode(orderDetail.getOrdCode());
		
		logger.info("orderDetail: {}",orderDetail);
		logger.info("order: {}",order);
		
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("order", order);
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

	
	@PostMapping("/chageorder")
	public String chageOrder(OrderDetail orderDetail, Model model) {
		logger.info("orerDetail: {}",orderDetail);
		
		int sttNo = orderDetail.getSttNo();
		
		if(sttNo == 980) {
			//토큰 발급
			String token = sellingService.getToken();
			
			String orddtCode = orderDetail.getOrddtCode();
			
			String successRes = "";
			String failRes = "";
				
			//OrderDetail 조회
			OrderDetail order = sellingService.selectByorddtCode(orddtCode); 
			logger.info("order: {}",order);
			
			//주문 취소(환불)
			int res = sellingService.cencelpay(order, token);
			
			if(res == 1) {
				OrderDetail ordd = new OrderDetail();
				ordd.setOrddtCode(orddtCode);
				ordd.setSttNo(sttNo);
				int updateRes = sellingService.updateOrderDetail(ordd);
				if(successRes != "") {
					successRes += ", ";					
				}
				successRes += orddtCode;
	        	
			} else {
				if(failRes != "") {
					failRes += ", ";					
				}
				failRes += orddtCode;
			}
			
			
			if(successRes != "") {
				successRes += "환불 완료";
			}
			
			if(failRes != "") {
				failRes += "환불 실패";					
			}
			
			model.addAttribute("Msg", successRes + failRes);
		
		} else {
			int updateRes = sellingService.updateOrderDetail(orderDetail);
			
			model.addAttribute("Msg", "변경");
		}
		
		return "jsonView";
	}
	
	@PostMapping("/changeOrderCt")
	public String changeOrderCt(OrderDetail orderDetail, Change change) {
		logger.info("orderDetail : {}", orderDetail);
		logger.info("change: {}", change);
		
		int updateRes = sellingService.updateOrderDetail(orderDetail);
		
		//orddtCode 추가
		change.setOrddtCode(orderDetail.getOrddtCode());
		
		int insertRes = buyerService.insertChange(change);
		
		return "redirect:/buyer/mypage/myorder";
	}
	
	@GetMapping("/myorderchk")
	public void myOrderChk() {
		
		
		
	}
	
	// 회원 정보 관리 메인 (비밀번호 입력)
	@GetMapping("/mymain")
	public String myMain(Authentication authentication, Model model) {

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("/buyer/mypage/mymain [GET]");
		
		if (buyerLogin == null) {
	        
			model.addAttribute("msg", "로그인 해주세요.");
	        model.addAttribute("url", "/buyer/login");
	        
	        return "/layout/alert";
	    
		}
		
		model.addAttribute("buyerLogin", buyerLogin);
		
		if(session.getAttribute("authenticated") == null || !(boolean) session.getAttribute("authenticated")) {
	        
			return "/buyer/mypage/mymain";
	    
		}

		return "/buyer/mypage/mymain";

	}

	// 회원 정보 관리 메인 (비밀번호 입력) 처리
	@PostMapping("/mymain")
	public String myMainProc(Authentication authentication, String password, Model model) {

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("/buyer/mypage/mymain [POST]");

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		// 비밀번호 확인
		if (!pwEncoder.matches(password, buyerLogin.getbPw())) {
			
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			model.addAttribute("url", "/buyer/mypage/mymain");

			return "/layout/alert";
		
		}
		
		session.setAttribute("authenticated", true);
		session.setAttribute("buyerLogin", buyerLogin);

		if (buyerLogin.getbCtCode().equals("P")) {

			return "redirect:/buyer/mypage/mypagepri";

		} else if (buyerLogin.getbCtCode().equals("C")) {

			return "redirect:/buyer/mypage/mypagecmp";

		} else {

			model.addAttribute("msg", "다시 로그인 해주세요.");
			model.addAttribute("url", "/buyer/mypage/mymain");

			return "/layout/alert";

		}

	}

	// 개인 마이페이지 메인화면
	@GetMapping("/mypagepri")
	public String myPagePri(Authentication authentication, Model model) {

		logger.info("/buyer/mypage/mypagepri [GET]");

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("buyerLogin: {}", buyerLogin);

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		if(session.getAttribute("authenticated") == null || !(boolean) session.getAttribute("authenticated")) {
			
			return "/buyer/mypage/mymain";
			
		}

		Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		BuyerRank buyerRank = buyerService.getBuyerRank(buyer.getRankNo());
		BuyerProf buyerProf = buyerService.getBuyerProf(buyerLogin.getbCode());

		logger.info("buyer: {}", buyer);
        logger.info("buyerRank: {}", buyerRank);
        logger.info("buyerProf: {}", buyerProf);
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("buyerRank", buyerRank);
		model.addAttribute("buyerProf", buyerProf);
		model.addAttribute("buyerLogin", buyerLogin);
		
		return "/buyer/mypage/mypagepri";

	}

	// 기업 마이페이지 메인화면
	@GetMapping("/mypagecmp")
	public String myPageCmp(Authentication authentication, Model model) {

		logger.info("/buyer/mypage/mypagecmp [GET]");

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("buyerLogin: {}", buyerLogin);

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		if(session.getAttribute("authenticated") == null || !(boolean) session.getAttribute("authenticated")) {
			
			return "/buyer/mypage/mymain";
			
		}

		Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		Cmp cmp = buyerService.getCmpDetail(buyerLogin.getbCode());
		BuyerProf buyerProf = buyerService.getBuyerProf(buyerLogin.getbCode());
		CmpFile cmpFile = buyerService.getCmpFile(cmp.getCmpNo());

		logger.info("buyer: {}", buyer);
        logger.info("cmp: {}", cmp);
        logger.info("buyerProf: {}", buyerProf);
        logger.info("cmpFile: {}", cmpFile);
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("cmp", cmp);
		model.addAttribute("buyerProf", buyerProf);
		model.addAttribute("cmpFile", cmpFile);
		model.addAttribute("buyerLogin", buyerLogin);
		
		return "/buyer/mypage/mypagecmp";

	}

	// 비밀번호 변경 페이지
	@GetMapping("/changepw")
	public String changePw(Authentication authentication, Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		if(session.getAttribute("authenticated") == null || !(boolean) session.getAttribute("authenticated")) {
			
			return "/buyer/mypage/mymain";
			
		}
		
		logger.info("/buyer/mypage/changepw [GET]");

		model.addAttribute("buyerLogin", buyerLogin);

		return "buyer/mypage/changepw";

	}

	// 비밀번호 변경 처리
	@PostMapping("/changepw")
	public String changePwProc(Authentication authentication, 
			@RequestParam("newPw") String newPw,
			Model model) {

		logger.info("/buyer/mypage/changepw [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		buyerService.changePw(buyerLogin, pwEncoder.encode(newPw));

		model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		model.addAttribute("url", "/buyer/mypage/changepw");

		return "/layout/alert";

	}

	// 회원 정보 변경 (개인)
	@GetMapping("/mydetailpri")
	public String myDetailPri(Authentication authentication, Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		logger.info("/buyer/mypage/mydetailpri [GET]");

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		if(session.getAttribute("authenticated") == null || !(boolean) session.getAttribute("authenticated")) {
			
			return "/buyer/mypage/mymain";
			
		}

		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		BuyerRank buyerRank = buyerService.getBuyerRank(currentBuyer.getRankNo());
		BuyerProf buyerProf = buyerService.getBuyerProf(buyerLogin.getbCode());

		logger.info("currentBuyer: {}", currentBuyer);
        logger.info("buyerRank: {}", buyerRank);
        logger.info("buyerProf: {}", buyerProf);
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("buyerRank", buyerRank);
		model.addAttribute("buyerProf", buyerProf);
		model.addAttribute("buyerLogin", buyerLogin);

		return "/buyer/mypage/mydetailpri";

	}

	// 회원 정보 변경 처리 (개인)
	@PostMapping("/mydetailpri")
	public String myDetailPriProc(Authentication authentication, Buyer buyer,
			@RequestParam(value = "adSms", required = false, defaultValue = "N") String adSms,
			@RequestParam(value = "adEmail", required = false, defaultValue = "N") String adEmail,
			@RequestParam(value = "emailNum", required = false) Integer emailNum,
			@RequestParam("buyerProf") MultipartFile buyerProf, 
			@RequestParam("bPhone1") String bPhone1,
	        @RequestParam("bPhone2") String bPhone2,
	        @RequestParam("bPhone3") String bPhone3,
	        @RequestParam("fullEmail") String fullEmail,
			Model model) {

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		logger.info("prof : {}", buyerProf);
		
		logger.info("/buyer/mypage/mydetailpri [POST]");

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}

		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
	    boolean emailChanged = !fullEmail.equals(currentBuyer.getbEmail());

	    if(emailChanged) {
	        
	    	Integer sessionEmailAuthCode = (Integer) session.getAttribute("emailAuthCode");
	        
	    	if(emailNum == null || sessionEmailAuthCode == null || !emailNum.equals(sessionEmailAuthCode)) {
	        
	    		model.addAttribute("msg", "이메일 인증을 완료해주세요.");
	    		model.addAttribute("url", "/buyer/mypage/mydetailpri");
	            
	    		return "/layout/alert";
	        
	    	}
	    
	    }
	    
		buyer.setbCode(buyerLogin.getbCode());
		buyer.setbCtCode(buyerLogin.getbCtCode());
		buyer.setAdSms(adSms);
		buyer.setAdEmail(adEmail);
		buyer.setbEmail(fullEmail);

		// 기존 비밀번호 유지
		if (buyer.getbPw() == null || buyer.getbPw().isEmpty()) {

			buyer.setbPw(currentBuyer.getbPw());

		}

		// 프로필 이미지 업데이트
		if (!buyerProf.isEmpty()) {

			logger.info("Uploading profile image: {}", buyerProf.getOriginalFilename());
			
			BuyerProf updateProf = buyerService.updateBuyerProf(buyerProf, buyerLogin.getbCode());

			if (updateProf == null) {

				logger.info("Failed to save profile image");
				model.addAttribute("error", "프로필 이미지 저장 실패");

				return "redirect:/buyer/mypage/mydetailpri";

			}
			
			int res = buyerService.updateBuyerProfMapper(updateProf);
			
			logger.info("Profile image updated: {}", updateProf);
			

		}
		
		// 전화번호 설정
		String bPhone = bPhone1 + "-" + bPhone2 + "-" + bPhone3;
	    buyer.setbPhone(bPhone);
	    
		int updateResult = buyerService.updateBuyerDetail(buyer);

		if (updateResult == 0) {

			logger.info("업데이트 실패: {}", buyer);

			model.addAttribute("error", "업데이트 실패");

			return "redirect:/buyer/mypage/mydetailpri";

		}

		model.addAttribute("msg", "개인 정보가 수정되었습니다.");
		model.addAttribute("url", "/buyer/mypage/mydetailpri");

		return "/layout/alert";

	}

	// 회원 정보 변경 (기업)
	@GetMapping("/mydetailcmp")
	public String myDetailCmp(
			Authentication authentication,
			Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		logger.info("/buyer/mypage/mydetailcmp [GET]");

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		if(session.getAttribute("authenticated") == null || !(boolean) session.getAttribute("authenticated")) {
			
			return "/buyer/mypage/mymain";
			
		}

		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		Cmp currentCmp = buyerService.getCmpDetail(buyerLogin.getbCode());
		BuyerProf buyerProf = buyerService.getBuyerProf(currentBuyer.getbCode());

		logger.info("currentBuyer: {}", currentBuyer);
        logger.info("currentCmp: {}", currentCmp);
        logger.info("buyerProf: {}", buyerProf);
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("currentCmp", currentCmp);
		model.addAttribute("buyerProf", buyerProf);
		model.addAttribute("buyerLogin", buyerLogin);

		return "/buyer/mypage/mydetailcmp";

	}

	// 회원 정보 변경 처리 (기업)
	@PostMapping("/mydetailcmp")
	public String myDetailCmpProc(
			Authentication authentication, 
			Buyer buyer, 
			Cmp cmp,
			@RequestParam(value = "adSms", required = false, defaultValue = "N") String adSms,
			@RequestParam(value = "adEmail", required = false, defaultValue = "N") String adEmail,
			@RequestParam(value = "emailNum", required = false) Integer emailNum,
			@RequestParam("buyerProf") MultipartFile buyerProf, 
			@RequestParam("cmpFile") MultipartFile cmpFile,
			@RequestParam("bPhone1") String bPhone1,
	        @RequestParam("bPhone2") String bPhone2,
	        @RequestParam("bPhone3") String bPhone3,
	        @RequestParam("fullEmail") String fullEmail,
			Model model
			) {

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		logger.info("/buyer/mypage/mydetailcmp [POST]");

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		Buyer currentBuyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		boolean emailChanged = !fullEmail.equals(currentBuyer.getbEmail());

		if(emailChanged) {
	        
	    	Integer sessionEmailAuthCode = (Integer) session.getAttribute("emailAuthCode");
	        
	    	if(emailNum == null || sessionEmailAuthCode == null || !emailNum.equals(sessionEmailAuthCode)) {
	        
	    		model.addAttribute("msg", "이메일 인증을 완료해주세요.");
	    		model.addAttribute("url", "/buyer/mypage/mydetailpri");
	            
	    		return "/layout/alert";
	        
	    	}
	    
	    }

		buyer.setbCode(buyerLogin.getbCode());
		buyer.setbCtCode(buyerLogin.getbCtCode());
		buyer.setAdSms(adSms);
		buyer.setAdEmail(adEmail);
		buyer.setbEmail(fullEmail);

		// 기존 비밀번호 유지
		if (buyer.getbPw() == null || buyer.getbPw().isEmpty()) {

			buyer.setbPw(currentBuyer.getbPw());

		}

		// 프로필 이미지 업데이트
		if (!buyerProf.isEmpty()) {

			logger.info("Uploading profile image: {}", buyerProf.getOriginalFilename());
			
			BuyerProf updateProf = buyerService.updateBuyerProf(buyerProf, buyerLogin.getbCode());

			if (updateProf == null) {

				logger.info("Failed to save profile image");
				
				model.addAttribute("error", "프로필 이미지 저장 실패");

				return "redirect:/buyer/mypage/mydetailcmp";

			}

			int res = buyerService.updateBuyerProfMapper(updateProf);
			
		}

		// 사업자 등록증 업데이트
		if (!cmpFile.isEmpty()) {

			CmpFile updateFile = buyerService.updateCmpFile(cmpFile, buyerLogin.getbCode());

			if (updateFile == null) {

				model.addAttribute("error", "사업자 등록증 저장 실패");

				return "redirect:/buyer/mypage/mydetailcmp";

			}
			
			int res = buyerService.updateCmpFileMapper(updateFile);

		}

		// 전화번호 설정
		String bPhone = bPhone1 + "-" + bPhone2 + "-" + bPhone3;
		buyer.setbPhone(bPhone);
		
		int updateBuyerResult = buyerService.updateBuyerDetail(buyer);
		int updateCmpResult = buyerService.updateCmpDetail(cmp);

		if (updateBuyerResult == 0 || updateCmpResult == 0) {

			logger.info("업데이트 실패: {}, {}", buyer, cmp);

			model.addAttribute("error", "업데이트 실패");

			return "redirect:/buyer/mypage/mydetailcmp";

		}

		model.addAttribute("msg", "기업 정보가 수정되었습니다.");
		model.addAttribute("url", "/buyer/mypage/mydetailcmp");

		return "layout/alert";

	}

	// 배송지 관리 페이지 (등록, 수정, 삭제)
	@GetMapping("/myaddr")
	public String myAddr(Authentication authentication, Model model) {

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdr(buyerLogin.getbCode());

		model.addAttribute("buyerAdrList", buyerAdrList);
		model.addAttribute("buyerLogin", buyerLogin);

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
			@RequestParam(value = "adrChk", required = false, defaultValue = "N") String adrChk,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
        if (buyerLogin == null) {
        
        	model.addAttribute("msg", "로그인 해주세요.");
        	model.addAttribute("url", "/buyer/login");

			return "/layout/alert";
        
        }
        
        String bCode = buyerLogin.getbCode();
        List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdr(bCode);

        if (adrChk == null) {
        
        	adrChk = "N";
        
        }
        
        if("register".equals(action)) {
        	
        	BuyerAdr buyerAdr = new BuyerAdr();
        	
        	buyerAdr.setbCode(bCode);
        	buyerAdr.setAdrName(adrName);
        	buyerAdr.setAdrPhone(adrPhone);
        	buyerAdr.setAdrPostcode(adrPostcode);
        	buyerAdr.setAdrAddr(adrAddr);
        	buyerAdr.setAdrDetail(adrDetail);

        	// 첫 배송지 등록 시 기본 배송지로 설정
            if (buyerAdrList.isEmpty()) {
            
            	buyerAdr.setAdrChk("Y");
            
            } else {
            
            	buyerAdr.setAdrChk("N");
            
            }
        	
        	buyerService.registerBuyerAdr(buyerAdr);
        	
        } else if ("update".equals(action)) {
        	
        	BuyerAdr buyerAdr = new BuyerAdr();
        	
        	buyerAdr.setAdrCode(adrCode);
        	buyerAdr.setAdrName(adrName);
        	buyerAdr.setAdrPhone(adrPhone);
        	buyerAdr.setAdrPostcode(adrPostcode);
        	buyerAdr.setAdrAddr(adrAddr);
        	buyerAdr.setAdrDetail(adrDetail);
        	buyerAdr.setAdrChk(adrChk);
                
        	buyerService.updateBuyerAdr(buyerAdr);
        	
        } else if ("delete".equals(action)) {
        	
        	buyerService.deleteBuyerAdr(adrCode);
        	
        } else if ("setDefault".equals(action)) {
        	
        	buyerService.unsetDefaultAdr(bCode);
        	buyerService.setDefaultAdr(adrCode, bCode);
        	
        }
        
        buyerAdrList = buyerService.getBuyerAdr(bCode);
        
        model.addAttribute("buyerAdrList", buyerAdrList);
        
        return "redirect:/buyer/mypage/myaddr";

	}

	// 회원 탈퇴
	@GetMapping("/outbuyer")
	public String outBuyer(
			Authentication authentication,
			Model model) {
		
		logger.info("/buyer/mypage/outbuyer [GET]");

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		if (buyerLogin == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		model.addAttribute("buyerLogin", buyerLogin);

		return "/buyer/mypage/outbuyer";
		
	}

	// 회원 탈퇴 처리
	@PostMapping("/outbuyer")
	public String outBuyerProc(String password, Authentication authentication,
			@RequestParam(value = "privacyConsent", required = false) String ps,
			@RequestParam(value = "infoConsent", required = false) String is, Model model) {

		logger.info("/buyer/mypage/outbuyer [POST]");

		if (authentication == null) {

			model.addAttribute("msg", "로그인 해주세요.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		}
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		if (!pwEncoder.matches(password, buyerLogin.getbPw())) {

			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			model.addAttribute("url", "/buyer/mypage/outbuyer");

			return "/layout/alert";

		}

		if ("agree".equals(ps) && "agree".equals(is)) {

			buyerService.deleteBuyer(buyerLogin.getbCode());

			// 구매자가 판매자인 경우, 판매자 탈퇴 처리
			if ("Y".equals(buyerLogin.getsChk())) {

				buyerService.deleteSeller(buyerLogin.getsCode());

			}

			SecurityContextHolder.clearContext();

			session.invalidate();
			
			model.addAttribute("msg", "회원탈퇴 되었습니다.");
			model.addAttribute("url", "/buyer/login");

			return "/layout/alert";

		} else {

			model.addAttribute("msg", "모든 약관에 동의해주세요.");
			model.addAttribute("url", "/buyer/mypage/outbuyer");

			return "/layout/alert";

		}

	}
	
}
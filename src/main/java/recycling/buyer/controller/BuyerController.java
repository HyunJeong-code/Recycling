package recycling.buyer.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BuyerService buyerService;
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
		
		logger.info("{}",msg);
		
		logger.info("{}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("msg", msg);
	}
	
	@PostMapping("/cartupdate")
	public String cartupdate(Cart cart) {
		logger.info("cartupdate : {}", cart);
		
		int res = buyerService.updatecCnt(cart);
		
		return "jsonView";
	}
	
	@GetMapping("/pay")
	public void pay(
			@RequestParam List<String> checkList,
			Model model
			) {
		logger.info("checkList : {}", checkList);
		
		//테스트용 세션***********************************************테스트
		session.setAttribute("bCode", "BUY0000002");
		
		String bCode = (String)session.getAttribute("bCode");
		
		BuyerAdr buyeradr = buyerService.selectBybCode(bCode); 
		
		List<CartOrder> list = new ArrayList<CartOrder>();
		
		for (String cCode : checkList) {
			CartOrder cart = buyerService.selectBycCode(cCode);
            
            list.add(cart);
        }
		
		logger.info("list : {}", list);
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
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패: {}", e.getMessage());
			e.printStackTrace();
			return 0;
		}
		
		return chkNum;
	}
	
    @RequestMapping("/uploads/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
        Path file = Paths.get("D:/uploads").resolve(filename);
        Resource resource = null;
        try {
            resource = new UrlResource(file.toUri());
        } catch (MalformedURLException e) {
            logger.error("파일 URL 생성 실패: {}", e.getMessage());
        }
        
        if (resource != null && resource.exists() && resource.isReadable()) {
            return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
                    "attachment; filename=\"" + resource.getFilename() + "\"").body(resource);
        } else {
            logger.error("파일을 읽을 수 없거나 존재하지 않음: {}", filename);
            return ResponseEntity.status(404).body(null);
        }
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
	public String myMainProc(String password, Model model) {
		
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
	public String changePw(Model model) {
		
		if(session.getAttribute("buyers") == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		logger.info("/buyer/mypage/changepw [GET]");
		
		return "buyer/mypage/changepw";
		
	}
	
	// 비밀번호 변경 처리
	@PostMapping("/changepw")
	public String changePwProc(
			@RequestParam("currentPw") String currentPw,
			@RequestParam("newPw") String newPw,
			@RequestParam("confirmPw") String confirmPw,
			Model model
			) {
		
		logger.info("/buyer/mypage/changepw [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		if(!buyerService.verifyPw(buyerLogin.getbId(), currentPw)) {
			
			model.addAttribute("error", "현재 비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		if(!newPw.equals(confirmPw)) {
			
			model.addAttribute("error", "새 비밀번호가 일치하지 않습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		buyerService.changePw(buyerLogin.getbId(), newPw);
		
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
	public String myDetailPriProc(
			Buyer buyer,
			@RequestParam("buyerProf") MultipartFile buyerProf, 
			@RequestParam(value = "adSms", required = false, defaultValue = "N") String adSms,
	        @RequestParam(value = "adEmail", required = false, defaultValue = "N") String adEmail,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailpri [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
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
		
		boolean updateResult = buyerService.updateBuyerDetail(buyer);
		
		if(!updateResult) {
			
			logger.info("업데이트 실패: {}", buyer);
			
			model.addAttribute("error", "업데이트 실패");
			
			return "redirect:/buyer/mypage/mydetailpri";
			
		}
		
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
		Cmp currentCmp = buyerService.getCmpDetail(buyerLogin.getbCode());
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("currentCmp", currentCmp);
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 회원 정보 변경 처리 (기업)
	@PostMapping("/mydetailcmp")
	public String myDetailCmpProc(
			Buyer buyer,
			Cmp cmp,
			@RequestParam("cmpFile") MultipartFile cmpFile,
			@RequestParam("cmpProf") MultipartFile cmpProf,
			@RequestParam(value = "adSms", required = false, defaultValue = "N") String adSms,
	        @RequestParam(value = "adEmail", required = false, defaultValue = "N") String adEmail,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailcmp [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
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
		
		boolean updateResult = buyerService.updateBuyerDetail(buyer) && buyerService.updateCmpDetail(cmp);
		
		if(!updateResult) {
			
			logger.info("업데이트 실패: {}, {}",  buyer, cmp);
			
			model.addAttribute("error", "업데이트 실패");
			
			return "redirect:/buyer/mypage/mydetailcmp";
			
		}
		
		model.addAttribute("success", "기업 정보가 수정되었습니다.");
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제)
	@GetMapping("/myaddr")
	public String myAddr(Model model) {
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
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
			@ModelAttribute BuyerAdr buyerAdr, 
			@RequestParam("action") String action, 
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
        if (buyerLogin == null) {
        
        	model.addAttribute("error", "로그인 해주세요.");
            
        	return "redirect:/buyer/login";
        
        }

        buyerAdr.setbCode(buyerLogin.getbCode());

        switch (action) {

        	case "register":
            
        		if (buyerService.cntBuyerAdr(buyerLogin.getbCode()) >= 3) {
                
        			model.addAttribute("error", "추가 배송지는 최대 2개까지 만들 수 있습니다.");
                
        		} else {
                
        			buyerService.registerBuyerAdr(buyerAdr);
            
        		}
                
        		break;
            
        	case "update":
            
        		buyerService.updateBuyerAdr(buyerAdr);
                
        		break;
            
        	case "delete":
            
        		buyerService.deleteBuyerAdr(buyerAdr.getAdrCode());
                
        		break;
            
        	case "setDefault":
            
        		buyerService.setDefaultAdr(buyerAdr.getAdrCode(), buyerLogin.getbCode());
                
        		break;
        
        }

        return "redirect:/buyer/mypage/myaddr";

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
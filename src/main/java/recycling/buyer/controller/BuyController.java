package recycling.buyer.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.service.face.BuyService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.util.CurrentUser;

// 구매자 메인페이지, 로그인/회원가입

@Controller
@RequestMapping("/buyer")
public class BuyController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyService buyService;
//	@Autowired private LoginServiceImpl loginService;
	@Autowired private JavaMailSenderImpl mailSender;
	
	@GetMapping("/main")
	public void main(
//			@AuthenticationPrincipal(expression = "buyerLogin") BuyerLogin buyerLogin,
			@AuthenticationPrincipal BuyerLogin buyerLogin,
			@CurrentUser BuyerLogin buyer,
			HttpSession session
			) {
		logger.info("/buyer/main [GET]");
		
		logger.info("@auth : {}", buyerLogin);		
		logger.info("@auth : {}, {}", buyerLogin.getUsername(), buyerLogin.getPassword());		
		
		logger.info("@current : {}", buyer);
		logger.info("@current : {}, {}", buyer.getUsername(), buyer.getPassword());
		
	}
	
	@GetMapping("/join")
	public void join() {
		logger.info("/buyer/join [GET]");
	}
	
	@PostMapping("/EmailAuth")
	@ResponseBody
	public int emailAuth(String email) {
		logger.info("/buyer/EmailAuth [POST]");
		
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
	
	@GetMapping("/prijoin")
	public void priJoin() {
		logger.info("/buyer/prijoin [GET]");
	}
	
	@PostMapping("/prijoin")
	public void priJoinProc(Buyer buyer, BuyerAdr buyerAdr, MultipartFile buyerProf, String bEmail2, String mPhone, String lPhone) {
		logger.info("/buyer/prijoin [POST]");		
		
		logger.info("buyer : {}", buyer);
		// 회원 정보 처리
		buyer = buyService.buyerProc(buyer, bEmail2, mPhone, lPhone);
		logger.info("buyer : {}", buyer);
		
		int stepOne = buyService.insertBuyer(buyer);
		
		if(stepOne == 0) {
			logger.info("회원가입 실패");
		} else {
			logger.info("buyer : {}", buyer);			
		}
		
		logger.info("buyerAdr : {}", buyerAdr);
		logger.info("buyerProf : {}", buyerProf);
	}
	
	@GetMapping("/cmpjoin")
	public void cmpJoin() {
		logger.info("/buyer/cmpjoin [GET]");				
	}
	
	@PostMapping("/cmpjoin")
	public void cmpJoinProc() {
		logger.info("/buyer/cmpjoin [POST]");						
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("/buyer/login [GET]");
	}
	
	@PostMapping("/login")
	public String loginProc(Buyer buyer, HttpSession session) {
		logger.info("/buyer/login [POST]");
		
		logger.info("login : {}", buyer);
		
		BuyerLogin buyers = buyService.selectBybIdbPw(buyer);
		
		if(buyers != null && buyers.getbOut().equals("N")) {
			session.setAttribute("buyers", buyers);
			return "redirect:./main";
		} else {
			session.invalidate();
			return "redirect:./loginfail";
		}
	}
	
	@GetMapping("/loginfail")
	public void loginFail() {
		logger.info("/buyer/loginfail [GET]");
	}
	
	@GetMapping("/findid")
	public void findId() {
		logger.info("/buyer/findid [GET]");
	}
	
	@PostMapping("/findid")
	public String findIdProc(Model model, Buyer buyer, String bEmail2, String mPhone, String lPhone) {
		logger.info("/buyer/findid [POST]");
		
		buyer = buyService.buyerProc(buyer, bEmail2, mPhone, lPhone);
		logger.info("findId : {}", buyer);
		
		String bId = buyService.selectByBuyerId(buyer);
		model.addAttribute("bId", bId);
		
		return "/buyer/infoid";
	}
	
	@GetMapping("/infoid")
	public void infoId() {
		logger.info("/buyer/infoid [GET]");
	}
	
	@GetMapping("/findpw")
	public void findPw() {
		logger.info("/buyer/findpw [GET]");
	}
	
	@PostMapping("/findpw")
	public String findPwProc(Model model, Buyer buyer, String bEmail2, String mPhone, String lPhone) {
		logger.info("/buyer/findpw [POST]");
		
		buyer = buyService.buyerProc(buyer, bEmail2, mPhone, lPhone);
		
		logger.info("findPw : {}", buyer);
		
		buyer = buyService.selectByBuyerPw(buyer);
		model.addAttribute("buyer", buyer);
		if(buyer != null) {
			model.addAttribute("buyer", buyer);
		}
		
		return "/buyer/changepw";
	}
	
	@GetMapping("/changepw")
	public void changePw() {
		logger.info("/buyer/changePw [GET]");
	}
	
	@PostMapping("/changepw")
	public String changePwProc(Buyer buyer) {
		logger.info("/buyer/changePw [POST]");
		
		// 비밀번호 암호화 처리 필요
		logger.info("findPw : {}", buyer);
		
		int res = buyService.updatePw(buyer);
		
		if(res > 0) {
			return "/buyer/login";
		} else {
			return "/buyer/findpw";
		}
	}
}

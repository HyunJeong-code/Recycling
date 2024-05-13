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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.service.face.BuyService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;

// 구매자 메인페이지, 로그인/회원가입

@Controller
@RequestMapping("/buyer")
public class BuyController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyService buyService;
	@Autowired private JavaMailSenderImpl mailSender;
	
	@GetMapping("/main")
	public void main(
//			@AuthenticationPrincipal Buyers buyer,
			HttpSession session
			) {
		BuyerLogin buyer = (BuyerLogin) session.getAttribute("buyers");
		logger.info("/buyer/main [GET]");
		
		logger.info("{}", buyer);
		
//		Object pri = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		Buyers test = (Buyers) pri;
//		String username = test.getUsername();
//		String userId = test.getbId();
//		
//		logger.info("{}, {}", username, userId);
	}
	
	@GetMapping("/join")
	public void join() {
		logger.info("/buyer/join [GET]");
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
	
	@GetMapping("/prijoin")
	public void priJoin() {
		logger.info("/buyer/prijoin [GET]");
	}
	
	@PostMapping("/prijoin")
	public void priJoinProc(Buyer buyer, BuyerAdr buyerAdr, MultipartFile buyerProf, String bEmail2, String mPhone, String lPhone) {
		logger.info("/buyer/prijoin [POST]");		
		
		logger.info("buyer : {}", buyer);
		// 회원 정보 처리
		buyer = buyService.priProc(buyer, bEmail2, mPhone, lPhone);
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
		
		if(buyers != null ) {
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
}

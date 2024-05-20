package recycling.manager.controller;


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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.Notice;
import recycling.manager.service.face.MgrService;
import recycling.util.Paging;


// 관리자 메인 페이지 + 로그인, 회원가입 + 사원 전체 조회, 공지사항

@Controller
@RequestMapping("/manager")
public class MgrController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrService mgrService;
	@Autowired private JavaMailSenderImpl mailSender;
	
	@GetMapping("/main")
	public void main(HttpSession session) {
		logger.info("/manager/main [GET]");
	}
	
	@GetMapping("/join")
	public void join() {
		logger.info("/manager/join [GET]");
	}
	
	// 이메일 인증
	@PostMapping("/EmailAuth")
	@ResponseBody
	public int emailAuth(String email) {
		logger.info("/manager/EmailAuth [POST]");
		
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
	
	@PostMapping("/join")
	public void joinProc() {
		logger.info("/manager/join [POST]");		
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("/manager/login [GET]");		
	}
	
	@PostMapping("login")
	public String loginProc(HttpSession session, Manager manager) {
		logger.info("/manager/login [POST]");
		
		ManagerLogin mgr = mgrService.selectByIdPw(manager);
		
		if(mgr != null) {
			session.setAttribute("mgr", mgr);
			return "redirect:./main";
		} else {
			session.invalidate();
			return "redirect:./loginfail";
		}
	}
	
	//공지사항 전체조회
	@GetMapping("/noticelist")
	public String noticeList(
			Model model,
			Paging pagingParam	//페이징 객체
			) {
		logger.info("controller: noticeList[GET]");
		
		
		//페이징 계산, 검색기능
		Paging paging = mgrService.selectCntAll(pagingParam);
		
		//전체 조회기능
		List<Notice> list = mgrService.selectAll(paging);
		
		//JSP로 보내기
		model.addAttribute("paging", paging);
		model.addAttribute("notice", list);
		
		logger.info("controller: noticelist : {}", list);
		
		
		return "/manager/noticelist";
		
	}
	
	//공지사항 상세 조회
	@GetMapping("/noticedetail")
	public void noticeDetail(Notice notice, Model model) {
//			logger.info("controller: noticeDetail[Get]");
			Notice view = mgrService.selectDetail(notice);
			
			model.addAttribute("view", view);
//			logger.info("noticeDetail:{}", view );
			
	}
}

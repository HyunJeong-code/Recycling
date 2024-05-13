package recycling.manager.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.jdbc.proxy.annotation.Post;
import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.manager.service.face.MgrService;

// 관리자 메인 페이지 + 로그인, 회원가입 + 사원 전체 조회, 공지사항

@Controller
@RequestMapping("/manager")
public class MgrController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrService mgrService;
	
	@GetMapping("/main")
	public void main(HttpSession session) {
		logger.info("/manager/main [GET]");
	}
	
	@GetMapping("/join")
	public void join() {
		logger.info("/manager/join [GET]");
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

}

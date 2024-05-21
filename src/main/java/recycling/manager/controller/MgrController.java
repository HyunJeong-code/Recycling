package recycling.manager.controller;


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

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.Notice;
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
	
	//공지사항 전체조회
	@GetMapping("/noticelist")
	public void noticeList(
			Model model
			) {
		//관리자 공지사항 전체조회
		List<Notice> mgrNoticeList = mgrService.selectAll();
		model.addAttribute("notice", mgrNoticeList);
	}
	
	//공지사항 상세 조회
	@GetMapping("/noticedetail")
	public void noticeDetail(
			String ntcCode
			, Model model
			) {
			//관리자 공지사항 세부조회
			Notice mgrNoticeList = mgrService.selectDetail(ntcCode);
			model.addAttribute("view", mgrNoticeList);
	}
}

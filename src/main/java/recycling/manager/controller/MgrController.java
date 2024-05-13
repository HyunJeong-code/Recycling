package recycling.manager.controller;


import java.util.List;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.manager.Notice;
import recycling.manager.service.face.MgrService;
import recycling.util.Paging;

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

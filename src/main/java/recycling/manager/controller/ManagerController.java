package recycling.manager.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.manager.ManagerLogin;
import recycling.manager.service.face.ManagerService;

// 관리자 마이 페이지

@Controller
@RequestMapping("/manager/mgr")
public class ManagerController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ManagerService managerService;
	
	@GetMapping("/main")
	public void main(HttpSession session) {
		logger.info("/manager/mgr/main [GET]");
		
	}
	
	@PostMapping("/main")
	public String mainProc(HttpSession session, String mgrPw) {
		logger.info("/manager/mgr/main [POST]");
		
		ManagerLogin mgr = (ManagerLogin) session.getAttribute("manager");
		logger.info("mgr : {}", mgr);
		logger.info("mgrPw : {}", mgrPw);
		
		String mgrId = mgr.getMgrId();
		
		int res = managerService.selectByIdPw(mgrId, mgrPw);
		
		if(res > 0) {
			return "/manager/mgr/mgrdetail";
		} else {
			// 실패 팝업?
			return "redirect:./main";
		}
	}
	
	@GetMapping("/changepw")
	public void changePw(HttpSession session) {
		logger.info("/manager/mgr/changepw [GET]");
		
		ManagerLogin mgr = (ManagerLogin) session.getAttribute("manager");
		logger.info("mgr : {}", mgr);
	}
	
	@PostMapping("/changepw")
	public String changePwProc(HttpSession session, String mgrPw) {
		logger.info("/manager/mgr/changepw [POST]");
		
		ManagerLogin mgr = (ManagerLogin) session.getAttribute("manager");
		logger.info("mgr : {}", mgr);
		
		String mgrId = mgr.getMgrId();
		String mgrCode = mgr.getMgrCode();
		
		int res = managerService.updatePw(mgrCode, mgrId, mgrPw);
		
		if(res > 0) {
			mgr.setMgrPw(mgrPw);
			return "/manager/mgr/mgrdetail";
		} else {
			// 실패 팝업?
			return "redirect:./changepw";
		}
	}
}

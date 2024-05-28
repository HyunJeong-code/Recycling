package recycling.manager.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.manager.service.face.ManagerService;
import recycling.manager.service.face.MgrService;

// 관리자 마이 페이지

@Controller
@RequestMapping("/manager/mgr")
public class ManagerController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ManagerService managerService;
	@Autowired MgrService mgrService;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	
	@GetMapping("/main")
	public void main(HttpSession session) {
		logger.info("/manager/mgr/main [GET]");
		
	}
	
	@PostMapping("/main")
	public String mainProc(
				Authentication authentication,
				String mgrPw,
				Model model,
				HttpSession session
			) {
		logger.info("/manager/mgr/main [POST]");
		
		ManagerLogin mgr = (ManagerLogin) authentication.getPrincipal();
		logger.info("mgr : {}", mgr);
		logger.info("mgrPw : {}", mgrPw);
				
		if(pwEncoder.matches(mgrPw, mgr.getMgrPw())) {
			session.setAttribute("mgrChk", true);
			return "redirect:/manager/mgr/mgrdetail";
		} else {
			model.addAttribute("msg", "비밀번호가 올바르지 못합니다.");
			model.addAttribute("url", "/manager/mgr/main");
			return "/layout/alert";
		}
	}
	
	@GetMapping("/changepw")
	public String changePw(HttpSession session) {
		logger.info("/manager/mgr/changepw [GET]");
		
		if((Boolean) session.getAttribute("mgrChk") == null) {
			return "redirect:/manager/mgr/main";
		} else {
			return "/manager/mgr/changepw";
		}
	}
	
	@PostMapping("/changepw")
	public String changePwProc(
				Authentication authentication, 
				String mgrPw,
				Model model
				) {
		logger.info("/manager/mgr/changepw [POST]");
		
		ManagerLogin mgr = (ManagerLogin) authentication.getPrincipal();
		logger.info("mgr : {}", mgr);
		
		String oldPw = mgr.getMgrPw();
		mgr.setMgrPw(pwEncoder.encode(mgrPw));
		int res = managerService.updatePw(mgr);
		
		if(res > 0) {
			model.addAttribute("msg", "비밀번호 변경에 성공했습니다.");
			model.addAttribute("url", "/manager/mgr/changepw");
			return "/layout/alert";
		} else {
			model.addAttribute("msg", "비밀번호 변경에 실패했습니다.");
			model.addAttribute("url", "/manager/mgr/changepw");
			mgr.setMgrPw(oldPw);
			return "/layout/alert";
		}
	}
	
	@GetMapping("mgrdetail")
	public String mgrDetail(
			Authentication authentication,
			HttpSession session,
			Model model
			) {
		logger.info("/manager/mgr/mgrdetail [GET]");
		
		if((Boolean) session.getAttribute("mgrChk") == null) {
			return "redirect:/manager/mgr/main";
		} else {
			ManagerLogin mgr = (ManagerLogin) authentication.getPrincipal();
			logger.info("mgr : {}", mgr);
			
			Manager manager = managerService.selectByMgr(mgr);
			logger.info("manager : {}", manager);
			MgrFile mgrFile = managerService.selectByMgrProf(mgr);
			logger.info("mgrfile : {}", mgrFile);
			
			model.addAttribute("manager", manager);
			model.addAttribute("mgrFile", mgrFile);
			
			return "/manager/mgr/mgrdetail";
		}
	}
	
	@PostMapping("mgrdetail")
	public String mgrDailProc(
				Authentication authentication,
				Manager manager,
				String sPhone, String inPhone, String mPhone, String lPhone,
				String mgrEmail2, String inEmail,
				int mgrFlNo,
				MultipartFile mgrProf,
				Model model
			) {
		logger.info("/manager/mgr/mgrdetail [POST]");
		
		ManagerLogin mgr = (ManagerLogin) authentication.getPrincipal();
		logger.info("mgr : {}", mgr);
		
		manager = mgrService.mgrProc(manager, sPhone, inPhone, mPhone, lPhone, mgrEmail2, inEmail);
		
		manager.setMgrCode(mgr.getMgrCode());
		manager.setMgrId(mgr.getMgrId());
		int res = managerService.updateMgr(manager);
				
		MgrFile mgrFile = new MgrFile();
		mgrFile.setMgrFlNo(mgrFlNo);
		mgrFile = managerService.saveFile(mgrProf, manager);
		logger.info("mgrFile : {}", mgrFile);
		
		int resProf = managerService.updateMgrProf(mgrFile);
		
		model.addAttribute("msg", "사원 정보가 수정되었습니다.");
		model.addAttribute("url", "/manager/mgr/mgrdetail");
		return "/layout/alert";
	}
}

package recycling.manager.controller;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerJoinDe;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.dto.manager.Notice;
import recycling.manager.service.face.MgrService;
import recycling.util.PagingAndCtg;

// 관리자 메인 페이지 + 로그인, 회원가입 + 사원 전체 조회, 공지사항

@Controller
@RequestMapping("/manager")
public class MgrController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrService mgrService;
	@Autowired private JavaMailSenderImpl mailSender;
	@Autowired private recycling.page.face.PageService pageService;
	
	@GetMapping("/main")
	public String main(
			) {
		logger.info("/manager/main [GET]");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("auth : {}", auth);
		
		if(auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_MANAGER"))) {
			return "/manager/main";
		} else {
			return "/manager/login";
		}
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
	public String joinProc(
			Manager manager, 
			String sPhone, String inPhone, String mPhone, String lPhone,
			String mgrEmail2, String inEmail,
			MultipartFile mgrProf
			) {
		logger.info("/manager/join [POST]");
		
		logger.info("mgr : {}", manager);
		logger.info("phone : {}, {}", sPhone, inPhone);
		logger.info("phone : {}, {}", mPhone, lPhone);
		logger.info("mail : {}, {}", mgrEmail2, inEmail);
		logger.info("mgrPic : {}", mgrProf);
		
		manager = mgrService.mgrProc(manager, sPhone, inPhone, mPhone, lPhone, mgrEmail2, inEmail);
		logger.info("mgr : {}", manager);
		
		MgrFile mgrFile = mgrService.saveFile(mgrProf, manager);
		logger.info("mgrFile : {}", mgrFile);
		
		int res = mgrService.selectByManager(manager);
		logger.info("res : {}", res);
		
		if(res > 0 && mgrFile != null) {
			// 회원정보 수정 및 프로필 사진 삽입
			int resMgr = mgrService.updateManager(manager);
			int resPic = mgrService.insertMgrProf(mgrFile);
			
			if(resMgr > 0 && resPic > 0) {
				// 회원가입 성공
				return "redirect:./main";
			} else {
				// 회원가입 실패
				// 업데이트 및 삽입된 데이터 삭제
				return "redirect:./joinfail";				
			}
		} else {
			// 회원가입 실패
			// 업데이트 및 삽입된 데이터 삭제
			return "redirect:./joinfail";				
		}
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("/manager/login [GET]");		
	}
	
	
	
	@GetMapping("findid")
	public void findId() {
		logger.info("/manager/findid [GET]");
	}
	
	@PostMapping("findid")
	public void findIdProc(
				Model model,
				Manager manager,
				String mgrPhone, String mPhone, String lPhone,
				String mgrEmail, String mgrEamil2
			) {
		logger.info("/manager/findid [POST]");
		
		manager = mgrService.mgrProc(manager, lPhone, mgrPhone, mPhone, lPhone, mgrEmail, mgrEmail);
		
		if(manager == null) {
			
		} else {
			
		}
	}
	
	@GetMapping("/findpw")
	public void findPw() {
		logger.info("/manager/findpw [GET]");
	}
	
	@PostMapping("/findpw")
	public String findPwProc(
				Model model,
				Manager manager,
				String mgrPhone, String mPhone, String lPhone,
				String mgrEmail, String mgrEamil2
			) {
		logger.info("/manager/findpw [POST]");
		
		manager = mgrService.mgrProc(manager, lPhone, mgrPhone, mPhone, lPhone, mgrEmail, mgrEmail);
		
		if(manager == null) {
			return "";
		} else {
			return "";
		}
	}
	
	//전체 사원조회
	@GetMapping("/emplist")
	public String empList(
			Authentication authentication
			, Model model
			, @RequestParam(defaultValue = "0") int curPage
			, @RequestParam(defaultValue = "") String search
			, @RequestParam(defaultValue = "") String sCtg
			) {
		//매니저 권한 부여
		ManagerLogin managerLogin = (ManagerLogin) authentication.getPrincipal();
		
		//페이지 수 계산
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageMgr(curPage, sCtg, search, managerLogin.getMgrCode());
		
		int upPage = mgrService.selectCntAllempList(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());

		
		//사원 전체조회
		List<ManagerJoinDe> select = mgrService.selectAllempList(upPaging);
		
		//JSP로 보내기
		model.addAttribute("select", select);
		
		//페이징
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/manager/emplist");
		
		return "/manager/emplist";
	}
	
	//공지사항 전체조회
	@GetMapping("/noticelist")
	public void noticeList(
			Authentication authentication
			, Model model
			, @RequestParam(defaultValue = "0") int curPage
			, @RequestParam(defaultValue = "") String search
			, @RequestParam(defaultValue = "") String sCtg
			) {
		//매니저 권한 부여
		ManagerLogin managerLogin = (ManagerLogin) authentication.getPrincipal();
		
		//페이지 수 계산
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageMgr(curPage, sCtg, search, managerLogin.getMgrCode());
		
		int upPage = mgrService.selectCntAllNotice(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
		
		//관리자 공지사항 전체조회
		List<Notice> mgrNoticeList = mgrService.selectAllNotice(upPaging);
		upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
		
		//JSP로 보내기
		model.addAttribute("notice", mgrNoticeList);

		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/manager/noticelist"); //jsp 페이징
		
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
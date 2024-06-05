package recycling.manager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerJoinDe;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.manager.service.face.HrService;
import recycling.util.PagingAndCtg;


@Controller
@RequestMapping("/manager/hr")
public class HrController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private HrService hrService; 
	@Autowired HttpSession session;
	@Autowired private recycling.page.face.PageService pageService;
	
	//전체 사원조회
	@GetMapping("/main")
	public String main(
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
		
		int upPage = hrService.selectCntAllHr(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());

		
		//사원 전체조회
		List<ManagerJoinDe> select = hrService.selectAllHr(upPaging);
		
		//JSP로 보내기
		model.addAttribute("select", select);
		
		//페이징
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/manager/hr/main");
		
		return "/manager/hr/main";
	}
	
	//사원정보 상세조회
	@GetMapping("/empdetail")
	public void empDetail(
			Manager manager
			, MgrFile mgrFile
			, Model model
			) {
	
		//세부사항 조회
		Manager view = hrService.selectDetail(manager);
		model.addAttribute("view", view);
		logger.info("view:{}", view );
		
		//프로필 조회
		MgrFile profileList = hrService.mgrProFileList(mgrFile);
		model.addAttribute("profileList", profileList);
		logger.info("profileList:{}", profileList );
		
		//파일 조회
		MgrFile fileList = hrService.mgrFileList(mgrFile);
		model.addAttribute("fileList", fileList);
		logger.info("fileList:{}", fileList );
	}

	//파일 다운로드
	@GetMapping("/hrdownload")
	public String download(MgrFile mgrFile, Model model) {
		
		//mgrCode번호 가져오기
		MgrFile fileDown = hrService.FileDown(mgrFile);
		logger.info("fileDown : {}", fileDown);
		
		//다운로드 응답용 파일의 정보를 모델값으로 뷰에 전달하기
		model.addAttribute("fileDown", fileDown);
		
		//viewName을 응답용 뷰 객체(스프링 빈)로 지정한다
		return "downView";
	}
	
	//사원정보 등록창
	@GetMapping("/empform")
	public void empForm() {
	}
	
	//사원정보 등록
	@PostMapping("/empform")
	public String empFormProc(
			Manager manager
			, Model model
			, @RequestParam("profile") MultipartFile profile
			, @RequestParam("file") MultipartFile file
			) {
		logger.info("controller: empform[Post]");
		
		hrService.insert(manager,profile, file);
		
		model.addAttribute("msg", "사원 정보가 입력되었습니다.");
		model.addAttribute("url", "/manager/hr/main");
		
		return "/layout/alert";
	}

	//사원정보 업데이트창
	@GetMapping("/empupdate")
	public void empUpdate(
			Manager manager
			, Model model
			, MgrFile mgrFile
			) {
		logger.info("controller: empupdate[Get]");
		
		
		//파일 조회
		MgrFile profileList = hrService.mgrFileUpdateList(mgrFile);
		model.addAttribute("profileList", profileList);
		logger.info("controller: empupdate[Get]{}",profileList);
	
		//정보 조회
		Manager update = hrService.hrUpdateView(manager);
		model.addAttribute("view", update);
		

	}
	
	//사원정보 업데이트
	@PostMapping("/empupdate")
	public String updateProc(
			Manager manager
			, Model model
			, int mgrFlNo
			, String mgrCode
			, MultipartFile empFileUpdate
			) {
		logger.info("controller: empupdate[Post]");
		
		hrService.hrUpdate(manager);
		
		//expfile 프로필 업데이트
		if(empFileUpdate != null && !empFileUpdate.isEmpty()) {
		
			MgrFile mgrfile = new MgrFile();
			mgrfile = hrService.updateProFileGet(empFileUpdate, manager);
			mgrfile.setMgrFlNo(mgrFlNo);
			mgrfile.setMgrCode(mgrCode);
			logger.info("MgrFile : {}",mgrfile);
			
			//파일 업데이트
			hrService.updateProfileProc(mgrfile);
			logger.info("파일이 없음 : {}",mgrfile);
		}else {
			logger.info("프로필이 존재합니다.");
		}
		
		model.addAttribute("msg", "사원정보가 변경되었습니다.");
		model.addAttribute("url", "redirect: /manager/hr/empupdate?mgrCode=" + mgrCode);
		
		return "/layout/alert";

	}
	
	//사원정보 삭제[리스트 삭제]
//	@PostMapping("/emplistdelete")
//	public int empListDelete(@RequestParam("chBox[]") List<String> chBox) {
//		logger.info("controller: empListDelete [Post]");
//		
//		logger.info("데이터 확인 chBox : {}", chBox);
//		
//		int result = 0;
//		result = hrService.listDel(chBox);
//		
//		return result;
//	}
	
	//사원정보 삭제[리스트 삭제 권한변경]
	@PostMapping("/emplistdelete")
	public String empListDelete(@RequestParam("chBox[]") List<String> chBox) {
		logger.info("controller: empListDelete [POST]");
		
		hrService.listDel(chBox);
		logger.info("데이터 확인 chBox : {}", chBox);
		
		return "redirect:./main";
	}

}//main

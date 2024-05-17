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
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Department;
import recycling.dto.manager.Manager;
import recycling.dto.manager.MgrFile;
import recycling.manager.service.face.HrService;


@Controller
@RequestMapping("/manager/hr")
public class HrController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private HrService hrService; 
	@Autowired HttpSession session;
	
	//전체 사원조회
	@GetMapping("/main")
	public String main(
			Model model
			) {
		logger.info("Controller: main[Get]");
		
		List<Manager> select = hrService.selectAll();
		model.addAttribute("select", select);
		logger.info("select: {}", select);
		
		return "/manager/hr/main";
	}
	
	//사원정보 상세조회
	@GetMapping("/empdetail")
	public void empDetail(
			Manager manager
			, MgrFile mgrFile
			, Model model
			) {
		logger.info("controller: empDetail[Get]");
	
		//세부사항 조회
		Manager view = hrService.selectDetail(manager);
		model.addAttribute("view", view);
		logger.info("view:{}", view );
		
		//파일 조회
		MgrFile fileList = hrService.mgrFileList(mgrFile);
		model.addAttribute("fileList", fileList);
		logger.info("fileList:{}", fileList );
	}

	//파일 다운로드[미구현, 구현시 view쪽 DTO 일부수정] 
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
			,@RequestParam("file") MultipartFile file
			) {
		logger.info("controller: empform[Post]");
		
		hrService.insert(manager, file);
		
		return "redirect:./empform";
	}

	//사원정보 업데이트창
	@GetMapping("/empupdate")
	public void empUpdate(
			Manager manager
			, Model model
			) {
		logger.info("controller: empupdate[Get]");
		
		Manager update = hrService.hrUpdateView(manager);
		model.addAttribute("view", update);
	}
	
	//사원정보 업데이트
	@PostMapping("/empupdate")
	public void updateProc(
			Manager manager
			) {
		logger.info("controller: empupdate[Post]");
		
		hrService.hrUpdate(manager);
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

package recycling.manager.controller;

import java.util.List;

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
import recycling.manager.service.face.HrService;


@Controller
@RequestMapping("/manager/hr")
public class HrController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired(required = false)
	private HrService hrService; 

	@GetMapping("/main")
	public String main(
			Model model
			) {
		logger.info("Controller: main[Get]");
		
		List<Manager> select = hrService.selectAll();
		model.addAttribute("select", select);
		
		//데이터 가져오는지 확인
		logger.info("select: {}", select);
		
		return "/manager/hr/main";
	}
	
	@GetMapping("/empdetail")
	public void empDetail(Manager manager, Model model) {
		logger.info("controller: empDetail[Get]");
	
		Manager view = hrService.selectDetail(manager);
		model.addAttribute("view", view);
		logger.info("empDetail:{}", view );
	
	}
	
	@GetMapping("/empform")
	public void empForm() {
//		logger.info("controller: empform[Get]");
	}
	
	@PostMapping("/empform")
	public String empFormProc(Manager manager) {
//		logger.info("controller: empform[Post]");
		
		hrService.insert(manager);
		
		return "redirect:./empform";
	}


	@PostMapping("/emplistdelete")
	public String empListDelete(@RequestParam("chBox[]") List<String> chBox) {
		logger.info("controller: empListDelete [POST]");
		
		logger.info("데이터 확인 chBox : {}", chBox);
		
		int result = hrService.listDel(chBox);
		
		return "redirect:./main";
	}


}

package recycling.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.seller.Exp;
import recycling.manager.service.face.SlsService;


@Controller
@RequestMapping("/manager/sls")
public class SlsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SlsService slsService;
	
	//체험단 전체조회
	@GetMapping("/explist")
	public String explist(
			Model model
			) {
		logger.info("controller : explist[get]");
		
		//전체 조회기능
		List<Exp> list = slsService.selectAll();
		
		model.addAttribute("exp", list);
		logger.info("controller explist: {}", list);
		
		return "/manager/sls/explist";
		
	}
	
	//체험단 상세조회
	@GetMapping("expdetail")
	public void expDetail(Exp exp,Model model) {
		logger.info("contoller: expDetail[GET]");
		
		Exp view = slsService.selectDetail(exp);
		
		model.addAttribute("view", view);
		logger.info("expDetail:{}", view );
		
	}
	
//	@GetMapping("expform")	//체험단 등록
//	@GetMapping("expupdate")//체험단 수정
//	@GetMapping("expdel")	// 체험단삭제

//	@GetMapping("expresdetail")	// 체험단 예약 상세조회
//	@GetMapping("expresupdate")	// 체험단 예약 정보변경[예약 구매자]
//	@GetMapping("changeexpres")	// 체험단 예약 변경
}

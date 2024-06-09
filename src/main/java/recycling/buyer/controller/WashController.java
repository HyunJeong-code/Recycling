package recycling.buyer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.WashService;
import recycling.dto.manager.Wash;

// 메뉴 - 세척 업체

@Controller
@RequestMapping("/buyer/wash")
public class WashController {
	
	@Autowired private WashService washService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public String washMain(Model model) {
		logger.info("/buyer/wash/main [GET]");
		
		List<Wash> list = washService.selectWashList();
		
		model.addAttribute("list",list);
		
		return "buyer/wash/main";
		
	}
	
	@GetMapping("/washDetail")
	public String washDetail(@RequestParam("wCode") String wCode, Model model, HttpSession session) {
		logger.info("/washDetail [GET] - wCode: {}", wCode);
		
		Wash wash = washService.selectWash(wCode);
		
		if (wash == null) {
			return "not-found-page";
		}
		
		model.addAttribute("wash", wash);
		
		return	"buyer/wash/washDetail";
		
	}
	
	
}

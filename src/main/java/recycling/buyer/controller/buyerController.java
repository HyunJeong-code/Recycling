package recycling.buyer.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.BuyerService;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class buyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BuyerService buyerService;
	
	@GetMapping("/mymain")
	public void myMain() {
		
		logger.info("/buyer/mymain [GET]");
		
	}
	
	@PostMapping("/mymain")
	public String myMainProc(String bPw, HttpSession session) {
		
		logger.info("/buyer/mymain [POST]");
		
		boolean result = buyerService.selectByPw(bPw);
		
		if(result) {
			
			session.setAttribute("result", result);
			
			return "redirect:./mydetail";
			
		} else {
			
			session.invalidate();
			
		}
		
		return "redirect:./mymain";
		
	}
	
	
	
	
	
}
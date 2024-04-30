package recycling.buyer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 구매자 메인페이지, 로그인/회원가입

@Controller
@RequestMapping("/buyer")
public class buyController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/main")
	public void main(Model model) {
		logger.info("/buyer/main [GET]");
		
		
	}
}

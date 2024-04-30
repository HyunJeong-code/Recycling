package recycling.buyer.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer")
public class buyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/login")
	public void login() {
		logger.info("/buyer/login [GET]");
	}
	
	@PostMapping("/login")
	public void loginProc(HttpSession session, String ctBcode) {
		logger.info("/buyer/login [POST]");
		
		logger.info("{}", ctBcode);
	}
	
	
}

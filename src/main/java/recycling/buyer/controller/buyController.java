package recycling.buyer.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.buyer.service.face.BuyService;
import recycling.dto.buyer.Buyer;

// 구매자 메인페이지, 로그인/회원가입

@Controller
@RequestMapping("/buyer")
public class buyController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BuyService buyService;
	
	@GetMapping("/main")
	public void main(Model model) {
		logger.info("/buyer/main [GET]");
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("/buyer/login [GET]");
	}
	
	@PostMapping("/login")
	public String loginProc(Buyer buyer, HttpSession session) {
		logger.info("/buyer/login [POST]");
		
		logger.info("{}", buyer);
		
		buyer = buyService.selectByIdPw(buyer);
		
		if(buyer == null || buyer.getbOut().equals("Y")) {
			session.invalidate();
		}
		session.setAttribute("bCode", buyer.getbCode());
		
		return "redirect:./main";
	}
}

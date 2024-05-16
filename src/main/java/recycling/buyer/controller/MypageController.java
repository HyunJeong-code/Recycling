package recycling.buyer.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.BuyerLogin;

// 마이페이지 - 내 게시물 관련

@Controller
@RequestMapping("/buyer/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyerService buyerService;
	
	@GetMapping("/myboard")
	public void myMain(HttpSession session) {
		logger.info("/buyer/mypage/myboard");
		
		BuyerLogin buyers = (BuyerLogin) session.getAttribute("buyers");
	}
}

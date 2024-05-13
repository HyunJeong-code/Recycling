package recycling.buyer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.buyer.Buyers;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@GetMapping("/mymain")
	public void myMain(@AuthenticationPrincipal Buyers buyers) {
		logger.info("/buyer/mypage/mymain [GET]");
		
		logger.info("{}", buyers);
	}
}

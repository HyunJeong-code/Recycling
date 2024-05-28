package recycling.buyer.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.BuyerLogin;

// 마이페이지 - 내 게시물 관련

@Controller
@RequestMapping("/buyer/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MypageService mypageService;
	
	@GetMapping("/myboard")
	public void myMain(
				Authentication authentication,
				Model model
				
			) {
		logger.info("/buyer/mypage/myboard [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		List<Map<String, Object>> qna = mypageService.selectQnaBybCode(buyerLogin);
		logger.info("QNA : {}", qna);
		logger.info("QNA : {}", qna.size());
		
		model.addAttribute("qna", qna);
		model.addAttribute("qnaSize", qna.size());
		
		List<Map<String, Object>> rvw = mypageService.selectRvwBybCode(buyerLogin);
		logger.info("RVW : {}", rvw);
		logger.info("RVW : {}", rvw.size());
		
		model.addAttribute("rvw", rvw);
		model.addAttribute("rvwSize", rvw.size());
	}
}
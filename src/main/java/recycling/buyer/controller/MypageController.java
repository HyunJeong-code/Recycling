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
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.BuyerLogin;
import recycling.util.PagingAndCtg;

// 마이페이지 - 내 게시물 관련

@Controller
@RequestMapping("/buyer/mypage")
public class MypageController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MypageService mypageService;
	
	@GetMapping("/myboard")
	public void myMain(
				Authentication authentication,
				@RequestParam(defaultValue = "0") int curPage,
				@RequestParam(defaultValue = "") String search,
				Model model
			) {
		logger.info("/buyer/mypage/myboard [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		// 문의글 페이지 수 계산
		PagingAndCtg paging = new PagingAndCtg();
		paging.setCurPage(curPage);
		paging.setSearch(search);
		paging.setUser(buyerLogin.getbCode());
		
		int page = mypageService.selectCntPage(paging);
		paging = new PagingAndCtg(page, paging.getCurPage(), paging.getSearch());
		
		logger.info("paging : {}", paging);
		paging.setUser(buyerLogin.getbCode());
		
		List<Map<String, Object>> qna = mypageService.selectQnaBybCode(paging);
		logger.info("QNA : {}", qna);
		logger.info("QNA : {}", qna.size());
		logger.info("page : {}", paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("qna", qna);
		model.addAttribute("qnaSize", qna.size());
		model.addAttribute("search", search);
		model.addAttribute("url", "/buyer/mypage/myboard");
		
		List<Map<String, Object>> rvw = mypageService.selectRvwBybCode(paging);
		logger.info("RVW : {}", rvw);
		logger.info("RVW : {}", rvw.size());
		
		model.addAttribute("rvw", rvw);
		model.addAttribute("rvwSize", rvw.size());
	}
}
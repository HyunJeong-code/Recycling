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
import org.springframework.web.bind.annotation.PostMapping;
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
	@Autowired private recycling.page.face.PageService pageService;
	
	@GetMapping("/myboard")
	public void myMain(
				Authentication authentication,
				@RequestParam(defaultValue = "0") int curPage,
				@RequestParam(defaultValue = "") String search,
				@RequestParam(defaultValue = "") String sCtg,
				Model model
			) {
		logger.info("/buyer/mypage/myboard [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		// 문의글 페이지 수 계산
		PagingAndCtg upPaging = new PagingAndCtg();
		PagingAndCtg unPaging = new PagingAndCtg();
		
		logger.info("sCtg : {}", sCtg);
		upPaging = pageService.upPageBuyer(curPage, sCtg, search, buyerLogin.getbCode());
		unPaging = pageService.unPageBuyer(curPage, sCtg, search, buyerLogin.getbCode());		
		
		int upPage = mypageService.selectCntQna(upPaging);
		upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
		
		logger.info("upPaging : {}", upPaging);
		upPaging.setUser(buyerLogin.getbCode());
		
		List<Map<String, Object>> qna = mypageService.selectQnaBybCode(upPaging);
		logger.info("QNA : {}", qna);
		logger.info("QNA : {}", qna.size());
		logger.info("uppage : {}", upPaging);
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("qna", qna);
		model.addAttribute("qnaSize", qna.size());
		model.addAttribute("upUrl", "/buyer/mypage/myboard");
		
		// 후기페이징
		int unPage = mypageService.selectCntRvw(unPaging);
		unPaging = new PagingAndCtg(unPage, unPaging.getCurPage(), unPaging.getSearch());
		
		logger.info("unPaging : {}", unPaging);
		unPaging.setUser(buyerLogin.getbCode());
		
		List<Map<String, Object>> rvw = mypageService.selectRvwBybCode(unPaging);
		logger.info("RVW : {}", rvw);
		logger.info("RVW : {}", rvw.size());
		logger.info("unpage : {}", unPaging);
		
		model.addAttribute("rvw", rvw);
		model.addAttribute("rvwSize", rvw.size());
		model.addAttribute("unPaging", unPaging);
		model.addAttribute("unUrl", "/buyer/mypage/myboard");
		
		model.addAttribute("sCtg", sCtg);
	}
	
	@GetMapping("/rvwform")
	public void rvwForm(
				Authentication authentication,
				@RequestParam(defaultValue = "0") int curPage,
				@RequestParam(defaultValue = "") String search,
				@RequestParam(defaultValue = "") String sCtg,
				Model model
			) {
		logger.info("/buyer/mypage/rvwform [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		// 문의글 페이지 수 계산
		PagingAndCtg paging = pageService.upPageBuyer(curPage, sCtg, search, buyerLogin.getbCode());
		
		int page = mypageService.selectAllCnt(paging);
		paging = new PagingAndCtg(page, curPage, search);
		paging.setUser(buyerLogin.getbCode());
		
		List<Map<String, Object>> list = mypageService.selectAll(paging);
		
		

	}
	
	@PostMapping("/rvwform")
	public void rvwFormProc(
				Authentication authentication
			) {
		logger.info("/buyer/mypage/rvwform [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyer : {}", buyerLogin);
//		logger.info("code : {}", code);
		
	}
}
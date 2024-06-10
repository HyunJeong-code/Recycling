package recycling.buyer.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.buyer.Qst;
import recycling.dto.buyer.QstCt;
import recycling.dto.seller.Qna;
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
		
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		logger.info("{}", auth.getAuthorities());
//		logger.info("{}", auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_BUYER")));
		
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
		model.addAttribute("buyerLogin", buyerLogin);
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
	
	// 1:1 문의 상세 조회
	@GetMapping("/otodetail")
	public void otoDetail(
			@RequestParam("otoCode") String otoCode,
			Model model
			) {
		
		logger.info("/buyer/mypage/otodetail [GET]");
		
		Oto oto = mypageService.getByOtoCode(otoCode);
		List<OtoCt> oct = mypageService.getAllOct();
		List<OtoFile> otoFiles = mypageService.getOtoFiles(otoCode);
		
		model.addAttribute("oto", oto);
		model.addAttribute("oct",oct);
		model.addAttribute("otoFiles",otoFiles);
		
	}
	
	// 1:1 문의 삭제
	@PostMapping("/otodel")
	public String otoDel(@RequestParam("otoCode") String otoCode) {
		
		logger.info("/buyer/mypage/otodel [POST]");
		
		int result = mypageService.deleteOto(otoCode);
		
		if(result > 0) {
			
			return "redirect:/buyer/mypage/myboard";
			
		} else {
			
			return "redirect:/buyer/mypage/otodetail?otoCode=" + otoCode;
			
		}
		
	}
	
	// 판매자 문의 상세 조회
	@GetMapping("/qnadetail")
	public void qnaDetail(
			String qstCode,
			Model model
			) {
		
		logger.info("/buyer/mypage/qnadetail [GET]");
		
		Qst qst = mypageService.getQstByqstCode(qstCode);
		Qna qna = mypageService.getQnaByqstCode(qstCode);
		List<QstCt> qct = mypageService.getAllQct();
		
		model.addAttribute("qna", qna);
		model.addAttribute("qst", qst);
		model.addAttribute("qct", qct);
		
	}
	
	// 판매자 문의 삭제
	@PostMapping("/qnadel")
	public String qnaDel(
			@RequestParam("qstCode") String qstCode,
			Model model
			) {
		
		logger.info("/buyer/mypage/qnadel [POST]");
		
		int resQna = mypageService.deleteQna(qstCode);
		int resQst = mypageService.deleteQst(qstCode);
		
		if(resQst > 0) {
			
			return "redirect:/buyer/mypage/myboard";
		} else {
			
			return "redirect:/buyer/mypage/qnadetail?qstCode=" + qstCode;
		}	
	}
	
	@GetMapping("/myprof")
	@ResponseBody
	public List<Map<String, Object>> myprof(
			Authentication authentication
			) {
		logger.info("/buyer/mypage/myprof [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);

		// 프로필 사진 및 기본 정보
		List<Map<String, Object>> profList = mypageService.selectBuyer(buyerLogin);
		logger.info("myprof - ", profList == null);
		logger.info("myprof - ", profList.isEmpty());
		logger.info("myprof : ", profList);
		
		return profList;
	}
	
	@GetMapping("/mypage")
	public void mypage(
			Authentication authentication,
			Model model
			) {
		logger.info("/buyer/mypage/mypage [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		// 각 거래 별 횟수
		
		// 1 : 1 게시글 수
		
		// 판매자 문의 수
		
		// 리뷰 수
		
	}
	
}
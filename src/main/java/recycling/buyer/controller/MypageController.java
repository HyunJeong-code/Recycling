package recycling.buyer.controller;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.Buyer;
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
	
	// 1:1 문의 작성 페이지
	@GetMapping("/otoform")
	public String otoform(
			Authentication authentication,
			Oto oto,
			Model model
			) {
		
		logger.info("/buyer/mypage/otoform [GET]");
		
		List<OtoCt> oct = mypageService.getAllOct();
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/mypage/myboard";
			
		}
		
		Buyer buyer = mypageService.getBuyerDetail(buyerLogin.getbId());
		
		oto.setbCode(buyer.getbCode());
		oto.setOtoName(buyer.getbName());
		oto.setOtoEmail(buyer.getbEmail());
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("oto", oto);
		model.addAttribute("oct", oct);
		
		return "/buyer/mypage/otoform";
		
	}
	
	// 1:1 문의 작성 처리
	@PostMapping("/otoform")
	public String otoFormProc(
			Authentication authentication,
			Oto oto,
			@RequestParam("ct_otono") String ctOtoNo,
			@RequestParam("detail") List<MultipartFile> detail,
			Model model
			) {
		
		logger.info("/buyer/mypage/otoform [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer buyer = mypageService.getBuyerDetail(buyerLogin.getbId());
		
		oto.setCtOtoNo(Integer.parseInt(ctOtoNo));
		oto.setbCode(buyer.getbCode());
		oto.setOtoName(buyer.getbName());
		oto.setOtoEmail(buyer.getbEmail());
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("oto", oto);
		
		int res = mypageService.insertOto(oto);
		
		if(res > 0 && detail != null && !detail.isEmpty()) {
			
			List<OtoFile> otoFiles = new ArrayList<>();
			
			for(MultipartFile mult : detail) {
				
				OtoFile otoFile = mypageService.saveFile(mult, oto);
				
				if(otoFile != null) {
					
					otoFiles.add(otoFile);
					
				}
				
			}
			
			int resDetail = 0;
			
			for(OtoFile otoFile : otoFiles) {
				
				resDetail += mypageService.insertOtoFiles(otoFile);
				
			}
			
			if(resDetail == otoFiles.size()) {
				
				logger.info("파일 저장 성공");
				
			} else {
				
				logger.info("파일 저장 실패");
				
			}
			
		} else {
			
			logger.info("등록 실패");
			
		}
		
		return "redirect:/buyer/mypage/myboard";
		
		
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
	
//	// 판매자 문의 작성
//	@GetMapping("/qnaform")
//	public String qnaForm(
//			Authentication authentication,
//			@RequestParam("qstCode") String qstCode,
//			Model model
//			) {
//		
//		logger.info("/buyer/mypage/qnaform [GET]");
//		
//		Qst qst = mypageService.getQstByqstCode(qstCode);
//		
//		model.addAttribute("qst", qst);
//		
//		return "/buyer/mypage/qnaform";
//		
//	}
//	
//	// 판매자 문의 작성
//	@PostMapping("/qnaform")
//	public String qnaFormProc(
//			Authentication authentication,
//			@RequestParam("qstCode") String qstCode,
//			@RequestParam("qnaContent") String qnaContent,
//			Model model
//			) {
//		
//		logger.info("/buyer/mypage/qnaform [POST]");
//		logger.info("qstCode: {}, qnaContent: {}", qstCode, qnaContent);
//		
//		if(qnaContent == null || qnaContent.trim().isEmpty()) {
//			
//			logger.info("qnaContent is null or empty");
//			
//			return "redirect:/buyer/mypage/qnadetail?qstCode=" + qstCode;
//			
//		}
//		
//		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
//		
//		if(buyerLogin == null) {
//			
//			model.addAttribute("error", "로그인 해주세요.");
//			
//			return "redirect:/buyer/login";
//			
//		}
//		
//		Qna qna = new Qna();
//		
//		qna.setQstCode(qstCode);
//		qna.setsCode(buyerLogin.getsCode());
//		qna.setQnaContent(qnaContent);
//		
//		int res = mypageService.insertQna(qna);
//		logger.info("insertQna result: {}", res);
//		
//		if(res > 0) {
//			
//			logger.info("답변 삽입 성공");
//			
//		} else {
//			
//			logger.info("답변 삽입 실패");
//			
//		}
//		
//		return "redirect:/buyer/mypage/myboard";
//		
//	}
	
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
	
}
package recycling.seller.controller;

import java.util.List;

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

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Qst;
import recycling.dto.buyer.QstA;
import recycling.dto.buyer.QstFile;
import recycling.dto.buyer.QstFile;
import recycling.dto.seller.Qna;
import recycling.page.face.PageService;
import recycling.seller.service.face.QnaService;
import recycling.util.PagingAndCtg;

// 고객 문의 관리

@Controller
@RequestMapping("/seller/qna")
public class QnaController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired QnaService qnaService;
	@Autowired private PageService pageService;
	
	@GetMapping("/main")
	public void main(Authentication authentication, Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		// 문의글 페이지 수 계산
 		PagingAndCtg upPaging = new PagingAndCtg();
 		PagingAndCtg unPaging = new PagingAndCtg();
        
        upPaging = pageService.upPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
        unPaging = pageService.unPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
		logger.info("232321");
        int upPage = qnaService.selectCntQstBysCode(upPaging);
        logger.info("44444");
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        
 		logger.info("upPaging : {}", upPaging);
 		upPaging.setUser(buyerLogin.getsCode());
 		
 		
 		int unPage = qnaService.selectCntQstAllBysCode(unPaging);
 		unPaging = new PagingAndCtg(unPage, unPaging.getCurPage(), unPaging.getSearch());
        
 		logger.info("unPaging : {}", unPaging);
 		unPaging.setUser(buyerLogin.getsCode());
        
 		List<QstA> qlist = qnaService.selectQstBysCode(upPaging);
		
		List<QstA> qlistA = qnaService.selectQstAllBysCode(unPaging);
		
		logger.info("{}",qlist);
		model.addAttribute("qlist", qlist);
		logger.info("{}",qlistA);
		model.addAttribute("qlistA", qlistA);
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/seller/qna/main");
		model.addAttribute("unPaging", unPaging);
		model.addAttribute("unUrl", "/seller/qna/main");
	}
	
	@GetMapping("/qnaform")
	public void qnaForm(String qstCode, Model model) {
		Qst qst = qnaService.selectQstByqstCode(qstCode);
		
		QstFile img = qnaService.selectQstFile(qstCode);
		
		model.addAttribute("qst", qst);
		model.addAttribute("img", img);
	}
	
	
	@PostMapping("/qnaform")
	public void qnaFormProc(Authentication authentication, Qna qna) {
		logger.info("{}",qna);
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
        
		String sCode = buyerLogin.getsCode();
		
		qna.setsCode(sCode);
		
		int res = qnaService.insertQna(qna);
	}
	
	@GetMapping("/qnadetail")
	public void qnadetail(String qstCode, Model model) {
		Qst qst = qnaService.selectQstByqstCode(qstCode);
		
		Qna qna = qnaService.selectQnaByqstCode(qstCode);
		
		QstFile img = qnaService.selectQstFile(qstCode);
		
		model.addAttribute("qna", qna);
		model.addAttribute("qst", qst);
		model.addAttribute("img", img);
	}
	
	@PostMapping("/qnaupdate")
	public void qnaUpdate(Qna qna) {
		int res = qnaService.updateQna(qna);
	}
	
	@GetMapping("/qnadelete")
	public String qnaDelete(String qnaCode) {
		int res = qnaService.deleteQna(qnaCode);
		
		return "redirect:/seller/qna/main";
	}
	
	
}

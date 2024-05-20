package recycling.seller.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.buyer.Qst;
import recycling.dto.buyer.QstA;
import recycling.dto.seller.Qna;
import recycling.seller.service.face.QnaService;

// 고객 문의 관리

@Controller
@RequestMapping("/seller/qna")
public class QnaController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired QnaService qnaService;
	@Autowired HttpSession session;
	
	@GetMapping("/main")
	public void main(Model model) {
		//테스트용 세션***********************************************테스트
		session.setAttribute("sCode", "SEL0000003");
		
		String sCode = (String)session.getAttribute("sCode");
		
		List<QstA> qlist = qnaService.selectBysCode(sCode);
		
		logger.info("{}",qlist);
		model.addAttribute("qlist", qlist);
	}
	
	@GetMapping("/qnaform")
	public void qnaForm(String qstCode, Model model) {
		Qst qst = qnaService.selectQstByqstCode(qstCode);
		
		model.addAttribute("qst", qst);
	}
	
	
	@PostMapping("/qnaform")
	public void qnaFormProc(Qna qna) {
		logger.info("{}",qna);
		
		//테스트용 세션***********************************************테스트
		session.setAttribute("sCode", "SEL0000003");
		
		String sCode = (String)session.getAttribute("sCode");
		
		qna.setsCode(sCode);
		
		int res = qnaService.insertQna(qna);
	}
	
	@GetMapping("/qnadetail")
	public void qnadetail(String qstCode, Model model) {
		Qst qst = qnaService.selectQstByqstCode(qstCode);
		
		Qna qna = qnaService.selectQnaByqstCode(qstCode);
		
		model.addAttribute("qna", qna);
		model.addAttribute("qst", qst);
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

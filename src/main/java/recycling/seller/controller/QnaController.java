package recycling.seller.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.buyer.Qst;
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
		
		List<Qst> qlist = qnaService.selectBysCode(sCode);
		
		
		logger.info("{}",qlist);
		model.addAttribute("qlist", qlist);
	}
	
	
}

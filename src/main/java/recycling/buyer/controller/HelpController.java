package recycling.buyer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.HelpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.util.Paging;

// 메뉴 - 고객센터

@Controller
@RequestMapping("/buyer/help")
public class HelpController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private HelpService helpService;
	
	@GetMapping("/main")
	public void main(
			@RequestParam(defaultValue = "0") int curPage,
			Model model,
			HttpSession session,
			Buyer buyer
			) {
		
		Paging paging = helpService.getPaging(curPage);
		List<Faq> list = helpService.selectAllFaq(paging);
		List<FaqCt> faqCtlist = helpService.selectAllCtFaq(paging);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("faqCtlist", faqCtlist);
		
	}
	
	
}

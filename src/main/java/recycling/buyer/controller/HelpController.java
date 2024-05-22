package recycling.buyer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.HelpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
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
			Authentication authentication,
			Buyer buyer
			) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		Paging paging = helpService.getPaging(curPage);
		List<Faq> list = helpService.selectAllFaq(paging);
		List<FaqCt> faqCtlist = helpService.selectAllCtFaq(paging);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("faqCtlist", faqCtlist);
		
	}
	
	@GetMapping("/noticelist")
	public void noticeList(
			@RequestParam(name = "ct_ntcno", defaultValue = "buyer") String ctNtcNo,
			Model model,
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "") String search,
			HttpSession session
			) {
		
//		Paging paging = helpService.getSearchPaging(curPage, search);
		List<Notice> noticeList = null;

        // 판매자일 경우에만 공지사항 분류 선택 가능하도록 설정
        if ("seller".equals(ctNtcNo)) {
            noticeList = helpService.selectNoticeSeller();
        } else {
            noticeList = helpService.selectNoticeBuyer();
        }
        
        model.addAttribute("noticeList", noticeList);
//        model.addAttribute("paging", paging);
	}
	
	@GetMapping("/noticedetail")
	public void noticeDetail(
			Model model,
			String ntcCode
			) {
		
		Notice notice = helpService.selectByNotice(ntcCode);
		
		model.addAttribute("notice", notice);
	}
	
}

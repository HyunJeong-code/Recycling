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
import org.springframework.web.bind.annotation.RequestParam;

import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.seller.service.face.SellingService;
import recycling.util.Paging;

// 상품-판매 관리

@Controller
@RequestMapping("/seller/selling")
public class SellingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingService sellingService;
	
	@GetMapping("/explist")
	public void expList(
			Model model,
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "") String search,
			HttpSession session
			) {
		logger.info("/explist [GET]");
		
//		String sellerId = (String) session.getAttribute("sCode");

//		if(sellerId == null) { //로그인 상태가 아니라면 로그인화면으로
			
//			return "redirect:/buyer/login";
			
//		} else { //로그인한 회원의 list만 띄우기
			
//			paging = sellingService.getSearchPaging(curPage, search);
//			List<Exp> list = sellingService.selectMyExpList(paging, sellerId);
//			model.addAttribute("paging", paging);
//			model.addAttribute("list", list);
//		}
		Paging paging = sellingService.getSearchPaging(curPage, search);
		List<Exp> list = sellingService.selectMyExpList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
//		return "/seller/selling/explist";
		
	}
	
	@GetMapping("/expdetail")
	public void expDetail(
			Model model,
			String expCode,
			ExpFile expFile
			) {
		
		Exp exp = sellingService.selectByExp(expCode);
		model.addAttribute("exp", exp);
	}
	
	
	@GetMapping("/expresdetail")
	public void expResDetail(
			Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam String expCode
			
			) {
		
		Exp exp = sellingService.selectByExp(expCode);
//		Paging paging = sellingService.getPaging(curPage);
//		List<ExpRes> resList = sellingService.selectResList(expCode, paging);
		List<ExpRes> resList = sellingService.selectResList(expCode);
		
//		model.addAttribute("paging", paging);
		model.addAttribute("exp", exp);
		model.addAttribute("resList", resList);

		
	}
}

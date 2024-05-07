package recycling.seller.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.dto.seller.Exp;
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
			@RequestParam(defaultValue = "") String search
			) {
		logger.info("/explist [GET]");
		
		Paging paging = new Paging();
		
		paging = sellingService.getSearchPaging(curPage, search);
		
		List<Exp> list = sellingService.selectMyExpList(paging);
		
//		for(Exp e : list) {
//			logger.debug("{}", e);
//		model.addAttribute("list", list);
//		
//			
//		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/expdetail")
	public void expDetail() {
		
	}
	
	@GetMapping("/expresdetail")
	public void expResDetail() {
		
		
	}
}

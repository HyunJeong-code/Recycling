package recycling.buyer.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.RecyclingService;
import recycling.dto.seller.Prd;
import recycling.util.Paging;

// 메뉴 - 재활용품

@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RecyclingService recyclingService;
	
	@GetMapping("/main")
	public void rcyMain(Model model,
				@RequestParam(defaultValue = "0")int curPage,
				@RequestParam(defaultValue = "") String search
				) {
		logger.info("/buyer/recycling/main [GET]");
		
		Paging paging = recyclingService.getSearchPaging(curPage, search);
		
		List<Prd> list = recyclingService.getPrdList();
		
	}
	
	@GetMapping("/rcydetail")
	public void rcyDetail() {
		logger.info("/buyer/recycling/main [GET]");
	}
	
	
}

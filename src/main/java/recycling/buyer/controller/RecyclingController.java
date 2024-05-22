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

import recycling.buyer.service.face.RecyclingService;
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;

// 메뉴 - 재활용품

@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private RecyclingService recyclingService;
	
	@GetMapping("/main")
	public String rcyMain(Model model) {
		logger.info("/buyer/upcycling/main [GET]");
		
		List<Prd> list = recyclingService.getPrdList();
		
		model.addAttribute("list", list);
		
		return "buyer/upcycling/main";
	}
	
	
	@GetMapping("/rcydetail")
	public String rcyDetail(@RequestParam("prdcode") String prdCode, Model model, HttpSession session) {
		logger.info("/upcydetail [GET] - prdCode: {}", prdCode );
		
		Prd prd = recyclingService.view(prdCode);
		
		if (prd == null) {
			return "not-found-page";
		}
		
		SellerProf sellerProf = recyclingService.getSellerProf(prd.getsCode());
		
		model.addAttribute("prd", prd);
		model.addAttribute("sellerProf", sellerProf);
		
		return "buyer/recycling/rcydetail";
	}
	

	
}

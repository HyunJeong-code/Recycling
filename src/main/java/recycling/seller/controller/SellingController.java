package recycling.seller.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.seller.Exp;
import recycling.seller.service.face.SellingService;

// 상품-판매 관리

@Controller
@RequestMapping("/seller/selling")
public class SellingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingService sellingService;
	
	@GetMapping("/explist")
	public void expList(
			Model model
			) {
		logger.info("/explist [GET]");
		
		List<Exp> list = sellingService.selectMyExpList();
		
		for(Exp e : list) {
			logger.debug("{}", e);
			model.addAttribute("list", list);
			
			
		}
		
	}
}

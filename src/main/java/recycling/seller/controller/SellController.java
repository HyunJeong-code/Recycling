package recycling.seller.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.seller.Seller;
import recycling.seller.service.face.SellService;

// 판매자 메인 페이지 + 판매자 전환

@Controller
@RequestMapping("/seller")
public class SellController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellService sellService;
	
	@GetMapping("/main")
	public String main(HttpSession session) {
		logger.info("/seller/main [GET]");
		
		String bCode = (String) session.getAttribute("bCode");
		logger.info("{}", bCode);
		
		if(bCode == null) {
			return "buyer/join";
		}
		
		Seller seller = sellService.selectSeller(bCode);
		
		session.setAttribute("seller", seller);
		
		if(seller == null) {
			return "seller/sellerinfo";
		} else if(seller.getsChk().equals("N")) {	
			return "seller/sellerinfo";
		} else {
			return "redirect: ./main";
		}
	}
}

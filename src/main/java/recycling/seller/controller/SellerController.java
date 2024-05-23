package recycling.seller.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.buyer.BuyerLogin;
import recycling.seller.service.face.SellerService;

// 판매자 정보 관리

@Controller
@RequestMapping("/seller/mypage")
public class SellerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellerService sellerService;
	
	@GetMapping("/sellerdetail")
	public String sellerDetail(
			Authentication authentication
			) {
		logger.info("/seller/mypage/sellerdetail [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		if(buyerLogin.getbCtCode().equals("P")) {
			return "/seller/mypage/sellerpridetail";
		} else {
			return "/seller/mypage/sellercmpdetail";
		}
	}
}

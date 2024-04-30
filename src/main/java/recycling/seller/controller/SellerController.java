package recycling.seller.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 판매자 정보 관리

@Controller
@RequestMapping("/seller/mypage")
public class SellerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
}

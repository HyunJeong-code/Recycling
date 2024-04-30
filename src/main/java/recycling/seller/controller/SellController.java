package recycling.seller.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 판매자 메인 페이지

@Controller
@RequestMapping("/seller")
public class SellController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
}

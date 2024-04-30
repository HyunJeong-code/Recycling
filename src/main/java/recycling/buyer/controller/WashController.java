package recycling.buyer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 메뉴 - 세척 업체

@Controller
@RequestMapping("/buyer/wash")
public class WashController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
}

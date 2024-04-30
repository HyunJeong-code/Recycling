package recycling.buyer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 메뉴 - 고객센터

@Controller
@RequestMapping("/buyer/help")
public class HelpController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
}

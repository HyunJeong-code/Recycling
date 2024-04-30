package recycling.seller.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 고객 문의 관리

@Controller
@RequestMapping("/seller/qna")
public class QnaController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
}

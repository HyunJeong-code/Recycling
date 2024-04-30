package recycling.manager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 관리자 마이 페이지

@Controller
@RequestMapping("/manager/mgr")
public class ManagerController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

}

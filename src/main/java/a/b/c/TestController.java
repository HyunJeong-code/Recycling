package a.b.c;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import a.b.c.service.face.TestService;

@Controller
public class TestController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private TestService testService;
	
	@GetMapping("/test")
	public void test() {
		logger.info("/test [GET]");
	}
	
	@PostMapping("/test")
	public String testProc(String test, Model model) {
		logger.info("/test [POST]");
		logger.info("{}", test);
		
		int res = testService.insert(test);
		
		logger.info("{}", res);
		
		model.addAttribute("res", res);
		
		return "redirect:./test";
	}
}

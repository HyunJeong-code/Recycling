package recycling.buyer.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.buyer.Oto;

// 회사 소개
@Controller
@RequestMapping("/buyer/about")
public class AboutController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("/info")
	public void info() {
		
	}
	
	@GetMapping("/location")
    public String location() {
        return "/buyer/about/location";
    }
	
	@GetMapping("/location2")
	public String location2() {
		return "/buyer/about/location2";
	}
	
	@GetMapping("/location3")
	public String location3() {
		return "/buyer/about/location3";
	}
	
}

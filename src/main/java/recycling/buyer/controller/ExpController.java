package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.ExpService;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.util.Paging;

// 메뉴 - 체험단

@Controller
@RequestMapping("/buyer/exp")
public class ExpController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ExpService expService;
	
	
	@RequestMapping("/main")
	public void main(
			Model model,
			@RequestParam(defaultValue = "0")int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "all") String category,
			Exp exp
			) {
		Paging paging = expService.getSearchPaging(curPage, search);
		logger.info("{}", paging);
		
		List<Exp> list;
        if ("recent".equals(category)) {
            list = expService.selectRecentExp(paging);
        } else if ("popular".equals(category)) {
            list = expService.selectPopularExp(paging);
        } else {
            list = expService.selectAllExp(paging);
        }

        // 상단 새체험, 인기체험
        List<Exp> topPopList = expService.selectTopPopExp();
        List<Exp> topRecList = expService.selectTopRecExp();
        

        model.addAttribute("paging", paging);
        model.addAttribute("list", list);
        model.addAttribute("topPopList", topPopList);
        model.addAttribute("search", search);
        model.addAttribute("category", category);
        model.addAttribute("topRecList", topRecList);
	}
	
	@GetMapping("/expdetail")
	public void expDetail(
			String expCode,
			Model model,
			HttpSession session
			) {
		
		Exp exp = expService.selectByExpCode(expCode);
		List<ExpFile> expFiles = expService.selectByExpFile(expCode);
		
		model.addAttribute("exp", exp);
		model.addAttribute("expFiles", expFiles);
		
	}
	
	@GetMapping("/exprvwlist")
	public void expRvwList() {
		
	}
	
	@GetMapping("/exprvwdetail")
	public void expRvwDetail() {
		
	}
	
	@GetMapping("/expresform")
	public void expResForm() {
		
	}
	
	@PostMapping("/expresform")
	public String expResFormProc() {
		
		return 
	}
}

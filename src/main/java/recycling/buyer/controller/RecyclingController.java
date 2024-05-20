package recycling.buyer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.RecyclingService;
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.util.Paging;

// 메뉴 - 재활용품

@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RecyclingService recyclingService;
	
	@GetMapping("/main")
	public void rcyMain(Model model,
				@RequestParam(defaultValue = "0")int curPage,
				@RequestParam(defaultValue = "") String search
				) {
		logger.info("/buyer/recycling/main [GET]");
		
		
		List<Prd> list = recyclingService.getPrdList();
		
		model.addAttribute("list", list);
		
	}
	
	
	@GetMapping("/rcydetail")
	public void rcyDetail(int prdno, Model model, int curPage, HttpSession session ) {
		logger.info("/buyer/recycling/main [GET]");
		
		Prd prd = recyclingService.view(prdno);
		Paging paging = recyclingService.getDetailPaging(curPage);
		
		model.addAttribute("paging", paging);
		model.addAttribute("prd", prd);
		
	}
	
	@GetMapping("/findseller")
	public String findSeller(@RequestParam String location, Model model) {
	    logger.info("/buyer/recycling/findseller [GET]");

	    // 위치 기반 판매자 정보 조회
	    String sellerName = recyclingService.findSeller(location);

	    if (sellerName == null) {
	        // 위치에 해당하는 판매자가 없을 경우 처리
	        model.addAttribute("message", "해당 위치에 판매자가 없습니다.");
	        return "error-page"; // 에러 페이지로 이동
	    }

	    // 판매자 정보를 모델에 추가
	    model.addAttribute("sellerName", sellerName);
	    model.addAttribute("location", location);

	    return "seller-info"; // 판매자 정보 페이지로 이동
	}
	
	@GetMapping("/rcycmt")
	public void rcycmt(@RequestParam("rcy") Rcy rcy, @RequestParam("rvwCode") int rvwCode, Model model) {
		logger.info("/buyer/recycling/rcycmt [GET]");
		
		List<Rcy> rcyList = recyclingService.gerRcyList();
		
		model.addAttribute("rcyList", rcyList);
	
	}
	
	
}

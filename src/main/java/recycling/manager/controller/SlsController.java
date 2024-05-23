package recycling.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.dto.seller.Seller;
import recycling.manager.service.face.SlsService;
import recycling.util.Paging;

@Controller
@RequestMapping("/manager/sls")
public class SlsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SlsService slsService;
	
	// 문의글 메인 페이지
	@RequestMapping("/main")
	public void main(@RequestParam(defaultValue = "0") int curPage, @RequestParam(defaultValue = "") String search,
			String category, Paging pagingParam, Model model) {

		Paging paging = new Paging();

		// 페이징 계산
		paging = slsService.getPaging(pagingParam);
//		logger.info("{}", paging);

		// 판매자 목록 조회
		List<Seller> main = slsService.main(paging);
//		logger.info("controller list: {}", list);

		model.addAttribute("paging", paging);
		model.addAttribute("main", main);

	}
}

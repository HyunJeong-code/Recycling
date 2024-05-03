package recycling.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.manager.service.face.CsService;
import recycling.util.Paging;

@Controller
@RequestMapping("/manager/cs")
public class CsController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CsService csService;

	// 문의글 메인 페이지
	@RequestMapping("/main")
	public void main(@RequestParam(defaultValue = "0") int curPage, @RequestParam(defaultValue = "") String search,
			String caregory, Paging pagingParam, Model model) {

		Paging paging = new Paging();

		// 페이징 계산
		paging = csService.getPaging(pagingParam);
		logger.info("{}", paging);

		// 게시글 목록 조회
		List<Oto> list = csService.list(paging);
		logger.info("controller list: {}", list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

	}

	// 구매자 리스트
	@RequestMapping("/buyerList")
	public String buyerList(@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search, String caregory, Paging pagingParam, Model model) {

		Paging paging = new Paging();

		// 페이징 계산
		paging = csService.getPaging(pagingParam);
		logger.info("{}", paging);

		// 구매자 목록 조회
		List<Buyer> buyerList = csService.buyerList(paging);

		model.addAttribute("paging", paging);
		model.addAttribute("buyerList", buyerList);

		return "manager/cs/buyerlist";
		
		// 테스트용 주석

	}

}

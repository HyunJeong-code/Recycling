package recycling.buyer.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import recycling.buyer.service.face.RecyclingService;
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerAns;
import recycling.dto.seller.SellerProf;
import recycling.dto.seller.SellerQST;

// 메뉴 - 재활용품

@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private RecyclingService recyclingService;
	
	@GetMapping("/main")
	public String rcyMain(Model model) {
		logger.info("/buyer/recycling/main [GET]");
		
		List<Prd> list = recyclingService.getPrdList();
		
		model.addAttribute("list", list);
		
		return "buyer/recycling/main";
	}
	
	
	@GetMapping("/rcydetail")
	public String rcyDetail(@RequestParam("prdcode") String prdCode, Model model, HttpSession session) {
		logger.info("/rcydetail [GET] - prdCode: {}", prdCode );
		
		Prd prd = recyclingService.view(prdCode);
		
		if (prd == null) {
			return "not-found-page";
		}
		
		SellerProf sellerProf = recyclingService.getSellerProf(prd.getsCode());
		
		model.addAttribute("prd", prd);
		model.addAttribute("sellerProf", sellerProf);
		
		return "buyer/recycling/rcydetail";
	}
	

	@GetMapping("/rcycmt")
	public String sellerQST(@RequestParam("qstCode") String qstCode, Model model) {
		logger.info("/buyer/recycling/rcycmt [GET]");
		
		SellerQST sellerQst = recyclingService.selectSellerQst(qstCode);
		List<SellerAns> answers  = recyclingService.selectSellerAnswers(qstCode);
		
		model.addAttribute("sellerQst", sellerQst);
		model.addAttribute("answers", answers);

		// 판매자 문의 조회 등의 기능 수행
		return "buyer/recycling/rcycmt";
	}
	
	@PostMapping("/write")
	public String insertSellerQST(SellerQST sellerQST, RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/write [POST]");
		
		int result = recyclingService.insertSellerQST(sellerQST);
		redirectAttributes.addAttribute("qstCode", sellerQST.getQstCode());
		
		return "redirect:/buyer/recycling/rcycmt";
	}
	
	
	@PostMapping("/edit")
	public String editSellerQST(SellerQST sellerQST, RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/edit [POST]");
		
		int result = recyclingService.updateSellerQST(sellerQST);
		redirectAttributes.addAttribute("qstCode", sellerQST.getQstCode());
		
		return "redirect:/buyer/recycling/rcycmt";
	}
	
	
	@PostMapping("/delete")
	public String deleteSellerQST(@RequestParam("qstCode") String qstCode, RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/delete [POST] - qstCode: {}", qstCode);
		
		int result = recyclingService.deleteSellerQST(qstCode);
		redirectAttributes.addAttribute("qstCode", qstCode);
		
		return "redirect:/buyer/recycling/rcycmt";
	}
	
	
	@PostMapping("/rcycmt/writeAnswer")
	public String writeSellerAnswer(SellerAns sellerAns, RedirectAttributes redirectAttributes) {
        logger.info("/buyer/recycling/rcycmt/writeAnswer [POST]");
        
        int result = recyclingService.insertSellerAnswer(sellerAns);
        redirectAttributes.addAttribute("qstCode", sellerAns.getQstCode());
        
        return "redirect:/buyer/recycling/rcycmt";
    }
	
	
	@PostMapping("/rcycmt/editAnswer")
    public String editSellerAnswer(SellerAns sellerAns, RedirectAttributes redirectAttributes) {
        logger.info("/buyer/recycling/rcycmt/editAnswer [POST]");
        
        int result = recyclingService.updateSellerAnswer(sellerAns);
        redirectAttributes.addAttribute("qstCode", sellerAns.getQstCode());
        
        return "redirect:/buyer/recycling/rcycmt";
    }
	
	@PostMapping("/rcycmt/deleteAnswer")
    public String deleteSellerAnswer(@RequestParam("qnaCode") String qnaCode, @RequestParam("qstCode") String qstCode, RedirectAttributes redirectAttributes) {
        logger.info("/buyer/recycling/rcycmt/deleteAnswer [POST] - qnaCode: {}", qnaCode);
        
        int result = recyclingService.deleteSellerAnswer(qnaCode);
        redirectAttributes.addAttribute("qstCode", qstCode);
        
        return "redirect:/buyer/recycling/rcycmt";
    }
	
}

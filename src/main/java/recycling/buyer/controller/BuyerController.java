package recycling.buyer.controller;

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

import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BuyerService buyerService;
	
	// 회원 정보 관리 메인 (비밀번호 입력)
	@GetMapping("/mymain")
	public void myMain() {
		
		logger.info("/buyer/mymain [GET]");
		
	}
	
	// 회원 정보 관리 메인 처리
	@PostMapping("/mymain")
	public String myMainProc(
			@RequestParam("password") String password,
			HttpSession session, Model model) {
		
		logger.info("/buyer/mypage/mymain [POST]");
		
		String bCode = (String) session.getAttribute("bCode");
		
		if(!buyerService.chkPw(bCode, password)) {
			
			model.addAttribute("error", "비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/mymain";
			
		}
		
		// 비밀번호 일치
		String buyerType = buyerService.getBuyerType(bCode);
			
		return "redirect:/buyer/mypage" + (buyerType.equals("pri") ? "mydetailpri" : "mydetailcmp");
		
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/changepw")
	public void changePw() {
		
		logger.info("/buyer/mypage/changepw [GET}");
		
	}
	
	// 비밀번호 변경 처리
	@PostMapping("/changepw")
	public String changePwProc(
			@RequestParam("currentPw") String currentPw,
			@RequestParam("newPw") String newPw,
			@RequestParam("confirmPw") String confirmPw,
			HttpSession session, Model model) {
		
		
		
		return "redirect:/buyer/mypage/mymain";
		
	}
	
	
	// 회원 정보 변경 (개인)
	@GetMapping("/mydetailpri")
	public String myDetailPri(HttpSession session, Model model) {
		
		logger.info("/buyer/mypage/mydetailpri [GET]");
		
		// 세션에서 구매자 코드 가져오기
		String bCode = (String) session.getAttribute("bCode");
		
		Buyer buyer = buyerService.getBuyerTypeByCode(bCode);
		
		BuyerAdr buyerAdr = buyerService.getBuyerAdr(bCode);
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("address", buyerAdr);
		
		return "/buyer/mydetailpri";
		
	}
	
	// 회원 정보 변경 처리 (개인)
	@PostMapping("/mydetailpri")
	public String myDetailPriProc(
			Buyer buyer,
			BuyerAdr buyerAdr,
			HttpSession session) {
		
		buyerService.updateBuyer(buyer);
		buyerService.updateBuyerAdr(buyerAdr);
		
		return "redirect:/buyer/mypage/mymain";
		
	}
	
	// 회원 정보 변경 (기업)
	@GetMapping("/mydetailcmp")
	public String myDetailCmp(HttpSession session, Model model) {
		
		logger.info("/buyer/mypage/mydetailcmp [GET]");
		
		String bCode = (String) session.getAttribute("bCode");
		
		Buyer buyer = buyerService.getBuyerById(bCode);
		
		BuyerAdr buyerAdr = buyerService.getBuyerAdr(bCode);
		
		Cmp cmp = buyerService.getCmpDetail(bCode);
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("address", buyerAdr);
		model.addAttribute("cmp", cmp);
		
		return "/buyer/mydetailcmp";
		
	}
	
	// 회원 정보 변경 처리 (기업)
	@PostMapping("/mydetailcmp")
	public String myDetailCmpProc(
			Buyer buyer,
			BuyerAdr buyerAdr,
			Cmp cmp,
			HttpSession session) {
		
		buyerService.updateBuyer(buyer);
		buyerService.updateBuyerAdr(buyerAdr);
		buyerService.updateCmpDetail(cmp);
		
		return "redirect:/buyer/mypage/mymain";
		
	}
	
}
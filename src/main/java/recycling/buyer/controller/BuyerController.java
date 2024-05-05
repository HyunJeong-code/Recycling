package recycling.buyer.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;

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
	
	@PostMapping("/mymain")
	public String myMainProc(
			@RequestParam("bPw") String bPw, 
			@RequestParam("bCtCode") String bCtCode
			, HttpSession session, Model model) {
		
		logger.info("/buyer/mypage/mymain [POST]");
		
		boolean chkPw = buyerService.selectByPwAndCt(bPw, bCtCode);
		
		if(chkPw) {
			
			// 로그인 상태
			session.setAttribute("login", true);
			
			// 구매자 유형
			session.setAttribute("userTpye", bCtCode);
			
			String type = "cmp".equals(bCtCode) ? "detailcmp" : "detailpri";
			
			return "redirect:/buyer/mypage" + type;
			
		} else {
			
			model.addAttribute("error", "비밀번호 틀림");
			
			return "redirect:/buyer/mypage/mymain";
			
		}
		
	}
	
	
	
	// 회원 정보 변경 (개인)
	@GetMapping("/mydetailpri")
	public String myDetailPri(HttpSession session, Model model) {
		
		logger.info("/buyer/mypage/mydetailpri [GET]");
		
		Buyer currentUser = (Buyer) session.getAttribute("currentUser");
		
		List<BuyerAdr> adrList = buyerService.getBuyerAdr(currentUser.getbCode());
		
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("adrList", adrList);
		
		return "buyer/mydetailpri";
		
	}
	
	// 회원 정보 변경 처리 (개인)
	@PostMapping("/mydetailpri")
	public String myDetailPriProc(
			Buyer buyer,
			BuyerAdr buyerAdr,
			HttpSession session) {
		
		buyerService.updateBuyerInfo(buyer, buyerAdr);
		
		session.setAttribute("currentUser", buyer);
		
		return "redirect:/buyer/mypage/mydetailpri";
		
		
	}
	
	
	
	
	// 회원 정보 변경 (기업)
	@GetMapping("/mydetailcmp")
	public String myDetailCmp() {
		
		logger.info("/buyer/mypage/mydetailcmp [GET]");
		
	}
	
		
	
	
	
}
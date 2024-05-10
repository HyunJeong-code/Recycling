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

import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BuyerService buyerService;
	
	// 회원 정보 관리 메인 (비밀번호 입력)
	@GetMapping("/mymain")
	public String myMain(
			HttpSession session
			) {
		
		logger.info("/buyer/mypage/mymain [GET]");
		
		Boolean isChecked = (Boolean) session.getAttribute("isChecked");
		
		if(isChecked != null && isChecked) {
			
			Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
			
			String buyerType = currentBuyer.getbCtCode();
		
			if("P".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailpri";
				
			} else if ("C".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailcmp";
				
			}
			
		}
		
		return "/buyer/mypage/mymain";
		
	}
	
	// 회원 정보 관리 메인 (비밀번호 입력) 처리
	@PostMapping("/mymain")
	public String myMainProc(
			@RequestParam("password") String password,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mymain [POST]");
		
		// 현재 로그인된 구매자 정보
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "/buyer/login";
			
		}
		
		// 비밀번호 확인
		if(buyerService.verifyPw(currentBuyer.getbId(), password)) {
			
			// 구매자 유형
			String buyerType = currentBuyer.getbCtCode();
			
			session.setAttribute("currentBuyer", currentBuyer);
			
			if("P".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailpri";
				
			} else if ("C".equals(buyerType)) {
				
				return "redirect:/buyer/mypage/mydetailcmp";
				
			}
			
		}
		
		model.addAttribute("error", "비밀번호가 틀렸습니다.");
		
		return "/buyer/mypage/mymain";
		
	}
	
	// 비밀번호 변경 페이지
	@GetMapping("/changepw")
	public void changePw(
			HttpSession session
			) {
		
		logger.info("/buyer/mypage/changepw [GET]");
		
	}
	
	// 비밀번호 변경 처리
	@PostMapping("/changepw")
	public String changePwProc(
			@RequestParam("currentPw") String currentPw,
			@RequestParam("newPw") String newPw,
			@RequestParam("confirmPw") String confirmPw,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/changepw [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/mypage/mymain";
			
		}
		
		if(!buyerService.verifyPw(currentBuyer.getbId(), currentPw)) {
			
			model.addAttribute("error", "현재 비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		if(!newPw.equals(confirmPw)) {
			
			model.addAttribute("error", "새 비밀번호가 일치하지 않습니다.");
			
			return "/buyer/mypage/changepw";
			
		}
		
		buyerService.changePw(currentBuyer.getbId(), newPw);
		
		model.addAttribute("success", "비밀번호가 변경되었습니다.");
		
		return "/buyer/mypage/changepw";
		
	}
	
	
	// 회원 정보 변경 (개인)
	@GetMapping("/mydetailpri")
	public void myDetailPri(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailpri [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return;
			
		}
		
		model.addAttribute("currentBuyer", currentBuyer);
		
	}
	
	// 회원 정보 변경 처리 (개인)
	@PostMapping("/mydetailpri")
	public String myDetailPriProc(
			Buyer buyer,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailpri [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/mypage/mymain";
			
		}
		
		buyer.setbCode(currentBuyer.getbCode());
		
		// 세션의 currentBuyer를 새로운 buyer 객체로 업데이트
		session.setAttribute("currentBuyer", buyer);
		
		model.addAttribute("success", "개인 정보가 수정되었습니다.");
		
		return "/buyer/mypage/mydetailpri";
		
	}
	
	// 회원 정보 변경 (기업)
	@GetMapping("/mydetailcmp")
	public void myDetailCmp(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailcmp [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
		Cmp cmp = buyerService.getCmpDetail(currentBuyer.getbCode());
		
		model.addAttribute("currentBuyer", currentBuyer);
		model.addAttribute("cmp", cmp);
		
	}
	
	// 회원 정보 변경 처리 (기업)
	@PostMapping("/mydetailcmp")
	public String myDetailCmpProc(
			Buyer buyer,
			Cmp cmp,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/mydetailcmp [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/mypage/mymain";
			
		}
		
		buyer.setbCode(currentBuyer.getbCode());
		cmp.setbCode(currentBuyer.getbCode());
		
		buyerService.updateCmpDetail(buyer, cmp);
		session.setAttribute("currentBuyer", buyer);
		
		model.addAttribute("success", "기업 정보가 수정되었습니다.");
		
		return "/buyer/mypage/mydetailcmp";
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제)
	@GetMapping("/myaddr")
	public void myAddr(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/myaddr [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
		List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdrList(currentBuyer);
		
		model.addAttribute("buyerAdrList", buyerAdrList);
		
	}
	
	// 배송지 관리 페이지 (등록, 수정, 삭제) 처리
	@PostMapping("/myaddr")
	public String myAddrProc(
			@RequestParam("action") String action,
			@RequestParam(value = "adrCode", required = false) String adrCode,
			BuyerAdr buyerAdr,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/myaddr [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		buyerAdr.setbCode(currentBuyer.getbCode());
		
		List<BuyerAdr> buyerAdrList = buyerService.getBuyerAdrList(currentBuyer.getbCode());
		
		switch(action) {
			case "register":
				
				if(buyerAdrList.size() >= 3) {
					
					model.addAttribute("error", "배송지는 최대 3개까지 등록할 수 있습니다.");
					
				} else {
					
					buyerService.registerAdr(buyerAdr);
					model.addAttribute("success", "배송지가 등록되었습니다.");
					
				}
				
				break;
				
			case "update":
				
				buyerAdr.setAdrCode(adrCode);
				buyerService.updateAdr(buyerAdr);
				model.addAttribute("success", "배송지가 수정되었습니다.");
				break;
				
			case "delete":
				
				buyerService.deleteAdr(adrCode);
				model.addAttribute("success", "배송지가 삭제되었습니다.");
				break;
		
			default:
				
				model.addAttribute("error", "에러입니다.");
				break;
		
		}
		
		buyerAdrList = buyerService.getBuyerAdrList(currentBuyer.getbCode());
		
		model.addAttribute("buyerAdrList", buyerAdrList);
		
		return "/buyer/mypage/myaddr";
		
	}
	
	// 회원 탈퇴
	@GetMapping("/outbuyer")
	public void outBuyer(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/outbuyer [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
	}
	
	// 회원 탈퇴 처리
	@PostMapping("/outbuyer")
	public String outBuyerProc(
			@RequestParam("password") String password,
			@RequestParam(value = "privacyConsent", required = false) String ps,
			@RequestParam(value = "infoConsent", required = false) String is,
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/outbuyer [POST]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			return "redirect:/buyer/login";
			
		}
		
		if(!buyerService.verifyPw(currentBuyer.getbId(), password)) {
			
			model.addAttribute("error", "비밀번호가 틀렸습니다.");
			
			return "/buyer/mypage/outbuyer";
			
		}
		
		if(ps == null || "agree".equals(ps) || is == null || !"agree".equals(is)) {
			
			model.addAttribute("error", "약관을 동의해주세요.");
			
			return "/buyer/mypage/outbuyer";
			
		}
		
		buyerService.deleteBuyer(currentBuyer.getbCode());
		
		session.invalidate();
		
		return "redirect:/buyer/login";
		
	}
	
	// 멤버쉽 관리
	@GetMapping("/myrank")
	public void myRank(
			HttpSession session,
			Model model
			) {
		
		logger.info("/buyer/mypage/myrank [GET]");
		
		Buyer currentBuyer = (Buyer) session.getAttribute("currentBuyer");
		
		if(currentBuyer == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return;
			
		}
		
		BuyerRank buyerRank = buyerService.getBuyerRank(currentBuyer.getRankNo());
		
		model.addAttribute("buyer", currentBuyer);
		model.addAttribute("buyerRank", buyerRank);
		
	}
	
}
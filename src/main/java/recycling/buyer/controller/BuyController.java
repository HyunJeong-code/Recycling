package recycling.buyer.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.service.face.BuyService;
import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.CmpFile;

// 구매자 메인페이지, 로그인/회원가입

@Controller
@RequestMapping("/buyer")
public class BuyController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyService buyService;
	@Autowired private JavaMailSenderImpl mailSender;
	
	@GetMapping("/main")
	public void main(
//			Authentication authentication,
			Model model
			) {
		logger.info("/buyer/main [GET]");
		
		List<Map<String, Object>> expPrd = buyService.selectExp();
		List<Map<String, Object>> rcyPrd = buyService.selectRcy();
		List<Map<String, Object>> upcyPrd = buyService.selectUpcy();
		
		logger.info("Rcy : {}", rcyPrd);
		logger.info("Upcy : {}", upcyPrd);
		
		model.addAttribute("rcy", rcyPrd);
		model.addAttribute("upcy", upcyPrd);
		
	}
	
	@GetMapping("/join")
	public void join() {
		logger.info("/buyer/join [GET]");
	}
	
	@PostMapping("/EmailAuth")
	@ResponseBody
	public int emailAuth(String email) {
		logger.info("/buyer/EmailAuth [POST]");
		
		logger.info("Email : {}", email);
		
		// 6자리 인증번호 난수로 생성
		Random rdn = new Random();
		int chkNum = rdn.nextInt(888888) + 111111;
		
		// 이메일 보낼 양식
		String setFrom = "tptkd__777@naver.com";
		String toMail = email;
		String title = "[새활용] 회원가입 인증번호 입니다.";
		String content = "인증 번호는 " + chkNum + " 입니다."
						+ "<br>" 
						+ "해당 인증 번호를 이메일 인증 번호 입력란에 입력해주세요.";
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper help = new MimeMessageHelper(mail, true, "utf-8");
			
			help.setFrom(setFrom);
			help.setTo(toMail);
			help.setSubject(title);
			help.setText(content, true);
			
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return chkNum;
	}
	
	@GetMapping("/prijoin")
	public void priJoin() {
		logger.info("/buyer/prijoin [GET]");
	}
	
	@PostMapping("/prijoin")
	public String priJoinProc(
			Buyer buyer, 
			BuyerAdr buyerAdr, 
			MultipartFile buyerProf,
			String sPhone, String inPhone, String mPhone, String lPhone,
			String bEmail2, String inEmail,
			Model model
			) {
		logger.info("/buyer/prijoin [POST]");		
		
		logger.info("buyer : {}", buyer);
		logger.info("buyerAdr : {}", buyerAdr);
		logger.info("buyerProf : {}", buyerProf);
		
		// 회원 정보 처리
		buyer = buyService.buyerProc(buyer, sPhone, inPhone, mPhone, lPhone, bEmail2, inEmail);
		logger.info("buyer : {}", buyer);
		
		int res = buyService.insertBuyer(buyer);
		
		// 회원 가입 성공
		
		int resProf = 0;
		int resAdr = 0;
		
		// 프로필, 주소 입력 X
		if(buyerProf.getOriginalFilename().equals("") && buyerAdr.getAdrPostcode().equals("")) {
			model.addAttribute("msg", "[회원가입 완료] 가입이 완료되었습니다. \n 판매자 전환을 위해서는 프로필 사진 및 기본 배송지 등록이 필요합니다.");
			model.addAttribute("url", "/buyer/login");
			return "/layout/alert";
		}
		
		// 프로필 삽입
		if(!buyerProf.getOriginalFilename().equals("")) {
			BuyerProf prof = buyService.fileSave(buyer, buyerProf);
			if(prof != null) {
				resProf = buyService.insertProf(prof);
			} else {
				model.addAttribute("msg", "[회원가입 실패] 입력 정보 확인이 필요합니다.");
				model.addAttribute("url", "/buyer/prijoin");
				return "/layout/alert";
			}
		}
		
		// 주소 삽입
		if(!buyerAdr.getAdrPostcode().equals("")) {
			buyerAdr = buyService.AdrProc(buyer, buyerAdr);
			resAdr = buyService.insertAdr(buyerAdr);
		}
		
		
		if(buyerProf.getOriginalFilename().equals("") || buyerAdr.getAdrPostcode().equals("")) {
			model.addAttribute("msg", "[회원가입 완료] 가입이 완료되었습니다. \n 판매자 전환을 위해서는 프로필 사진 및 기본 배송지 등록이 필요합니다.");
			model.addAttribute("url", "/buyer/login");
			return "/layout/alert";
		}
		
		model.addAttribute("msg", "[회원가입 완료] 가입이 완료되었습니다. \n 로그인 페이지로 이동합니다.");
		model.addAttribute("url", "/buyer/login");
		return "/layout/alert";
		
		
	}
	
	@PostMapping("/chkbid")
	@ResponseBody
	public int chkBid(String bId) {
		logger.info("/buyer/chkbid [POST]");
		
		logger.info("id : {}", bId);
		
		int res = buyService.selectCntById(bId);
		
		return res;
	}
	
	@GetMapping("/cmpjoin")
	public void cmpJoin() {
		logger.info("/buyer/cmpjoin [GET]");				
	}
	
	@PostMapping("/cmpjoin")
	public String cmpJoinProc(
			Buyer buyer, 
			BuyerAdr buyerAdr, 
			MultipartFile buyerProf,
			String sPhone, String inPhone, String mPhone, String lPhone,
			String bEmail2, String inEmail,
			Cmp cmp,
			MultipartFile cmpFile,
			Model model
			) {
		logger.info("/buyer/cmpjoin [POST]");
		
		logger.info("buyer : {}", buyer);
		logger.info("buyerAdr : {}", buyerAdr);
		logger.info("buyerProf: {}", buyerProf);
		
		logger.info("cmp: {}", cmp);
		logger.info("cmpFile: {}", cmpFile);
		
		// 회원 정보 처리
		buyer = buyService.buyerProc(buyer, sPhone, inPhone, mPhone, lPhone, bEmail2, inEmail);
		logger.info("buyer : {}", buyer);
		
		int res = buyService.insertBuyer(buyer);
		
		cmp = buyService.cmpProc(buyer, cmp);
		
		int resCmp = 0; 
		
		// 기업 정보 처리
		resCmp = buyService.insertCmp(cmp);			
		
		CmpFile file = null;
		
		int resFile = 0;
		// 기업 첨부 파일 처리
		file = buyService.cmpFileSave(cmp, cmpFile);
		
		if(file != null) {
			resFile = buyService.insertCmpFile(file);				
		} else {
			model.addAttribute("msg", "[회원가입 실패] 입력 정보 확인이 필요합니다.");
			model.addAttribute("url", "/buyer/cmpjoin");
			return "/layout/alert";
		}

		// 회원 가입 성공
		
		int resProf = 0;
		int resAdr = 0;
		
		// 프로필, 주소 입력 X
		if(buyerProf.getOriginalFilename().equals("") && buyerAdr.getAdrPostcode().equals("")) {
			model.addAttribute("msg", "[회원가입 완료] 가입이 완료되었습니다. \n 판매자 전환을 위해서는 프로필 사진 및 기본 배송지 등록이 필요합니다.");
			model.addAttribute("url", "/buyer/login");
			return "/layout/alert";
		}
		
		// 프로필 삽입
		if(!buyerProf.getOriginalFilename().equals("")) {
			BuyerProf prof = buyService.fileSave(buyer, buyerProf);
			if(prof != null) {
				resProf = buyService.insertProf(prof);
			} else {
				model.addAttribute("msg", "[회원가입 실패] 입력 정보 확인이 필요합니다.");
				model.addAttribute("url", "/buyer/cmpjoin");
				return "/layout/alert";
			}
		}
		
		// 주소 삽입
		if(!buyerAdr.getAdrPostcode().equals("")) {
			buyerAdr = buyService.AdrProc(buyer, buyerAdr);
			resAdr = buyService.insertAdr(buyerAdr);
		}
		
		if(buyerProf.getOriginalFilename().equals("") || buyerAdr.getAdrPostcode().equals("")) {
			model.addAttribute("msg", "[회원가입 완료] 가입이 완료되었습니다. \n 판매자 전환을 위해서는 프로필 사진 및 기본 배송지 등록이 필요합니다.");
			model.addAttribute("url", "/buyer/login");
			return "/layout/alert";
		}
		
		model.addAttribute("msg", "[회원가입 완료] 가입이 완료되었습니다. \n 로그인 페이지로 이동합니다.");
		model.addAttribute("url", "/buyer/login");
		return "/layout/alert";
	}
	
	@GetMapping("/login")
	public void login() {
		logger.info("/buyer/login [GET]");
	}
	
//	@PostMapping("/login")
//	public String loginProc(Buyer buyer, HttpSession session) {
//		logger.info("/buyer/login [POST]");
//		
//		logger.info("login : {}", buyer);
//		
//		BuyerLogin buyers = buyService.selectBybIdbPw(buyer);
//		
//		if(buyers != null && buyers.getbOut().equals("N")) {
//			session.setAttribute("buyers", buyers);
//			return "redirect:./main";
//		} else {
//			session.invalidate();
//			return "redirect:./loginfail";
//		}
//	}
	
	@GetMapping("/loginfail")
	public void loginFail() {
		logger.info("/buyer/loginfail [GET]");
	}
	
	@GetMapping("/findid")
	public void findId() {
		logger.info("/buyer/findid [GET]");
	}
	
	@PostMapping("/findid")
	public String findIdProc(
			Model model, 
			Buyer buyer, 
			String sPhone, String inPhone, String mPhone, String lPhone,
			String bEmail2, String inEmail
			) {
		logger.info("/buyer/findid [POST]");
		
		buyer = buyService.buyerProc(buyer, sPhone, inPhone, mPhone, lPhone, bEmail2, inEmail);
		logger.info("findId : {}", buyer);
		
		String bId = buyService.selectByBuyerId(buyer);
		model.addAttribute("bId", bId);
		
		return "redirect:/buyer/infoid";
	}
	
	@GetMapping("/infoid")
	public void infoId() {
		logger.info("/buyer/infoid [GET]");
	}
	
	@GetMapping("/findpw")
	public void findPw() {
		logger.info("/buyer/findpw [GET]");
	}
	
	@PostMapping("/findpw")
	public String findPwProc(
			Model model, 
			Buyer buyer, 
			String sPhone, String inPhone, String mPhone, String lPhone,
			String bEmail2, String inEmail,
			HttpSession session
			) {
		logger.info("/buyer/findpw [POST]");
		
		buyer = buyService.buyerProc(buyer, sPhone, inPhone, mPhone, lPhone, bEmail2, inEmail);
		
		logger.info("findPw : {}", buyer);
		
		buyer = buyService.selectByBuyerPw(buyer);
		model.addAttribute("buyer", buyer);
		
		if(buyer == null) {
			session.setAttribute("chkBuyer", "false");			
		} else {
			session.setAttribute("chkBuyer", "true");						
		}
		
		return "redirect:/buyer/changepw";
	}
	
	@GetMapping("/changepw")
	public String changePw(
			HttpSession session
			) {
		logger.info("/buyer/changePw [GET]");
		
		if((Boolean) session.getAttribute("chkBuyer")) {
			return "redirect:/buyer/changepw";
		} else {
			return "redirect:/buyer/findpw";
		}
	}
	
	@PostMapping("/changepw")
	public String changePwProc(
			Buyer buyer,
			Model model
			) {
		logger.info("/buyer/changePw [POST]");
		
		// 비밀번호 암호화 처리 필요
		logger.info("findPw : {}", buyer);
		
		int res = buyService.updatePw(buyer);
		
		if(res > 0) {
			model.addAttribute("msg", "비밀번호 변경이 완료되었습니다. \n 로그인 페이지로 이동합니다.");
			model.addAttribute("url", "/buyer/login");
			return "/buyer/alert";
		} else {
			model.addAttribute("msg", "비밀번호 변경 실패했습니다. 재시도가 필요합니다.");
			model.addAttribute("url", "/buyer/findpw");
			return "/buyer/alert";
		}
	}
	
	@GetMapping("/buyerheader")
	@ResponseBody
	public List<Map<String, Object>> buyerHeader(
			Model model
			) {
		logger.info("/buyer/buyerheader [GET]");
		
		List<Map<String, Object>> ntcList = buyService.selectNtc();
		logger.info("ntcList : {}", ntcList);
		logger.info("ntcList : {}", ntcList == null);
		
		return ntcList; 
//		return null;
	}
	
	@GetMapping("/mainsearch")
	public void mainSearch() {
		logger.info("/buyer/mainsearch [GET]");
	}
}
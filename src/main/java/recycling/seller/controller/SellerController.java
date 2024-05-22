package recycling.seller.controller;

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
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Buyer;
import recycling.dto.seller.Seller;
import recycling.seller.service.face.SellerService;

// 판매자 정보 관리

@Controller
@RequestMapping("/seller/mypage")
public class SellerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SellerService sellerService;
	
    @GetMapping("/sellermain")
    public String main(@RequestParam("pw") String pw, HttpSession session) {
        
        String buyerPassword = sellerService.selectSeller(pw);
        
        // 입력한 비밀번호와 구매자의 비밀번호가 일치하는지 확인
        if (pw.equals(buyerPassword)) {
            // 일치하면 판매자 정보를 세션에 저장하고 세부 페이지로 이동
            session.setAttribute("seller", sellerService.getSellerInfo(pw));
            return "redirect:/sellerdetail";
        } else {
            // 일치하지 않으면 로그인 페이지로 이동
            return "redirect:/sellermain";
        }   
    }

    //----------------------------------------------------------------------------------------------------------------
	 
	 @GetMapping("/changepw")
	 public String changePw() {
		 
		return "/changepw";
	 }
	 
	 @PostMapping("/changepw")
	 public String changePwProc(@RequestParam("bPw") String bPw, @RequestParam("newPw") String newPw) {
	        // 판매자 비밀번호 변경 서비스 호출
	        boolean isChanged = sellerService.updatePw(bPw, newPw);
	        if (isChanged) {
	            // 변경 성공
	            return "redirect:/sellerdetail";
	        } else {
	            // 변경 실패
	            return "redirect:/changepw";
	        }
	 }

	//----------------------------------------------------------------------------------------------------------------
 
	 
	 @GetMapping("/changebank")
	 public String changeBank(HttpSession session, Model model ) {
		 
		 Seller seller = (Seller) session.getAttribute("seller");
		 
		 model.addAttribute("seller", seller);
		 
	    // 계좌번호 변경 페이지로 이동
	        return "/changebank"; // 이동할 페이지명
	 }
	 
	 @PostMapping("/changebank")
	 public String changeBankProc(@RequestParam("accName")String accName,
			 					@RequestParam("accBank")String accBank,
			 					@RequestParam("accNo")String accNo,
			 					HttpSession session) {
		 
		 Seller seller = (Seller) session.getAttribute("seller");
		 seller.setAccName(accName);
		 seller.setAccBank(accBank);
		 seller.setAccNo(accNo);
		 sellerService.updateBank(seller);
		 
		 
		 return "redirect:/sellermain";
	 }
	 
	 //----------------------------------------------------------------------------------------------------------------
	 
	 @GetMapping("/sellerdetail")
	 public String sellerDetail(HttpSession session, Model model) {
	        // 판매자 정보 페이지로 이동
	        // 판매자 정보를 세션에서 가져와서 모델에 추가하여 뷰에 전달
	        Seller seller = (Seller) session.getAttribute("seller");
	        model.addAttribute("seller", seller);
	        return "/sellerdetail"; // 이동할 페이지명
	 }

	 @PostMapping("/sellerdetail")
	 public String sellerDetailProc(@ModelAttribute Seller seller,
			 						@RequestParam("file") MultipartFile file ) {
	        //이미지 파일 업로드
		 	String filename = sellerService.uploadImage(file);
//		 	seller.setfile(file);
		 
		 
	        // 변경된 정보를 DB에 업데이트
		 	sellerService.updateSellerProf(seller);
		 	
	        // 이후 이동할 페이지명 반환
	        return "redirect:/sellermain";
	 }

	 //----------------------------------------------------------------------------------------------------------------

	 
	 @GetMapping("/outSeller")
	 public void outSeller(HttpSession session,
			 				Model model
			 				) {
	     
		 Seller seller =(Seller)session.getAttribute("seller");
		 
				 
		if(seller == null) {
			
			model.addAttribute("error", "로그인해주세요");
			 return ;
		}
		
	 }

	 @PostMapping("/outSeller")
	 public String outSellerProc(HttpSession session,
			 					@RequestParam("Pw") String Pw,
			 					@RequestParam(value = "privacyConsent", required = false) String ps,
			 					@RequestParam(value ="infoConsent", required = false) String is,
			 					Model model
			 					) {
	        // 회원 탈퇴 처리
	        // 입력한 비밀번호가 회원 정보와 일치하는지 확인 후 탈퇴 처리
		 Seller seller = (Seller)session.getAttribute("seller");
		 Buyer buyer = (Buyer)session.getAttribute("buyer");
		 if(seller == null) {
			 
			 return "redirect:/";
		 }
		 if(!sellerService.verifPw(seller.getbCode(),Pw)) {
			 
			 model.addAttribute("error", "비밀번호가 틀렸습니다");
			 
			 return "/";
		 }
		 
		 if(ps==null || "agree".equals(ps) || is==null || "agree".equals(is) ) {
			 
			 model.addAttribute("error", "약관을 동의해 주세요.");
			 
			 return "/";
		 }
		 
		 sellerService.deleteSeller(seller.getbCode());
		 
		 session.invalidate();
		 		 
		 
	        return "redirect:/"; // 탈퇴 후 이동할 페이지명
	 }
	 
	
	 
	 
	 
	 
}





























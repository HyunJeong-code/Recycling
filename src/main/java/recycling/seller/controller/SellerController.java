package recycling.seller.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	        
	        String buyerPassword = sellerService.getBuyerPwBySellerCode(pw);

	        // 입력한 비밀번호와 구매자의 비밀번호가 일치하는지 확인
	        if (pw.equals(buyerPassword)) {
	            // 일치하면 판매자 정보를 세션에 저장하고 메인 페이지로 이동
	            session.setAttribute("seller", sellerService.getSellerInfo(pw));
	            return "redirect:/sellermain";
	        } else {
	            // 일치하지 않으면 로그인 페이지로 이동
	            return "redirect:/login";
	        }
	
	
	
}

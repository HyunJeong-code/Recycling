package recycling.seller.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import recycling.dto.seller.Seller;
import recycling.seller.service.face.SellService;

// 판매자 메인 페이지 + 판매자 전환

@Controller
@RequestMapping("/seller")
public class SellController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellService sellService;
	
	@GetMapping("/main")
	public String main(HttpSession session) {
		logger.info("/seller/main [GET]");
		
		String bCode = (String) session.getAttribute("bCode");
		logger.info("{}", bCode);
		
		// 로그인이 안되어 있는 경우, 회원가입 페이지로 넘어감
		if(bCode == null) {
			return "buyer/login";
		}
		
		Seller seller = sellService.selectSeller(bCode);
		
		session.setAttribute("sCode", seller.getsCode());
		session.setAttribute("sChk", seller.getsChk());
		
		// 로그인은 되어있으나 판매자가 아닌 경우
		if(seller == null) {
			return "seller/sellerinfo";
		// 판매자 신청은 했으나 허가 되지 않은 경우
		} else if(seller.getsChk().equals("N")) {	
			return "seller/sellerinfo";
		// 판매자인 경우
		} else {
			return "redirect: ./main";
		}
	}
	
	@GetMapping("/sellerinfo")
	public void sellerinfo(HttpSession session) {
		logger.info("/seller/sellerinfo [GET]");		
	}
	
	@PostMapping("/sellerinfo")
	public void sellerinfoProc(HttpSession session, Seller seller, Model model) {
		logger.info("/seller/sellerinfo [POST]");
		
		seller.setbCode((String) session.getAttribute("bCode"));
		logger.info("{}", seller);
		
		// 구매자 정보에서 주소 정보 가져오기
		Map<String, Object> map = sellService.selectBuyerAdr(seller.getbCode());
		
		int res = sellService.insertSeller(seller);
		
		model.addAttribute("res", res);
	}
	
}

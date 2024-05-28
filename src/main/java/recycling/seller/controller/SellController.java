package recycling.seller.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	   public String main(
	         ) {
	      logger.info("/seller/main [GET]");
	      
	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      
	      
	      // 판매자인 경우
	      if(auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_SELLER"))) {
	         return "/seller/main";
	      } else {
	         // 로그인은 되어있으나 판매자가 아닌 경우
	         // 판매자 신청은 했으나 허가 되지 않은 경우
	         return "/seller/sellerinfo";
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

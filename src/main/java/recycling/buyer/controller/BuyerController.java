package recycling.buyer.controller;

import java.util.ArrayList;
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
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.Orders;

// 마이페이지 - 회원 정보 관련

@Controller
@RequestMapping("/buyer/mypage")
public class BuyerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BuyerService buyerService;
	
	@GetMapping("/cart")
	public void cart(HttpSession session, Model model) {
		//테스트용 세션
		session.setAttribute("bCode", "1");
		
		String bCode = (String)session.getAttribute("bCode");
		
		List<Cart> list = buyerService.selectAllCart(bCode);
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/login")
	public void login() {
	}
	
	@GetMapping("/pay")
	public void pay(
			@RequestParam(defaultValue="test") List<String> checkList,
			Model model
			
			) {
		logger.info("checkList : {}", checkList);
		
		List<Cart> list = new ArrayList<Cart>();
		
		for (String c : checkList) {
            Cart cart = buyerService.selectBycCode(c);
            
            list.add(cart);
        }
		
		logger.info("list : {}", list);
		
		model.addAttribute("clist", list);
		
		//List<Cart> list = buyerService.selectAllCart(bCode);
		
	}
	
	@PostMapping("/pay")
	public String payProc(Orders order, Model model) {
		
		//카트담긴것 Order_detail로 인서트
		
		//Prd 수량 update --증감
		
		//카트 딜리트
		
		int res = buyerService.order(order);
		
		model.addAttribute("order", order);
		
		return "jsonView";
	}
	
	@GetMapping("/payinfo")
	public void payinfo(@RequestParam("ordCode") String ordCode, Model model) {
		logger.info("{}",ordCode);
		
		Orders order = buyerService.selectByordCode(ordCode);
		
		model.addAttribute("order", order);
	}
	
}

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
import recycling.dto.buyer.CartOrder;
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
		
		//해당 session의 Cart List 정보
		List<CartOrder> list = buyerService.selectAllCart(bCode);
		
		//재고 부족 알림 메시지
		String msg = "";
		
		//현재 상품 재고과 장바구니에 담긴 상품 수량 확인
		for(CartOrder e : list) {
			Integer count = buyerService.selectByprdCode(e.getPrdCode());
			logger.info("prd count : {}", count);
			logger.info("cart count : {}", e.getcCnt());
			
			
			
			//재고가 부족할시 장바구니에서 DELETE
			if(count < e.getcCnt()) {
				
				//처음이 아닐때 컴마 추가
				if(msg != "") {
					msg += ", ";
				}
				//
				msg += e.getPrdName();
				
				logger.info("{} 상품의 재고가 부족합니다", e.getPrdName());
				//buyerService.deleteCart(e.getPrdCode());
				
			}
		}
		
		msg += " 상품의 수량이 부족하여 장바구니에서 제외되었습니다.";
		
		logger.info("{}",msg);
		
		logger.info("{}", list);
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/login")
	public void login() {
	}
	
	@GetMapping("/pay")
	public void pay(
			@RequestParam List<String> checkList,
			Model model
			
			) {
		logger.info("checkList : {}", checkList);
		
		List<CartOrder> list = new ArrayList<CartOrder>();
		
		for (String c : checkList) {
			CartOrder cart = buyerService.selectBycCode(c);
            
            list.add(cart);
        }
		
		logger.info("list : {}", list);
		
		model.addAttribute("clist", list);
		
		//List<Cart> list = buyerService.selectAllCart(bCode);
		
	}
	
	@PostMapping("/pay")
	public String payProc(Orders order, Model model) {
		
		//카트담긴것 Order_detail로 인서트
		
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

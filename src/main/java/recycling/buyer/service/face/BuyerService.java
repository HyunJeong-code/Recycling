package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Cart;
import recycling.dto.buyer.Orders;

// 마이페이지 - 회원 정보 관련

public interface BuyerService {
	
	/**
	 * 주문하기
	 * 
	 * @param order - 주문 정보
	 */
	public void order(Orders order);

	/**
	 * Cart 조회하기
	 * 
	 * @param bCode - 조회할 아이디를 담은 sesison
	 * @return - 아이디로 조회된 모든 Cart List
	 */
	public List<Cart> selectAllCart(String bCode);
	
}

package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.buyer.Cart;
import recycling.dto.buyer.Orders;

// 마이페이지 - 회원 정보 관련 DB 처리

public interface BuyerDao {	
	
	/**
	 * 주문 추가
	 * 
	 * @param order - 주문 정보
	 */
	public void insertOrder(Orders order);
	
	/**
	 * Cart 조회하기
	 * 
	 * @param bCode - 조회할 아이디를 담은 sesison
	 * @return - 아이디로 조회된 모든 Cart List
	 */
	public List<Cart> selectAllCart(String bCode);
	
}

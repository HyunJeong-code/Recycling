package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.Orders;

// 마이페이지 - 회원 정보 관련

public interface BuyerService {
	
	/**
	 * 주문하기
	 * 
	 * @param order - 주문 정보
	 */
	public int order(Orders order);

	/**
	 * Cart 조회하기
	 * 
	 * @param bCode - 조회할 아이디를 담은 session
	 * @return - 아이디로 조회된 모든 Cart List
	 */
	public List<CartOrder> selectAllCart(String bCode);

	/**
	 * cCode로 Cart 조회하기
	 * 
	 * @param c - 받아오는 cCode
	 * @return - 조회한 Cart 정보
	 */
	public CartOrder selectBycCode(String c);

	/**
	 * ordCode로 Orders 조회하기
	 * 
	 * @param ordCode - 조회할 ordCode
	 * @return - 조회한 Orders 정보
	 */
	public Orders selectByordCode(String ordCode);

	/**
	 * prdCode로 상품 수량 확인
	 * 
	 * @param prdCode - 조회할 상품의 prdCode
	 * @return - 해당 상품 수량
	 */
	public Integer selectByprdCode(String prdCode);

	/**
	 * 선택된 상품 삭제
	 * 
	 * @param cCode - 삭제할 cCode
	 * @return - 삭제 결과
	 */
	public int deleteCart(String cCode);
	
}

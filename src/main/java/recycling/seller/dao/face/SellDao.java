package recycling.seller.dao.face;

import recycling.dto.seller.Seller;

// 메인 페이지 관련 DB

public interface SellDao {
	
	/**
	 * 판매자인지 판단을 위한 조회
	 * 
	 * @param bCode
	 * @return Seller DTO 반환
	 */
	public Seller selectSeller(String bCode);

}

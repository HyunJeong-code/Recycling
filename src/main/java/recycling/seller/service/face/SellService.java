package recycling.seller.service.face;

import recycling.dto.seller.Seller;

// 판매자 전환 및 공지사항, 메인 페이지 관련 처리

public interface SellService {

	/**
	 * 판매자인지 판단을 위한 조회
	 * 
	 * @param bCode
	 * @return Seller DTO 반환
	 */
	public Seller selectSeller(String bCode);

}

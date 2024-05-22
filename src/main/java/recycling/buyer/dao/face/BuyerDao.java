package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Seller;

// 마이페이지 - 회원 정보 관련 DB 처리
public interface BuyerDao {

	/**
	 * 판매자 찾기
	 * 
	 * @param sCode
	 * @return
	 */
	List<Seller> findSeller(String sCode);

}

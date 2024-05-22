package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Seller;

// 재활용품 관련 DB 처리
public interface RecyclingDao {

	/**
	 * 판매자 찾기
	 * 
	 * @param sCode
	 * @return
	 */
	List<Seller> findSeller();
	

}

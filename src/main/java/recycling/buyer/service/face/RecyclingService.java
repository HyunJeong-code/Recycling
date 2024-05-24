package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.seller.Seller;

public interface RecyclingService {
	
	/**
	 * 판매자 찾기
	 * 
	 * @return
	 */
	public List<Seller> findSeller();

}

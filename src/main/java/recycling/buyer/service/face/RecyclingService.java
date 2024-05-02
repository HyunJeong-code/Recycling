package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.seller.Prd;
import recycling.util.Paging;

public interface RecyclingService {

	/**
	 * 상품리스트의 상품 전체 조회
	 * 
	 * @return 상품 DTO를 가진 List
	 */
	public List<Prd> getPrdList();

	public Paging getSearchPaging(int curPage, String search);


}

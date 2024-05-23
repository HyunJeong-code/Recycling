package recycling.manager.service.face;

import java.util.List;

import recycling.dto.seller.Seller;
import recycling.util.Paging;

// 판매제휴팀 관련 처리
public interface SlsService {

	/**
	 * 판매자 목록
	 * 
	 * @param paging
	 * @return
	 */
	public List<Seller> main(Paging paging);
	
	
	/**
	 * 페이징
	 * 
	 * @param pagingParam
	 * @return
	 */
	public Paging getPaging(Paging pagingParam);


}

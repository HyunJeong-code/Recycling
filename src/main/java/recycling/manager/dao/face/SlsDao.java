package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.seller.Seller;
import recycling.util.Paging;

// 판매제휴팀 DB 처리
public interface SlsDao {

	/**
	 * 판매지 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Seller> main(Paging paging);

	/**
	 * 페이징
	 * 
	 * @return
	 */
	public int getPaging();

}

package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.util.Paging;

// 구매CS팀 DB 처리
public interface CsDao {

	/**
	 * 구매자 문의글 조회
	 * 
	 * @param paging
	 * @return
	 */
<<<<<<< HEAD
	public List<Oto> selectAllOto(Paging paging);
=======
	public List<Oto> selectAllAns(Paging paging);
>>>>>>> 5af42b50ef2c5fe536e8ba7553745618348b41fb

	/**
	 * 총 게시글 조회
	 * 
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 모든 구매자 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Buyer> selectAllBuyer(Paging paging);

}

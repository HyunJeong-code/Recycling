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
	public List<Oto> selectAllOto(Paging paging);
	
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

	/**
	 * 구매자 상세 조회
	 * 
	 * @param buyer
	 * @return
	 */
	public Buyer selectByBuyer(Buyer buyer);	

	/**
	 * 구매자 수정
	 * 
	 * @param buyer
	 * @return
	 */
	public void updateBuyer(Buyer buyer);
	
	public Buyer selectBcode(String bCode);
	
	/**
	 * 구매자 삭제
	 * 
	 * @param bCode
	 * @return 
	 */
	public int deleteBuyer(Buyer buyer);

}

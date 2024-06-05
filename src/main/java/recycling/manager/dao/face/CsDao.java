package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Manager;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 구매CS팀 DB 처리
public interface CsDao {

	/**
	 * 구매자 문의글 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Oto> list(PagingAndCtg upPaging);
	
	/**
	 * 문의글 페이징
	 * 
	 * @param upPaging
	 * @return
	 */
<<<<<<< HEAD
	public int getPaging(PagingAndCtg upPaging);
=======
	public int selectCntAllotoList(PagingAndCtg upPaging);
	
	/**
	 * 구매자 페이징
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllbuyerList(PagingAndCtg upPaging);
>>>>>>> TEST

	/**
	 * 모든 구매자 조회
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Buyer> buyerList(PagingAndCtg upPaging);

	/**
	 * 구매자 상세 조회
	 * 
	 * @param buyer
	 * @return
	 */
	public Buyer buyerDetail(Buyer buyer);	

	/**
	 * 구매자 수정
	 * 
	 * @param buyer
	 * @return
	 */
	public void buyerUpdate(Buyer buyer);
	
	/**
	 * 구매자 수정
	 * 
	 * @param bCode
	 * @return
	 */
	public Buyer getBuyer(String bCode);
	
	/**
	 * 구매자 삭제
	 * 
	 * @param bCode
	 * @return 
	 */
	public int buyerDel(Buyer buyer);

	/**
	 * 문의 내용 상세
	 * 
	 * @param otoCode
	 * @return
	 */
	public Oto ansForm(String otoCode);

	/**
	 * 문의 내용 답글 작성
	 * @param ans
	 * @return
	 */
	public void ansFormInsert(Ans ans);

	/**
	 * 문의글 삭제
	 * 
	 * @param otoCode
	 */
	public void otoDel(String otoCode);

	/**
	 * 답글 목록
	 * 
	 * @param otoCode
	 * @return
	 */
	public List<Ans> viewCom(String otoCode);

}
package recycling.manager.service.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.util.Paging;

// 구매 CS팀 관련 처리
public interface CsService {

	/**
	 * 문의 목록
	 * 
	 * @param paging
	 * @return
	 */
	public List<Oto> list(Paging paging);

	/**
	 * 페이징
	 * 
	 * @param pagingParam
	 * @return
	 */
	public Paging getPaging(Paging pagingParam);

	/**
	 * 구매자 목록
	 * 
	 * @param paging
	 * @return
	 */
	public List<Buyer> buyerList(Paging paging);

	/**
	 * 구매자 상세
	 * 
	 * @param buyer
	 * @return
	 */
	public Buyer buyerDetail(Buyer buyer);

	/**
	 * 구매자 수정
	 * buyerUpdate
	 * 
	 * @param buyer
	 * @return
	 */
	public Buyer getBuyer(String bCode);
	
	/**
	 * 구매자 수정
	 * buyerUpdateForm
	 * 
	 * @param buyer
	 */
	public void buyerUpdate(Buyer buyer);

	/**
	 * 구매자 삭제
	 * 
	 * @param bCode
	 * @return 
	 */
	public void buyerDel(Buyer buyer);

	/**
	 * 문의글 상세조회
	 * 
	 * @param otoCode
	 * @return
	 */
	public Oto ansForm(String otoCode);

	/**
	 * 문의 답변 작성
	 * 
	 * @param mgrId
	 * @param ansCode
	 * @param ansContent
	 * @return
	 */
//	public String ansFormInsert(String mgrId, String ansCode, String ansContent);
	public String ansFormInsert(String ansCode, String ansContent);

	/**
	 * 문의글 삭제
	 * 
	 * @param otoCode
	 */
	public void otoDel(String otoCode);

}

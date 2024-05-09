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
	 * 
	 * @param buyer
	 * @return
	 */
	public Buyer buyerUpdate(Buyer buyer);

	/**
	 * 구매자 삭제
	 * 
	 * @param bCode
	 * @return 
	 */
	public Buyer buyerDel(String bCode);

}

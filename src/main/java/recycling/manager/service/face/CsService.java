package recycling.manager.service.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Manager;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 구매 CS팀 관련 처리
public interface CsService {

	/**
	 * 문의 목록
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Oto> list(PagingAndCtg upPaging);
	
	/**
	 * 문의 페이징
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllotoList(PagingAndCtg upPaging);

	/**
	 * 구매자 페이징
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllbuyerList(PagingAndCtg upPaging);

	/**
	 * 구매자 목록
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Buyer> buyerList(PagingAndCtg upPaging);

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
	 * @param mgrCode
	 * @param ansCode
	 * @param ansContent
	 * @param otoCode 
	 * @return
	 */
	public void ansFormInsert(String mgrCode, String ansCode, String ansContent, String otoCode);

	/**
	 * 문의글 삭제
	 * 
	 * @param otoCode
	 */
	public void otoDel(String otoCode);

	/**
	 * 답변 리스트
	 * 
	 * @param otoCode
	 * @return
	 */
	public List<Ans> viewCom(String otoCode);

	public boolean chkNull(List<Ans> comments);

	/**
	 * 파일 보기
	 * 
	 * @param otoCode
	 * @return
	 */
	public List<OtoFile> getOtoFiles(String otoCode);

}
package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Seller;
import recycling.util.Paging;

// 체험단 관련 DB 처리

public interface ExpDao {

	/**
	 * 체험단 전체 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectAllExp(Paging paging);

	/**
	 * 검색된 데이터 개수
	 * 
	 * @param search - 데이터 입력
	 * @return 입력된 데이터를 검색
	 */
	public int selectCntAll(String search);

	/**
	 * 최신순 체험단 전체 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectRecentExp(Paging paging);

	/**
	 * 인기순위 체험단 전체 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectPopularExp(Paging paging);

	/**
	 * 인기순 체험단 5개 리스트
	 * 
	 * @return 체험단 List
	 */
	public List<Exp> selectTopPopExp();

	/**
	 * 새체험 체험단 5개 리스트
	 * 
	 * @return 체험단 List
	 */
	public List<Exp> selectTopRecExp();

	/**
	 * expCode와 일치하는 체험단 상세정보
	 * 
	 * @param expCode - 체험단 코드
	 * @return 체험단 상세정보
	 */
	public Exp selectByExpCode(String expCode);

	/**
	 * expCode와 일치하는 이미지
	 * 
	 * @param expCode - 체험단 코드
	 * @return file 
	 */
	public List<ExpFile> selectByExpFile(String expCode);

	/**
	 * 판매자 상세정보
	 * 
	 * @param sCode - 판매자 코드
	 * @return seller
	 */
	public Seller getSellerInfo(String sCode);

	/**
	 * 판매자의 구매자 정보
	 * 
	 * @param bCode - 구매자코드
	 * @return buyer
	 */
	public Buyer getBuyerInfo(String bCode);

	/**
	 * expCode와 일치하는 체험단 조회수
	 * 
	 * @param expCode - 체험단 코드
	 */
	public void updateExpHit(String expCode);

	/**
	 * 개인 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 개인 구매자 정보
	 */
	public Buyer getBuyerDetail(String bId);

	/**
	 * 체험단 시간/날짜 예약 가능 시간List
	 * 
	 * @param expCode - 체험단 코드
	 * @return 시간/날짜 List 
	 */
	public List<ExpSch> getExpSchList(String expCode);

	public ExpSch getExpSch(int schNo);

	public void insertExpRes(ExpRes expRes);

	public void updateExpSchCnt(Map<String, Object> params);

}

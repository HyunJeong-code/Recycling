package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Cmt;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

public interface RecyclingService {
	
	/**
	 * 판매자 찾기
	 * 
	 * @return
	 */
	public List<Seller> findSeller();
	
	/**
	 * 판매자 코드로 재활용품 조회
	 * 
	 * @param sCode
	 * @return
	 */
	public List<Prd> findRcyBySellerCode(String sCode);
	
	 /** 제품 DTO에서 리스트를 불러온다
	List<Seller> findSeller();
	// 제품 DTO에서 리스트를 불러온다
	// List<Seller> findSeller();
	// 제품 DTO에서 리스트를 불러온다
	// List<Seller> findSeller();
	
	/**
	 * 제품 DTO에서 리스트를 불러온다
	 * 
	 * @return
	 */
	public List<Prd> selectPrdList();
	
	/**
	 * 최신 상품부터 조회
	 * @return
	 */
	public List<Prd> selectLatestList();

	/**
	 * 조회수가 많은 상품부터 조회
	 * @return
	 */
	public List<Prd> selectHitList();
	
	/**
	 * 상품별 할당된 이미지 썸네일 로드
	 * @return
	 */
	public List<String> selectPrdImageThums(String prdCode);

	/**
	 * 최신순 상품리스트 이미지 썸네일 로드
	 * @return
	 */
	public List<String> selectLatestPrdImageThums(String prdCode);

	/**
	 * 조회순 상품리스트 이미지 썸네일 로드
	 * @return
	 */
	public List<String> selectHitPrdImageThums(String prdCode);

	

	/**
	 * 제품번호를 기준으로 불러오면서 제품 정보를 불러온다
	 * 
	 * @param prdno 제품번호
	 * @return 제품번호의 상세페이지
	 */
	public Prd view(String prdCode);
	
	/**
	 * 제품번호를 기준으로 상품 썸네일 로드
	 * @param prdCode
	 * @return
	 */
	public String selectPrdImageThum(String prdCode);
	
	/**
	 * 제품번호를 기준으로 상품 상세이미지 로드
	 * @param prdCode
	 * @return
	 */
	public List<String> selectPrdImageDetail(String prdCode);
	
	/**
	 * 판매자 기본 정보 로드
	 * 
	 * @param getsCode 판매자 코드
	 * @return 판매자 정보
	 */
	public Seller selectSeller(String getsCode);
	
	/**
	 * 판매자 정보 상세조회
	 * @param getbCode 구매자코드
	 * @return 판매자 상세 정보
	 */
	public Buyer selectBuyerByBCode(String getbCode);
	
	/**
	 * 판매자 거래 횟수 카운트 
	 * 
	 * @param	getsCode 프라이머리키인 sCode
	 */
	public int selectShipCnt(String getsCode);

	/**
	 * 판매자 상세 프로필을 가져오는 코드
	 * 
	 * @param	getsCode 프라이머리키인 sCode
	 * @return	판매자 상세 정보
	 */
	public Seller getSeller(String sCode);

	/**
	 * 구매자 문의글 로드
	 * @param prdCode 제품번호
	 * @return
	 */
	public List<Map<String, Object>> selectRcyList(String prdCode);
	
	/**
	 * 판매자 답변글 로드
	 * @param rcyCode 제품번호
	 * @return
	 */
	public Cmt selectCmtByRcyCode(String rcyCode);

	/**
	 * 판매자 답변 작성
	 * @param cmt 판매자 답변 DTO
	 * @return
	 */
	public int insertCmt(Cmt cmt);


	/**
	 * 개인 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 개인 구매자 정보
	 */
	public Buyer selectBuyerDetail(String bId);


	/**
	 * 파일 정보 DB에 삽입
	 * 
	 * @param rcy
	 * @return
	 */
	public int insertRcy(Rcy rcy);

	/**
	 * 조회수 증가
	 *
	 * @param prdCode
	 */
	public void updateHit(String prdCode);




	

	

	

	

}

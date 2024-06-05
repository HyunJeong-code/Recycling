package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

public interface RecyclingService {
	
	/**
	 * 판매자 찾기
	 * 
	 * @return
	 */
	public List<Seller> findSeller();
	
//<<<<<<< Updated upstream
	/**
	 * 판매자 코드로 재활용품 조회
	 * 
	 * @param sCode
	 * @return
	 */
	public List<Prd> findRcyBySellerCode(String sCode);
	
	 /** 제품 DTO에서 리스트를 불러온다
	List<Seller> findSeller();
=======
	// 제품 DTO에서 리스트를 불러온다
	// List<Seller> findSeller();
>>>>>>> Stashed changes
	
	/**
	 * 제품 DTO에서 리스트를 불러온다
	 * 
	 * @return
	 */
	public List<Prd> getPrdList();

	/**
	 * 제품번호를 기준으로 불러오면서 제품 정보를 불러온다
	 * 
	 * @param prdno 제품번호
	 * @return 제품번호의 상세페이지
	 */
	public Prd view(String prdCode);
	
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
//<<<<<<< Updated upstream
	public Seller getSeller(String sCode);

	public List<Map<String, Object>> selectQnaList(String prdCode);
//=======
//	public SellerProf getSellerProf(String sCode);

	/**
	 * 판매자 문의 코드를 통해서 판매자 문의 불러오기
	 * 
	 * @param qstCode	문의 코드
	 * @return	판매자 문의
	 */
//	public SellerQST selectSellerQst(String qstCode);
//>>>>>>> Stashed changes

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
	 * @param oto
	 * @return
	 */
//<<<<<<< Updated upstream
	public int insertOto(Oto oto);
//=======
//	public int insertSellerAnswer(SellerAns sellerAns);

	/**
	 * 판매자 문의 답변 수정
	 * 
	 * @param sellerAns
	 * @return
	 */
//	public int updateSellerAnswer(SellerAns sellerAns);



	
	/**
	 * 판매자 문의 답변 삭제
	 * 
	 * @param qnaCode
	 * @return
	 */
	public int deleteSellerAnswer(String qnaCode);
//>>>>>>> Stashed changes
}

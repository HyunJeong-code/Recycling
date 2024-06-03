package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

public interface UpcyclingService {

	/**
	 * 제품 DTO에서 리스트를 불러온다
	 * 
	 * @return
	 */
	public List<Prd> selectPrdList();

	/**
	 * 제품번호를 기준으로 불러오면서 제품 정보를 불러온다
	 * 
	 * @param prdno 제품번호
	 * @return 제품번호의 상세페이지
	 */
	public Prd selectPrd(String prdCode);
	
	/**
	 * 판매자 정보을 가져오는 코드
	 * 
	 * @param	getsCode 프라이머리키인 sCode
	 * 
	 */
	public Seller selectSeller(String getsCode);

	
	/**
	 * 개인 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 개인 구매자 정보
	 */
	public Buyer selectBuyerCode(int bCode);
	
	/**
	 * 구매
	 * 
	 * @param getbId
	 * @return
	 */
	public Buyer selectBuyerDetail(String getbId);

	/**
	 * 리뷰 DTO 로드
	 * @param prdCode 제품번호
	 * 
	 * @return 제품번호에 맞는 리뷰
	 */
	public List<Map<String, Object>> selectRvwList(String prdCode);

	/**
	 * 리뷰 상세 조회
	 * @param rvwCode 리뷰번호
	 * @return 특정 리뷰번호 로드
	 */
	public UpcyReview selectRvw(String upcyCode);

	/**
	 * 파일 정보 DB에 삽입
	 * 
	 * @param review
	 * @return
	 */
	public int	insertReview(UpcyReview review);
	
	

}

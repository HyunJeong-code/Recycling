package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import recycling.dto.seller.Seller;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.seller.Prd;

public interface RecyclingService {
	
	/**
	 * 판매자 찾기
	 * 
	 * @return
	 */
	public List<Seller> findSeller();
	
	 /** 제품 DTO에서 리스트를 불러온다
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
	public Prd view(String prdCode);
	
	/**
	 * 판매자 기본 정보 로드
	 * 
	 * @param getsCode 판매자 코드
	 * @return 판매자 정보
	 */
	public Seller selectSeller(String getsCode);

	/**
	 * QnA 코드 로드
	 * 
	 * @param prdCode 로드에 필요한 제품 코드
	 * @return QnA
	 */
	public List<Map<String, Object>> selectQnaList(String prdCode);

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
	public int insertOto(Oto oto);




	
	

	

}

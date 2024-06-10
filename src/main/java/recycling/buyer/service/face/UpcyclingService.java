package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
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
	public Prd selectPrd(String prdCode);
	
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
	 * 판매자 정보을 가져오는 코드
	 * 
	 * @param	getsCode 프라이머리키인 sCode
	 * 
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
	 * @param prdCode 
	 * 
	 * @return
	 */
	public List<Map<String, Object>> selectRvwList(String prdCode);

	/**
	 * 리뷰 상세 조회
	 * @param rvwCode 리뷰번호
	 * @return 특정 리뷰번호 로드
	 */
	public UpcyReview selectRvw(String upcyCode);

	/**
	 * 리뷰 등록
	 * 
	 * @param rvwContent 리뷰 내용
	 * @param prdCode 
	 * @param buyer 작성자 로그인 정보
	 */
	public int	insertReview(UpcyReview review);

	/**
	 * 장바구니 상품 갯수 조회
	 * 
	 * @param cart - cart DTO
	 * @return - cCnt
	 */
	public Integer selectcCnt(Cart cart);

	/**
	 * 장바구니 수량 업데이트
	 * 
	 * @param cart - cart DTO
	 * @return - UPDATE 결과
	 */
	public int updatecCnt(Cart cart);
	
	/**
	 * 장바구니 추가
	 * 
	 * @param cart - cart DTO
	 * @return - INSERT 결과
	 */
	public int insertCart(Cart cart);

	/**
	 * 구매 상품 정보 조회
	 * 
	 * @param prdCode - 조회할 상품의 prdCode
	 * @return - 조회결과
	 */
	public CartOrder selectCartOrder(String prdCode);




}
package recycling.buyer.dao.face;

import java.util.List;


import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

// 업사이클 관련 DB 처리

public interface UpcyclingDao {

	public List<Prd> selectPrdList();
	public List<Prd> selectLatestList();
	public List<Prd> selectHitList();
	
	public List<String> selectPrdImageThums(String prdCode);
	public List<String> selectLatestPrdImageThums(String prdCode);
	public List<String> selectHitPrdImageThums(String prdCode);

	public Prd selectPrd(String prdCode);
	public String selectPrdImageThum(String prdCode);
	public String selectPrdImageDetail(String prdCode);
	
	public Seller selectSeller(String getsCode);
	
	public Buyer selectBuyerByBCode(String getbCode);

	public int selectShipCnt(String getsCode);

	public Buyer selectBcode(int bCode);

	public List<UpcyReview> selectRvwList(String prdCode);

	public UpcyReview selectRvw();

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
	
	public Buyer selectBuyerBybId(String bId);

	public int insertReview(UpcyReview review);


}

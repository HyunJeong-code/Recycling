package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

// 업사이클 관련 DB 처리

public interface UpcyclingDao {

	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);
	
	public Seller selectSeller(String getsCode);

	public Buyer selectBcode(int bCode);

	public List<Map<String, Object>> selectRvwList(String prdCode);

	public UpcyReview selectRvw();

	public void insertReview(Map<String, Object> reviewData);

	public void updateReview(@Param("upcyCode") String upcyCode, @Param("upcyContent") String upcyContent);

	public void deleteReview(String upcyCode);

	
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





	

}
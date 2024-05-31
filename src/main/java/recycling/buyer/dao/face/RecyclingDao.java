package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

// 재활용품 관련 DB 처리
public interface RecyclingDao {

	/**
	 * 판매자 찾기
	 * 
	 * @param sCode
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
	
	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);

	public Seller selectSellerProfByCode(String sCode);

}

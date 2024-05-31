package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.seller.Prd;

// 재활용품 관련 DB 처리

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
	
	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);

	public Seller selectSeller(String getsCode);

	public List<Map<String, Object>> selectQnaList(String prdCode);
	
	/**
	 * 후기 작성자 이름 불러오기
	 * @param bCode 구매자 코드
	 * @return bName (구매자 이름)
	 */
	public Buyer selectBuyerByBCode(String bCode);

	public Buyer selectBuyerBybId(String bId);
	
	public int insertOto(Oto oto);

}

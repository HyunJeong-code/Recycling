package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;

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
	
	/**
	 * 판매자 코드로 재활용품 조회
	 * 
	 * @param sCode
	 * @return
	 */
	public List<Prd> findRcyBySellerCode(String sCode);
	
	public List<Prd> selectPrdList();
	public List<Prd> selectLatestList();
	public List<Prd> selectHitList();
	
	public List<String> selectPrdImageThum(String prdCode);
	public List<String> selectLatestPrdImageThum(String prdCode);
	public List<String> selectHitPrdImageThum(String prdCode);

	public Prd selectPrd(String prdCode);
	public List<String> selectPrdImageDetail(String prdCode);

	public Seller selectSellerProfByCode(String sCode);

	public Seller selectSeller(String getsCode);
	
	public Buyer selectBuyerByBCode(String getbCode);

	public int selectShipCnt(String getsCode);
	
	public List<Map<String, Object>> selectQnaList(String prdCode);
	
	/**
	 * 후기 작성자 이름 불러오기
	 * @param bCode 구매자 코드
	 * @return bName (구매자 이름)
	 */

	public Buyer selectBuyerBybId(String bId);
	
	
	public int insertRcy(Rcy rcy);

	




}
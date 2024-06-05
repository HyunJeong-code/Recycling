package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

// 업사이클 관련 DB 처리

public interface UpcyclingDao {

	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);
	
	public Seller selectSeller(String getsCode);
	
	public Buyer selectBuyerByBCode(String getbCode);

	public int selectShipCnt(String getsCode);

	public Buyer selectBcode(int bCode);

	public List<Map<String, Object>> selectRvwList(String prdCode);

	public UpcyReview selectRvw();
	
	public Buyer selectBuyerBybId(String bId);

	public int insertReview(UpcyReview review);






}

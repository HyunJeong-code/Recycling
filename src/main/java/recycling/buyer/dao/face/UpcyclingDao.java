package recycling.buyer.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;
import recycling.dto.seller.SellerProf;

// 업사이클 관련 DB 처리

public interface UpcyclingDao {

	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);
	
	public Seller selectSeller(String getsCode);

	public SellerProf selectSellerProf(String sCode);

	public Buyer selectBcode(int bCode);

	public List<UpcyReview> selectRvwList(String prdCode);

	public UpcyReview selectRvw();

	public void insertReview(@Param("rvwContent") String rvwContent, @Param("prdCode") String prdCode, @Param("buyer") Buyer buyer);

	public void updateReview(@Param("upcyCode") String upcyCode, @Param("upcyContent") String upcyContent);

	public void deleteReview(String upcyCode);




	

}

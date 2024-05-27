package recycling.buyer.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Review;
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;

// 업사이클 관련 DB 처리

public interface UpcyclingDao {

	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);

	public SellerProf selectSellerProf(String sCode);

	public Buyer selectBcode(int bCode);

	public List<Review> selectRvwList(String prdCode);

	public Review selectRvw();

	public void insertReview(@Param("rvwContent") String rvwContent, @Param("prdCode") String prdCode, @Param("buyer") Buyer buyer);

	public void updateReview(@Param("rvwCode") int rvwCode, @Param("rvwContent") String rvwContent);

	public void deleteReview(int rvwCode);


	

}

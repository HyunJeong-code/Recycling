package recycling.buyer.dao.face;

import java.util.List;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Param;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Review;
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;
=======
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Review;
import recycling.dto.seller.Prd;
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

// 업사이클 관련 DB 처리

public interface UpcyclingDao {

	public List<Prd> selectPrdList();

<<<<<<< HEAD
	public Prd selectPrd(String prdCode);

	public SellerProf selectSellerProfByCode(String sCode);

	public Buyer selectBcode(int bCode);

	public List<Review> selectRvwList(String prdCode);

	public Review selectRvwByCode();

	public void updateReview(@Param("rvwCode") int rvwCode, @Param("rvwContent") String rvwContent);

	public void writeReview(@Param("rvwContent") String rvwContent, @Param("prdCode") String prdCode, @Param("buyer") Buyer buyer);

	public void deleteReview(int rvwCode);


=======
	public Prd selectPrd(int ctPno);

	public Buyer selectBcode(int bCode);

	public List<Review> selectRvwList();

	public Review selectRvwByCode();

	public void updateReview(int rvwCode, String rvwContent);

	public void writeReview(String rvwContent, Buyer buyer);

	public void deleteReview(int rvwCode);

>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
	

}

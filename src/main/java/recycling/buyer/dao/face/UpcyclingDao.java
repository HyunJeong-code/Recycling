package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Review;
import recycling.dto.seller.Prd;

// 업사이클 관련 DB 처리

public interface UpcyclingDao {

	public List<Prd> selectPrdList();

	public Prd selectPrd(int ctPno);

	public Buyer selectBcode(int bCode);

	public List<Review> selectRvwList();

	public Review selectRvwByCode();

	public void updateReview(int rvwCode, String rvwContent);

	public void writeReview(String rvwContent, Buyer buyer);

	public void deleteReview(int rvwCode);

	

}

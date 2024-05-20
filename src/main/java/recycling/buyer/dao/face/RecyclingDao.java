package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

// 재활용품 관련 DB 처리

public interface RecyclingDao {

	public List<Prd> selectPrdList();

	public int selectCntAll();
	
	public Prd select(int prdno);

	public Seller findSellerByLocation(String location);

	public List<Rcy> selectRcy();

	
	

}

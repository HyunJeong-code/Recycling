package recycling.buyer.dao.face;

import java.util.List;

<<<<<<< HEAD
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;
=======
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

// 재활용품 관련 DB 처리

public interface RecyclingDao {

	public List<Prd> selectPrdList();

<<<<<<< HEAD
	public Prd selectPrd(String prdCode);

	public SellerProf selectSellerProfByCode(String sCode);
=======
	public int selectCntAll();
	
	public Prd select(int prdno);

	public Seller findSellerByLocation(String location);

	public List<Rcy> selectRcy();

	
	
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

}

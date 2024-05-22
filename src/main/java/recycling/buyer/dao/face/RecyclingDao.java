package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;

// 재활용품 관련 DB 처리

public interface RecyclingDao {

	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);

	public SellerProf selectSellerProfByCode(String sCode);

}

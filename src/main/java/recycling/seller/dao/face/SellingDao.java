package recycling.seller.dao.face;

import java.util.List;

import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.util.Paging;

// 상품-판매 관련 DB

public interface SellingDao {

	public List<Exp> selectMyExpList(Paging paging);

	public int selectCntAll(String search);


}

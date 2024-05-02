package recycling.seller.dao.face;

import java.util.List;

import recycling.dto.seller.Exp;

// 상품-판매 관련 DB

public interface SellingDao {

	public List<Exp> selectMyExpList();

}

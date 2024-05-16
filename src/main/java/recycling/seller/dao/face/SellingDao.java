package recycling.seller.dao.face;

import java.util.List;

import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.util.Paging;

// 상품-판매 관련 DB

public interface SellingDao {

	public List<Exp> selectMyExpList(Paging paging);

	public int selectCntAll(String search);

	public int selectPageAll();

	public Exp selectByExp(String expCode);

	public List<ExpRes> selectResList(String expCode);

//	public List<ExpRes> selectResList(String expCode, Paging paging);


}

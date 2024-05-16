package recycling.seller.service.face;

import java.util.List;

import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.util.Paging;

// 상품-판매 관련 처리

public interface SellingService {

	public List<Exp> selectMyExpList(Paging paging);

	public Paging getSearchPaging(int curPage, String search);

	public Paging getPaging(int curPage);

	public Exp selectByExp(String expCode);

//	public List<ExpRes> selectResList(String expCode, Paging paging);
	public List<ExpRes> selectResList(String expCode);


}

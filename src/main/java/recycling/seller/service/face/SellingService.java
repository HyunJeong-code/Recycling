package recycling.seller.service.face;

import java.util.List;

import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.util.Paging;

// 상품-판매 관련 처리

public interface SellingService {

	public List<Exp> selectMyExpList(Paging paging);

	public Paging getSearchPaging(int curPage, String search);


}

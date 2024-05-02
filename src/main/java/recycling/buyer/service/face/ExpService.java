package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.seller.Exp;
import recycling.util.Paging;

public interface ExpService {

	Paging getPaging(int curPage);

	List<Exp> selectAllExp(Paging paging);

}

package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.seller.Exp;
import recycling.util.Paging;

public interface ExpService {

	public Paging getPaging(int curPage);

	public List<Exp> selectAllExp(Paging paging);

}

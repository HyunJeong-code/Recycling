package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Exp;
import recycling.util.Paging;

// 체험단 관련 DB 처리

public interface ExpDao {

	public int selectCntAll();

	public List<Exp> selectAllExp(Paging paging);

}

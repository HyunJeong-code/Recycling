package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

// 고객 센터 관련 DB 처리

public interface HelpDao {

	public int selectPageAll();

	public List<Faq> selectAllFaq(Paging paging);

	public List<FaqCt> selectAllCtFaq(Paging paging);

	public List<Notice> selectByCategory(int i);

	public Notice selectByNotice(String ntcCode);

	public void ntcHit(String ntcCode);

}

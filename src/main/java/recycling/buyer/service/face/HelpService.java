package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

public interface HelpService {

	public Paging getPaging(int curPage);

	public List<Faq> selectAllFaq(Paging paging);

	public List<FaqCt> selectAllCtFaq(Paging paging);

	public List<Notice> selectNoticeSeller();

	public List<Notice> selectNoticeBuyer();

	public Notice selectByNotice(String ntcCode);

}

package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
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

	public void insertOto(Oto oto);


	public List<OtoCt> selectAllOtoCt();

	public List<Oto> selectAllOto();

	public List<Oto> selectByCtOto(String string);

	public List<OtoCt> getAllOct();



}

package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.HelpDao;
import recycling.buyer.service.face.HelpService;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

@Service
public class HelpServiceImpl implements HelpService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private HelpDao helpDao;
	
	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = helpDao.selectPageAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Faq> selectAllFaq(Paging paging) {
		
		return helpDao.selectAllFaq(paging);
	}

	@Override
	public List<FaqCt> selectAllCtFaq(Paging paging) {
		return helpDao.selectAllCtFaq(paging);
	}

	@Override
	public List<Notice> selectNoticeSeller() {
		List<Notice> sellerNotices = helpDao.selectByCategory(1);
		
		return sellerNotices;
	}

	@Override
	public List<Notice> selectNoticeBuyer() {
		List<Notice> buyerNotices = helpDao.selectByCategory(0);
		
		return buyerNotices;
	}

	@Override
	public Notice selectByNotice(String ntcCode) {
		helpDao.ntcHit(ntcCode);
		
		return helpDao.selectByNotice(ntcCode);
	}
}

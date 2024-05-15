package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Manager;
import recycling.manager.dao.face.CsDao;
import recycling.manager.service.face.CsService;
import recycling.util.Paging;

@Service
public class CsServiceImpl implements CsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CsDao csDao;

	@Override
	public List<Oto> list(Paging paging) {
		logger.info("service");
		return csDao.list(paging);
	}

	@Override
	public Paging getPaging(Paging pagingParam) {

		// 총 게시글 수 조회
		int totalCount = csDao.getPaging();

		// 페이징 계산
		Paging paging = new Paging(totalCount, pagingParam.getCurPage(), pagingParam.getSearch());

		return paging;
	}

	@Override
	public List<Buyer> buyerList(Paging paging) {
		return csDao.buyerList(paging);
	}

	@Override
	public Buyer buyerDetail(Buyer buyer) {
		return csDao.buyerDetail(buyer);
	}
	
	@Override
	public Buyer getBuyer(String bCode) {
		return csDao.getBuyer(bCode);
	}

	@Override
	public void buyerUpdate(Buyer buyer) {
		csDao.buyerUpdate(buyer);
	}

	@Override
	public void buyerDel(Buyer buyer) {
		int res = csDao.buyerDel(buyer);				
	}

	@Override
	public Oto ansForm(String otoCode) {
		return csDao.ansForm(otoCode);
	}

	@Override
//	public String ansFormInsert(String mgrId, String ansCode, String ansContent) {
	public String ansFormInsert(String ansCode, String ansContent) {
//		Manager mgr = new Manager();
		Ans ans = new Ans();
		
//		mgr.setMgrId(mgrId);
		ans.setAnsCode(ansCode);
		ans.setAnsContent(ansContent);
		
		return csDao.ansFormInsert(ans);
	}

	@Override
	public void otoDel(String otoCode) {
	    csDao.otoDel(otoCode);
	}

}

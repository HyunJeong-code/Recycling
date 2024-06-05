package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Manager;
import recycling.manager.dao.face.CsDao;
import recycling.manager.service.face.CsService;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class CsServiceImpl implements CsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CsDao csDao;

	@Override
	public List<Oto> list(PagingAndCtg upPaging) {
//		logger.info("service");
		return csDao.list(upPaging);
<<<<<<< HEAD
	}

	@Override
	public int getPaging(PagingAndCtg upPaging) {
		return csDao.getPaging(upPaging);
=======
	}
	
	@Override
	public int selectCntAllotoList(PagingAndCtg upPaging) {
		return csDao.selectCntAllotoList(upPaging);
	}

	@Override
	public int selectCntAllbuyerList(PagingAndCtg upPaging) {
		return csDao.selectCntAllbuyerList(upPaging);
>>>>>>> TEST
	}

	@Override
	public List<Buyer> buyerList(PagingAndCtg upPaging) {
		return csDao.buyerList(upPaging);
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
	public void ansFormInsert(String mgrCode, String ansCode, String ansContent, String otoCode) {
	    Ans ans = new Ans();
	    ans.setMgrCode(mgrCode);
	    ans.setAnsCode(ansCode);
	    ans.setAnsContent(ansContent);
	    ans.setOtoCode(otoCode);

	    csDao.ansFormInsert(ans);
	}


	@Override
	public void otoDel(String otoCode) {
//		System.out.println("Delete otoCode: " + otoCode);
	    csDao.otoDel(otoCode);
	}

	@Override
	public List<Ans> viewCom(String otoCode) {
//		logger.info("servocedddddddddddddddddddddd");
		return csDao.viewCom(otoCode);
	}

	@Override
	public boolean chkNull (List<Ans> comments) {
		if(comments == null) {
			return false;
		} else {
			return true;
		}
	}

}

package recycling.seller.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.AllPrd;
import recycling.dto.seller.Exp;
import recycling.seller.dao.face.SellingDao;
import recycling.seller.service.face.SellingService;
import recycling.util.Paging;

@Service
public class SellingServiceImpl implements SellingService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingDao sellingDao;
	
//	@Override
//	public List<AllPrd> selectAllPrd(BuyerLogin seller) {
//		List<AllPrd> allPrd = sellingDao.selectAllPrd(seller);
//		
//		for(AllPrd prd : allPrd) {
//			
//		}
//		
//		return allPrd;
//	}
	
	@Override
	public List<Exp> selectMyExpList(Paging paging) {
		
		
		return sellingDao.selectMyExpList(paging);
	}

	@Override
	public Paging getSearchPaging(int curPage, String search) {
		
		Paging paging = null;
		
		int totalCount = sellingDao.selectCntAll(search);
		
		if("".equals(search)) {
			paging = new Paging(totalCount, curPage, search);
		} else {
			paging = new Paging(totalCount, curPage, search);
		}
		return paging;
	}

	@Override
	public Exp selectByExp(String expCode) {
		
		return sellingDao.selectByExp(expCode);
	}

	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = sellingDao.selectPageAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<ExpRes> selectResList(Paging paging) {
		
		return sellingDao.selectResList(paging);
	}


}

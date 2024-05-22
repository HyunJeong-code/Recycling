package recycling.seller.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.seller.Exp;
import recycling.dto.seller.Prd;
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
	public List<Prd> selectAllrcyPrd(String sCode) {
		return sellingDao.selectAllrcyPrd(sCode);
	}
	
	@Override
	public List<MyOrder> selectAllMyOrder(String prdCode) {
		return sellingDao.selectAllMyOrder(prdCode);
	}
	
	@Override
	public List<Prd> selectAllupcyPrd(String sCode) {
		return sellingDao.selectAllupcyPrd(sCode);
	}
	
	@Override
	public int deletePrd(String prdCode) {
		return sellingDao.deletePrd(prdCode);
	}
	
	@Override
	public Prd selectByprdCode(String prdCode) {
		return sellingDao.selectByprdCode(prdCode);
	}
	
	@Override
	public int updatePrd(Prd prd) {
		return sellingDao.updatePrd(prd);
	}
	
	@Override
	public OrderDetail selectByorddtCode(String orddtCode) {
		return sellingDao.selectByorddtCode(orddtCode);
	}
	
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
	public List<ExpRes> selectResList(String expCode) {
		return sellingDao.selectResList(expCode);
	}

//	@Override
//	public List<ExpRes> selectResList(String expCode, Paging paging) {
//		
//		return sellingDao.selectResList(expCode, paging);
//	}

}

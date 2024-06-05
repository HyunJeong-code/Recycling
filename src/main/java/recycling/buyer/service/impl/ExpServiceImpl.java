package recycling.buyer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.ExpDao;
import recycling.buyer.service.face.ExpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.ExpReview;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Seller;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class ExpServiceImpl implements ExpService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ExpDao expDao;
	@Autowired private ServletContext servletContext;
	
	@Override
	public List<Exp> selectTopPopExp() {
		return expDao.selectTopPopExp();
	}

	@Override
	public List<Exp> selectTopRecExp() {
		return expDao.selectTopRecExp();
	}

	@Override
	public Exp selectByExpCode(String expCode) {
		expDao.updateExpHit(expCode);
		
		return expDao.selectByExpCode(expCode);
	}

	@Override
	public List<ExpFile> selectByExpFile(String expCode) {
		
		return expDao.selectByExpFile(expCode);
	}

	@Override
	public Seller getSellerInfo(String sCode) {
		
		return expDao.getSellerInfo(sCode);
	}

	@Override
	public Buyer getBuyerInfo(String bCode) {
		return expDao.getBuyerInfo(bCode);
	}

	@Override
	public Buyer getBuyerDetail(String bId) {
		return expDao.getBuyerDetail(bId);
	}

	@Override
	public List<ExpSch> getExpSchList(String expCode) {
		
		return expDao.getExpSchList(expCode);
	}

	@Override
	public ExpSch getExpSch(int schNo) {
		
		return expDao.getExpSch(schNo);
	}

	@Override
	public void insertExpRes(ExpRes expRes) {
		expDao.insertExpRes(expRes);
	}

	@Override
	public void updateExpSchCnt(int schNo, int resCnt) {
		Map<String, Object> params = new HashMap<>();
        params.put("schNo", schNo);
        params.put("resCnt", resCnt);
		expDao.updateExpSchCnt(params);
	}

	@Override
	public ExpRes selectByResCode(String resCode) {
		
		
		return expDao.selectByResCode(resCode);
	}

	@Override
	public void insertExpReview(ExpReview expReview) {
		expDao.insertExpReview(expReview);
		
	}

	@Override
	public List<ExpRes> selectByBuyerChk(Map<String, Object> params) {
		return expDao.selectByBuyerChk(params);
	}

	@Override
	public BuyerProf getBuyerProf(String bCode) {
		
		return expDao.getBuyerProf(bCode);
	}

	@Override
	public int selectCntAllExpList(PagingAndCtg upPaging) {
		return expDao.selectCntAllExpList(upPaging);
	}

	@Override
	public List<Exp> selectRecentExp(PagingAndCtg upPaging) {
		return expDao.selectRecentExp(upPaging);
	}

	@Override
	public List<Exp> selectPopularExp(PagingAndCtg upPaging) {
		return expDao.selectPopularExp(upPaging);
	}

	@Override
	public List<Exp> selectAllExp(PagingAndCtg upPaging) {
		return expDao.selectAllExp(upPaging);
	}

	@Override
	public List<Map<String, Object>> selectRvwByExp(String expCode) {
		// TODO Auto-generated method stub
		return expDao.selectRvwByExp(expCode);
	}
	
//	@Override
//	public List<Map<String, Object>> selectRvwByExp(String expCode, PagingAndCtg upPaging) {
//		return expDao.selectRvwByExp(expCode, upPaging);
//	}

//	@Override
//	public int selectCntRvwList(PagingAndCtg upPaging) {
//		
//		return expDao.selectCntRvwList(upPaging);
//	}

//	@Override
//	public int selectCntRvwList(PagingAndCtg upPaging, String expCode) {
//		Map<String, Object> params = new HashMap<>();
//	    params.put("expCode", expCode);
//	    params.put("search", upPaging.getSearch());
//		return expDao.selectCntRvwList(upPaging, expCode);
//	}
//
//@Override
//public List<Map<String, Object>> selectRvwByExp(Map<String, Object> params) {
//	return expDao.selectRvwByExp(params);
//}

	
	
}

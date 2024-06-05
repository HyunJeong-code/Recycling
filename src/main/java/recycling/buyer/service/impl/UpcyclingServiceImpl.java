package recycling.buyer.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.UpcyclingDao;
import recycling.buyer.service.face.UpcyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

@Service
public class UpcyclingServiceImpl implements UpcyclingService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private UpcyclingDao upcyclingDao;
	
	@Override
	public List<Prd> selectPrdList() {
		
		List<Prd> prdList = upcyclingDao.selectPrdList();
		logger.info("selectPrdList() - prdList size: {}", prdList.size());
		for(Prd prd : prdList) {
	        logger.info("selectPrdList() - Prd: {}", prd);
	    }
		
		return prdList;
	}
	
	@Override
	public Prd selectPrd(String prdCode) {
		
		Prd prd = upcyclingDao.selectPrd(prdCode);
		
		if (prd != null) {
            logger.info("selectByPrdCode() - Prd found: {}", prd);
        } else {
            logger.info("selectByPrdCode() - No Prd found with prdCode: {}", prdCode);
        }
		
		return prd;
	}

	@Override
	public Seller selectSeller(String getsCode) {
		return upcyclingDao.selectSeller(getsCode);
	}
	
	@Override
	public Buyer selectBuyerByBCode(String getbCode) {
		return upcyclingDao.selectBuyerByBCode(getbCode);
	}

	
	@Override
	public int selectShipCnt(String getsCode) {
		return upcyclingDao.selectShipCnt(getsCode);
	}
	

	@Override
	public Buyer selectBuyerCode(int bCode) {
		return upcyclingDao.selectBcode(bCode);
	}
	
	@Override
	public Buyer selectBuyerDetail(String bId) {
		return upcyclingDao.selectBuyerBybId(bId);
	}

	@Override
	public int insertReview(UpcyReview review) {
		return upcyclingDao.insertReview(review);
	}
	
	@Override
	public List<Map<String, Object>> selectRvwList(String prdCode) {
		
	    List<Map<String, Object>> reviewList = upcyclingDao.selectRvwList(prdCode);
	    if (reviewList != null && !reviewList.isEmpty()) {
	        logger.info("selectRvwList() - Review list found for product code: {}", prdCode);
	        for (Map<String, Object> review : reviewList) {
	            logger.info("selectRvwList() - Review: {}", review);
	        }
	    } else {
	        logger.info("selectRvwList() - No review found for product code: {}", prdCode);
	    }
		
		return upcyclingDao.selectRvwList(prdCode);
	}

	
	@Override
	public UpcyReview selectRvw(String upcyCode) {
		UpcyReview upcyReview = upcyclingDao.selectRvw();
		if (upcyReview != null) {
            logger.info("selectRvw() - UpcyReview found: {}", upcyReview);
        } else {
            logger.info("selectRvw() - No UpcyReview found with upcyCode: {}", upcyCode);
        }
		
		return upcyclingDao.selectRvw();
	}










	
}

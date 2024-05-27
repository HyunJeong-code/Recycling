package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.UpcyclingDao;
import recycling.buyer.service.face.UpcyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;

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
	public SellerProf selectSellerProf(String sCode) {
		return upcyclingDao.selectSellerProf(sCode);
	}
	
	@Override
	public Buyer selectBuyerCode(int bCode) {
		return upcyclingDao.selectBcode(bCode);
	}

	
//	@Override
//	public List<Review> selectRvwList(String prdCode) {
//		return upcyclingDao.selectRvwList(prdCode);
//	}
//
//	@Override
//	public Review selectRvw(int rvwCode) {
//		return upcyclingDao.selectRvw();
//	}

	
	@Override
	public void insertReview(String rvwContent, String prdCode, Buyer buyer) {
		upcyclingDao.insertReview(rvwContent, prdCode, buyer);
	}

	@Override
	public void updateReview(int rvwCode, String rvwContent) {
		upcyclingDao.updateReview(rvwCode, rvwContent);
	}

	
	@Override
	public void deleteReview(int rvwCode) {
		upcyclingDao.deleteReview(rvwCode);
	}


	
}

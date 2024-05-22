package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.UpcyclingDao;
import recycling.buyer.service.face.UpcyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Review;
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;

@Service
public class UpcyclingServiceImpl implements UpcyclingService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UpcyclingDao upcyclingDao;
	
	@Override
	public List<Prd> getPrdList() {
		
		List<Prd> prdList = upcyclingDao.selectPrdList();
		logger.info("getPrdList() - prdList size: {}", prdList.size());
		for(Prd prd : prdList) {
	        logger.info("getPrdList() - Prd: {}", prd);
	    }
		
		return prdList;
	}
	
	@Override
	public Prd view(String prdCode) {
		
		Prd prd = upcyclingDao.selectPrd(prdCode);
		
		if (prd != null) {
            logger.info("viewByPrdCode() - Prd found: {}", prd);
        } else {
            logger.info("viewByPrdCode() - No Prd found with prdCode: {}", prdCode);
        }
		
		return prd;
	}

	@Override
	public SellerProf getSellerProf(String sCode) {
		return upcyclingDao.selectSellerProfByCode(sCode);
	}
	
	@Override
	public Buyer selectBuyerCode(int bCode) {
		return upcyclingDao.selectBcode(bCode);
	}

	
	@Override
	public List<Review> getUpcyvwList(String prdCode) {
		return upcyclingDao.selectRvwList(prdCode);
	}

	@Override
	public Review selectReviewByCode(int rvwCode) {
		return upcyclingDao.selectRvwByCode();
	}

	
	@Override
	public void writeReview(String rvwContent, String prdCode, Buyer buyer) {
		upcyclingDao.writeReview(rvwContent, prdCode, buyer);
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

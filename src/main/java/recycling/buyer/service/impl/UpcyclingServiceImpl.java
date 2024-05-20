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
	public Prd view(int ctPno) {
		return upcyclingDao.selectPrd(ctPno);
	}

	@Override
	public Buyer selectBuyerCode(int bCode) {
		return upcyclingDao.selectBcode(bCode);
	}

	
	@Override
	public List<Review> getUpcyvwList() {
		return upcyclingDao.selectRvwList();
	}

	@Override
	public Review selectReviewByCode(int rvwCode) {
		return upcyclingDao.selectRvwByCode();
	}

	
	@Override
	public void writeReview(String rvwContent, Buyer buyer) {
		upcyclingDao.writeReview(rvwContent, buyer);
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

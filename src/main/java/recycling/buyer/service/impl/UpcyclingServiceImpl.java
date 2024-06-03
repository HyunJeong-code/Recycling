package recycling.buyer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.UpcyclingDao;
import recycling.buyer.service.face.UpcyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.UpcyReview;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;

@Service
@Transactional
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
	public Buyer selectBuyerCode(int bCode) {
		return upcyclingDao.selectBcode(bCode);
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

	
	@Override
	public void insertReview(String upcyContent, String prdCode, String bCode, int upcyGrade) {
		Map<String, Object> reviewData = new HashMap<>();
		reviewData.put("bCode", bCode);
		reviewData.put("prdCode", prdCode);
		reviewData.put("upcyContent", upcyContent);
		reviewData.put("upcyGrade", upcyGrade);
        upcyclingDao.insertReview(reviewData);
	}

	@Override
	public void updateReview(String upcyCode, String upcyContent) {
		upcyclingDao.updateReview(upcyCode, upcyContent);
		logger.info("updateReview() - UpcyReview updated: upcyCode={}, upcyContent={}", upcyCode, upcyContent);
	}

	
	@Override
	public void deleteReview(String upcyCode) {
		upcyclingDao.deleteReview(upcyCode);
		logger.info("deleteReview() - UpcyReview deleted with upcyCode: {}", upcyCode);
	}

	@Override
	public Integer selectcCnt(Cart cart) {
		return upcyclingDao.selectcCnt(cart);
	}
	
	@Override
	public int updatecCnt(Cart cart) {
		return upcyclingDao.updatecCnt(cart);
	}
	
	@Override
	public int insertCart(Cart cart) {
		return upcyclingDao.insertCart(cart);
	}
	
	@Override
	public CartOrder selectCartOrder(String prdCode) {
		return upcyclingDao.selectCartOrder(prdCode);
	}
	
}

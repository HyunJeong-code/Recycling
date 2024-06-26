package recycling.buyer.service.impl;

import java.util.List;
import java.util.Map;

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
	public List<Prd> selectLatestList() {
		return upcyclingDao.selectLatestList();
	}

	@Override
	public List<Prd> selectHitList() {
		return upcyclingDao.selectHitList();
	}

    @Override
    public List<String> selectPrdImageThums(String prdCode) {
        return upcyclingDao.selectPrdImageThums(prdCode);
    }

    @Override
    public List<String> selectLatestPrdImageThums(String prdCode) {
        return upcyclingDao.selectLatestPrdImageThums(prdCode);
    }

    @Override
    public List<String> selectHitPrdImageThums(String prdCode) {
        return upcyclingDao.selectHitPrdImageThums(prdCode);
    }
    
	@Override
	public String selectPrdImageThum(String prdCode) {
		logger.info("selectPrdImageThum() - prdCode: {}", prdCode);
		return upcyclingDao.selectPrdImageThum(prdCode);
	}
    
	@Override
	public List<String> selectPrdImageDetail(String prdCode) {
		return upcyclingDao.selectPrdImageDetail(prdCode);
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
	
	@Override
	public void updateHit(String prdCode) {
		upcyclingDao.updateHit(prdCode);
	}
}
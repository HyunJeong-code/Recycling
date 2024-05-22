package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.RecyclingDao;
import recycling.buyer.service.face.RecyclingService;
<<<<<<< HEAD
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;
=======
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;
import recycling.util.Paging;
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

@Service
public class RecyclingServiceImpl implements RecyclingService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RecyclingDao recyclingDao;
	
	@Override
	public List<Prd> getPrdList() {
<<<<<<< HEAD
		
		List<Prd> prdList = recyclingDao.selectPrdList();
		logger.info("getPrdList() - prdList size: {}", prdList.size());
		for(Prd prd : prdList) {
	        logger.info("getPrdList() - Prd: {}", prd);
	    }
		
		return prdList;
=======
		return recyclingDao.selectPrdList();
	}

	

	@Override
	public Prd view(int ctPno) {
		
		return recyclingDao.select(ctPno);
		
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
	}

	
	@Override
<<<<<<< HEAD
	public Prd view(String prdCode) {
		
		Prd prd = recyclingDao.selectPrd(prdCode);
		
		if (prd != null) {
            logger.info("viewByPrdCode() - Prd found: {}", prd);
        } else {
            logger.info("viewByPrdCode() - No Prd found with prdCode: {}", prdCode);
        }
		
		return prd;
	}

	@Override
	public SellerProf getSellerProf(String sCode) {
		return recyclingDao.selectSellerProfByCode(sCode);
	}
=======
	public Paging getDetailPaging(int curPage) {
		
		int totalCount = recyclingDao.selectCntAll();
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	
	@Override
	public String findSeller(String location) {
		// 위치를 기반으로 판매자 주소 조회 로직
        Seller seller = recyclingDao.findSellerByLocation(location);
        
        if (seller != null) {
            return seller.getsAddr();
        } else {
            return null;
        }
	}

	@Override
	public List<Rcy> gerRcyList() {
		return recyclingDao.selectRcy();
	}
	
	
	
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
}

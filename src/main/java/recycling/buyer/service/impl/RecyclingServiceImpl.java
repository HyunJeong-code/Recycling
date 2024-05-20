package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.RecyclingDao;
import recycling.buyer.service.face.RecyclingService;
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;
import recycling.util.Paging;

@Service
public class RecyclingServiceImpl implements RecyclingService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired RecyclingDao recyclingDao;
	
	@Override
	public List<Prd> getPrdList() {
		return recyclingDao.selectPrdList();
	}

	

	@Override
	public Prd view(int ctPno) {
		
		return recyclingDao.select(ctPno);
		
	}

	
	@Override
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
	
	
	
}

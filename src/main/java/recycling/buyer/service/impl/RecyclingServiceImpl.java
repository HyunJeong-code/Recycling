package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.RecyclingDao;
import recycling.buyer.service.face.RecyclingService;
import recycling.dto.seller.Prd;
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
	public Paging getSearchPaging(int curPage, String search) {
		
		int totalCount = recyclingDao.selectCntAll();
		
		return null;
	}
}

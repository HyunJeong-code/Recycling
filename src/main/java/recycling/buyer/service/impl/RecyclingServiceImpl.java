package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.RecyclingDao;
import recycling.buyer.service.face.RecyclingService;
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Seller;

@Service
public class RecyclingServiceImpl implements RecyclingService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private RecyclingDao recyclingDao;

	@Override
	public List<Seller> findSeller() {
		return recyclingDao.findSeller();
	}
	
	@Override
    public List<Rcy> findRcyBySellerCode(String sCode) {
        return recyclingDao.findRcyBySellerCode(sCode);
    }
	
}

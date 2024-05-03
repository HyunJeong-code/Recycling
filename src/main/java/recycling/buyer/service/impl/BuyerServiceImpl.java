package recycling.buyer.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.BuyerDao;
import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cmp;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private BuyerDao buyerDao;

	@Override
	public Buyer getBuyerById(String bId) {

		return buyerDao.selectBuyerById(bId);
	
	}

	@Override
	public Buyer getBuyerTypeByCode(String bCode) {

		return buyerDao.selectBuyerTypeByCode(bCode);
	
	}
	
	@Override
	public BuyerAdr getBuyerAdr(String bCode) {

		return buyerDao.selectByBuyerAdr(bCode);

	}

	@Override
	public Cmp getCmpDetail(String bCode) {

		return buyerDao.selectByCmpDetail(bCode);
	
	}

	@Override
	public void updateBuyer(Buyer buyer) {

		buyerDao.updateBuyer(buyer);
		
	}

	@Override
	public void updateBuyerAdr(BuyerAdr buyerAdr) {
		
		buyerDao.updateBuyerAdr(buyerAdr);
		
	}

	@Override
	public void updateCmpDetail(Cmp cmp) {
		
		buyerDao.updateCmpDetail(cmp);
		
	}

	

	

	
	
}
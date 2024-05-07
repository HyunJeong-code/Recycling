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
	public boolean chkPw(String bCode, String password) {

		return buyerDao.chkPw(bCode, password);
	
	}

	@Override
	public String getBuyerType(String bCode) {

		return buyerDao.getBuyerType(bCode);

	}

	@Override
	public void changePw(String bCode, String newPw) {
		
		buyerDao.changePw(bCode, newPw);
		
	}

	@Override
	public Buyer getBuyerDetail(String bCode) {

		return buyerDao.getBuyerDetail(bCode);
	
	}

	@Override
	public BuyerAdr getBuyerAdr(String bCode) {

		return buyerDao.getBuyerAdr(bCode);
	
	}

	@Override
	public void updateBuyerDetail(Buyer buyer) {
		
		buyerDao.updateBuyerDetail(buyer);
		
	}

	@Override
	public void updateBuyerAdr(BuyerAdr buyerAdr) {
		
		buyerDao.updateBuyerAdr(buyerAdr);
		
	}

	@Override
	public Cmp getCmpDetail(String bCode) {
	
		return buyerDao.getCmpDetail(bCode);
	
	}

	@Override
	public void updateCmpDetail(Cmp cmp) {
		
		buyerDao.updateCmpDetail(cmp);
		
	}

}
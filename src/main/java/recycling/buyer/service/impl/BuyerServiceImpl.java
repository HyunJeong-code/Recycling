package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.BuyerDao;
import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private BuyerDao buyerDao;

	@Override
	public boolean selectByPwAndCt(String bPw, String bCtCode) {

		return buyerDao.selectByPwAndCt(bPw, bCtCode);
	
	}

	@Override
	public List<BuyerAdr> getBuyerAdr(String bCode) {

		return buyerDao.selectBuyerAdr(bCode);
	
	}

	@Override
	@Transactional
	public void updateBuyerInfo(Buyer buyer, BuyerAdr buyerAdr) {
		
		buyerDao.updateBuyer(buyer);
		buyerDao.upadateBuyerAdr(buyerAdr);
		
	}

	
	
}
package recycling.buyer.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.BuyDao;
import recycling.buyer.service.face.BuyService;
import recycling.dto.buyer.Buyer;

@Service
public class BuyServiceImpl implements BuyService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BuyDao buyDao;
	
	@Override
	public Buyer selectByIdPw(Buyer buyer) {
		return buyDao.selectByIdPW(buyer);
	}
}

package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.BuyerDao;
import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.Orders;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BuyerDao buyerDao;
	
	@Override
	public int order(Orders order) {
		int res = buyerDao.insertOrder(order);
		
		return res;
	}
	
	@Override
	public List<Cart> selectAllCart(String bCode) {
		
		List<Cart> list = buyerDao.selectAllCart(bCode);
		
		return list;
	}
	
	@Override
	public Cart selectBycCode(String c) {
		logger.info(c);
		return buyerDao.selectBycCode(c);
	}
	
	@Override
	public Orders selectByordCode(String ordCode) {
		return buyerDao.selectByordCode(ordCode);
	}
}

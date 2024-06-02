package recycling.seller.service.impl;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.dto.seller.Seller;
import recycling.seller.dao.face.SellDao;
import recycling.seller.service.face.SellService;

@Service
@Transactional
public class SellServiceImpl implements SellService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellDao sellDao;
	
	@Override
	public Seller selectSeller(String bCode) {
		return sellDao.selectSeller(bCode);
	}
	
	@Override
	public Map<String, Object> selectBuyerAdr(String getbCode) {
		return sellDao.selectBuyerAdr(getbCode);
	}
	
	@Override
	public int insertSeller(Seller seller) {
		return sellDao.insertSeller(seller);
	}
}

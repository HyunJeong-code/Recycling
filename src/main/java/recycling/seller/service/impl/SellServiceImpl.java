package recycling.seller.service.impl;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Seller;
import recycling.seller.dao.face.SellDao;
import recycling.seller.service.face.SellService;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class SellServiceImpl implements SellService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellDao sellDao;
	
	@Override
	public BuyerAdr selectBuyerAdr(Seller seller) {
		return sellDao.selectBuyerAdr(seller);
	}
	
	@Override
	public int insertSeller(Seller seller) {
		return sellDao.insertSeller(seller);
	}
	
	@Override
	public int deleteSeller(BuyerLogin buyerLogin) {
		return sellDao.deleteSeller(buyerLogin);
	}
	
	@Override
	public int selectPrdCnt(BuyerLogin buyerLogin) {
		return sellDao.selectPrdCnt(buyerLogin);
	}
	
	@Override
	public int selectPayCnt(BuyerLogin buyerLogin) {
		return sellDao.selectPayCnt(buyerLogin);
	}

	@Override
	public int selectShipCnt(BuyerLogin buyerLogin) {
		return sellDao.selectShipCnt(buyerLogin);
	}
	
	@Override
	public int selectCntAllOrd(PagingAndCtg upPaging) {
		return sellDao.selectCntAllOrd(upPaging);
	}
	
	@Override
	public int selectCntAllQna(PagingAndCtg unPaging) {
		return sellDao.selectCntAllQna(unPaging);
	}
	
	@Override
	public List<Map<String, Object>> selectAllOrd(PagingAndCtg upPaging) {
		return sellDao.selectAllOrd(upPaging);
	}
	
	@Override
	public List<Map<String, Object>> selectAllQna(PagingAndCtg unPaging) {
		return sellDao.selectAllQna(unPaging);
	}
}

package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.BuyerDao;
import recycling.buyer.service.face.BuyerService;

import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyerDao buyerDao;
	
	@Override
	public int insertOrder(Orders order) {
		return buyerDao.insertOrder(order);
	}
	
	@Override
	public List<CartOrder> selectAllCart(String bCode) {
		List<CartOrder> list = buyerDao.selectAllCart(bCode);
		
		logger.info("bCode: {}", bCode);
		logger.info("list: {}", list);
		
		
		return list;
	}
	
	@Override
	public int updatecCnt(Cart cart) {
		return buyerDao.updatecCnt(cart);
	}
	
	@Override
	public CartOrder selectBycCode(String cCode) {
		logger.info(cCode);
		return buyerDao.selectBycCode(cCode);
	}
	
	@Override
	public BuyerAdr selectBybCode(String bCode) {
		return buyerDao.selectBybCode(bCode);
	}
	
	@Override
	public Orders selectByordCode(String ordCode) {
		return buyerDao.selectByordCode(ordCode);
	}
	
	@Override
	public Integer selectPrdCnt(String prdCode) {
		return buyerDao.selectPrdCnt(prdCode);
	}
	
	@Override
	public int deleteCart(String cCode) {
		return buyerDao.deleteCart(cCode);
	}
	
	@Override
	public int updatePrdCnt(CartOrder cart) {
		return buyerDao.updatePrdCnt(cart);
	}
	
	@Override
	public int insertOrderDetail(OrderDetail orderDetail) {
		return buyerDao.insertOrderDetail(orderDetail);
	}
	
	@Override
	public List<MyOrder> selectOrderDetailBybCode(String bCode) {
		return buyerDao.selectOrderDetailBybCode(bCode);
	}

	@Override
	public Buyer getCurrentBuyer(String bId) {
		return buyerDao.getCurrentBuyer(bId);
	}
	
	@Override
	public Buyer getBuyerDetail(String bId) {
		
		return buyerDao.getBuyerDetail(bId);
	
	}
	
	@Override
	public BuyerRank getBuyerRank(int rankNo) {

		return buyerDao.getBuyerRank(rankNo);
	
	}
	
	@Override
	public Cmp getCmpDetail(String bCode) {
		
		return buyerDao.getCmpDetail(bCode);

	}
	
	@Override
	public int verifyPw(String bId, String password) {

		Buyer buyer = buyerDao.getBuyerDetail(bId);
		
		if(buyer != null && buyer.getbPw().equals(password)) {
			
			return 1;	// 비밀번호가 일치하면 1을 반환
			
		}
		
		return 0;	// 비밀번호가 일치하지 않으면 0을 반환
	
	}

	@Override
	public int changePw(BuyerLogin buyerLogin) {
		
		return 0;
		
	}
	
	@Override
	public int updateBuyerDetail(Buyer buyer) {
		
		return buyerDao.updateBuyerDetail(buyer);
		
	}
	
	@Override
	public int updateCmpDetail(Cmp cmp) {
		
		return buyerDao.updateCmpDetail(cmp);
		
	}
	
	@Override
	public List<BuyerAdr> getBuyerAdr(String bCode) {

		return buyerDao.getBuyerAdr(bCode);
	
	}

	@Override
	public int registerBuyerAdr(BuyerAdr buyerAdr) {
		
		// 시퀀스 값 가져오기
		String adrCode = buyerDao.getAdrCode();
		
		buyerAdr.setAdrCode(adrCode);
		
		return buyerDao.registerBuyerAdr(buyerAdr);
		
	}

	@Override
	public int updateBuyerAdr(BuyerAdr buyerAdr) {
		
		return buyerDao.updateBuyerAdr(buyerAdr);
		
	}

	@Override
	public int deleteBuyerAdr(String adrCode) {
		
		return buyerDao.deleteBuyerAdr(adrCode);
		
	}

	@Override
	public int setDefaultAdr(String adrCode, String bCode) {
		
		buyerDao.unsetDefaultAdr(bCode);
		
		return buyerDao.setDefaultAdr(adrCode, bCode);
		
	}
	
	@Override
	public int deleteBuyer(String bCode) {
		
		return buyerDao.deleteBuyer(bCode);
		
	}

}
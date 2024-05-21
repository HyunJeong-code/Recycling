package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.BuyerDao;
import recycling.buyer.service.face.BuyerService;

import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
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
		return buyerDao.buyerDaoselectOrderDetailBybCode(bCode);
	}

	@Override
	public Buyer getCurrentBuyer(String bId) {
		return buyerDao.selectBuyerBybId(bId);
	}
	
	@Override
	public Buyer getBuyerDetail(String bId) {
		
		return buyerDao.selectBuyerBybId(bId);
	
	}
	
	@Override
	public BuyerRank getBuyerRank(int rankNo) {

		return buyerDao.selectBuyerRank(rankNo);
	
	}
	
	@Override
	public Cmp getCmpDetail(String bCode) {
		
		return buyerDao.selectCmpBybCode(bCode);

	}
	
	@Override
	public boolean verifyPw(String bId, String password) {

		Buyer buyer = buyerDao.selectBuyerBybId(bId);
		
		return buyer != null && buyer.getbPw().equals(password);
	
	}

	@Override
	public void changePw(String bId, String newPw) {
		
		Buyer buyer = buyerDao.selectBuyerBybId(bId);
		
		if(buyer != null) {
			
			buyer.setbPw(newPw);
			
			buyerDao.updateBuyer(buyer);
			
		}
		
	}
	
	@Override
	public boolean updateBuyerDetail(Buyer buyer) {
		
		int updatedRows = buyerDao.updateBuyer(buyer);
		
		return updatedRows > 0;
		
	}
	
	@Override
	public boolean updateCmpDetail(Cmp cmp) {
		
		int updatedRows = buyerDao.updateCmp(cmp);
		
		return updatedRows > 0;
		
	}
	
	@Override
	public List<BuyerAdr> getBuyerAdr(String bCode) {

		return buyerDao.getBuyerAdr(bCode);
	
	}

	@Override
	public int cntBuyerAdr(String bCode) {

		return buyerDao.cntBuyerAdr(bCode);
	
	}

	@Override
	public void registerBuyerAdr(BuyerAdr buyerAdr) {
		
		buyerDao.insertBuyerAdr(buyerAdr);
		
	}

	@Override
	public void updateBuyerAdr(BuyerAdr buyerAdr) {
		
		buyerDao.updateBuyerAdr(buyerAdr);
		
	}

	@Override
	public void deleteBuyerAdr(String adrCode) {
		
		buyerDao.deleteBuyerAdr(adrCode);
		
	}

	@Override
	public void setDefaultAdr(String adrCode, String bCode) {
		
		buyerDao.resetDefaultAdr(adrCode);
		buyerDao.setDefaultAdr(adrCode);
		
	}

	@Override
	public void deleteBuyer(String bCode) {
		
		
		
	}

}
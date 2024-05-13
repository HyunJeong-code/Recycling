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
	public BuyerAdr getBuyerAdr(String bCode) {
		
		return buyerDao.selectBuyerAdrBybCode(bCode);
	
	}

	@Override
	public Cmp getCmpDetail(String bCode) {
		
		return buyerDao.selectCmpBybCode(bCode);

	}

	@Override
	public void updatePriDetail(Buyer buyer) {
		
		buyerDao.updateBuyer(buyer);
		
	}

	@Override
	public void updateCmpDetail(Buyer buyer, Cmp cmp) {
		
		buyerDao.updateBuyer(buyer);
		buyerDao.updateCmp(cmp);
		
	}

	@Override
	public void registerAdr(BuyerAdr buyerAdr) {
		
		buyerDao.registerAdr(buyerAdr);
		
	}

	@Override
	public void updateAdr(BuyerAdr buyerAdr) {
		
		buyerDao.updaterAdr(buyerAdr);
		
	}

	@Override
	public void deleteAdr(String adrCode) {

		buyerDao.deleteAdr(adrCode);
		
	}

	@Override
	public List<BuyerAdr> getBuyerAdrList(String bCode) {

		return buyerDao.selectBuyerAdrList(bCode);
	
	}

	@Override
	public List<BuyerAdr> getBuyerAdrList(Buyer buyer) {

		if(buyer == null || buyer.getbCode() == null) {
			
			return null;
			
		}
		
		return buyerDao.selectBuyerAdrList(buyer.getbCode());
	
	}

	@Override
	public void deleteBuyer(String bCode) {
		
		buyerDao.deleteBuyer(bCode);
		
	}

	@Override
	public BuyerRank getBuyerRank(int rankNo) {

		return buyerDao.selectBuyerRank(rankNo);
	
	}
}

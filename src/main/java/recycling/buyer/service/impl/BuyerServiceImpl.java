package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.BuyerDao;
import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;

@Service
public class BuyerServiceImpl implements BuyerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired 
	private BuyerDao buyerDao;
	
	// 장바구니
	
	// 회원 정보
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
	public Buyer updateBuyerDetail(Buyer buyer) {

		int updateSuccess = buyerDao.updateBuyer(buyer);
		
		if(updateSuccess > 0) {
			
			logger.info("성공적으로 업데이트 되었습니다: {}", buyer.getbId());
			
		} else {
			
			logger.info("업데이트에 실패했습니다: {}", buyer.getbId());
			
		}
		return buyer;
		
	}
	
	@Override
	public Cmp updateCmpDetail(Cmp cmp) {
		
		boolean cmpUpdate = buyerDao.updateCmp(cmp);
		
		if(cmpUpdate) {
			
			logger.info("성공적으로 업데이트 되었습니다: {}", cmp.getbCode());
			
		} else {
			
			logger.info("업데이트에 실패했습니다: {}", cmp.getbCode());
			
		}
		
		return cmp;
		
	}

	@Override
	public List<BuyerAdr> getBuyerAdrList(String bCode) {

		return buyerDao.selectBuyerAdrListBybCode(bCode);
	
	}
	
	@Override
	public void registerAdr(BuyerAdr buyerAdr) {
		
		buyerDao.registerAdr(buyerAdr);
		
	}

	@Override
	public void updateAdr(BuyerAdr buyerAdr) {
		
		buyerDao.updateAdr(buyerAdr); 
		
	}

	@Override
	public void deleteAdr(String adrCode) {

		buyerDao.deleteAdr(adrCode);
		
	}
	
	@Override
	public BuyerAdr getBuyerAdr(String bCode) {
		
		return buyerDao.selectBuyerAdrBybCode(bCode);
	
	}
	
	@Override
	public void deleteBuyer(String bCode) {
		
		buyerDao.deleteBuyer(bCode);
		
	}

	@Override
	public int changePw(BuyerLogin buyerLogin) {
		return buyerDao.changePw(buyerLogin);
	}
}

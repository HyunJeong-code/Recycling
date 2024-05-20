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
	public List<BuyerAdr> getBuyerAdrList(String bCode) {

		return buyerDao.selectBuyerAdrListBybCode(bCode);
	
	}
	
	@Override
	public boolean updateBuyerAdr(BuyerAdr buyerAdr) {
		
		if(buyerAdr.getAdrChk() == null) {
			
			buyerAdr.setAdrChk("N");
			
		}
		
		return buyerDao.updateAdr(buyerAdr) > 0;
	
	}
	
	@Override
	public boolean registerBuyerAdr(BuyerAdr buyerAdr) {
		
		String adrCode = buyerDao.getAdrCode();
		
		buyerAdr.setAdrCode(adrCode);
		
		if(buyerAdr.getAdrChk() == null) {
			
			buyerAdr.setAdrChk("N");
			
		}
		
		return buyerDao.registerAdr(buyerAdr) > 0;
		
	}

	@Override
	public boolean deleteBuyerAdr(String adrCode) {

		return buyerDao.deleteAdr(adrCode) > 0;
	
	}
	
	@Override
	public BuyerAdr getBuyerAdrByAdrCode(String adrCode) {

		return buyerDao.selectBuyerAdrByAdrCode(adrCode);
	
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
	public boolean setDefaultAdr(String bCode, String adrCode) {
		
		logger.info("기본 배송지로 설정 주소코드: {}, adrCode: {}", bCode, adrCode);
		
		// 현재 기본 배송지를 찾아 Adr_Chk를 'N'으로 변경
		BuyerAdr currentDefaultAdr = buyerDao.selectCurrentDefaultAdr(bCode);
		
		if(currentDefaultAdr != null) {
			
			currentDefaultAdr.setAdrChk("N");
			
			int result = buyerDao.updateAdr(currentDefaultAdr);
			
			logger.info("현재 기본 배송지 주소를 N으로: {}, result: {}", currentDefaultAdr, result);
			
		} else {
			
			logger.info("배송지 주소로 현재 기본 배송지 찾을 수 없음: {}", bCode);
			
		}
		
		// 선택한 배송지를 기본 배송지로 설정
		BuyerAdr newDefaultAdr = buyerDao.selectBuyerAdrByAdrCode(adrCode);
		
		if(newDefaultAdr != null) {
			
			newDefaultAdr.setAdrChk("Y");
			
			int result = buyerDao.updateAdr(newDefaultAdr);
			
			logger.info("새로운 기본 배송지 Y로: {}, result: {}", newDefaultAdr, result);
			
			return result > 0;
			
		} else {
			
			logger.info("주소 코드로 주소를 찾을 수 없음: {}", adrCode);
			
			return false;
			
		}
		
	}

}
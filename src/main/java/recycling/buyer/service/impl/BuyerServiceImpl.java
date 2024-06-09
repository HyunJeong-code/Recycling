package recycling.buyer.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.dao.face.BuyerDao;
import recycling.buyer.service.face.BuyerService;

import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.seller.Change;
import recycling.util.PagingAndCtg;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.CmpFile;

@Service
@Transactional
public class BuyerServiceImpl implements BuyerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyerDao buyerDao;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	@Autowired private ServletContext servletContext;
	
	@Override
	public int insertOrder(Orders order) {
		return buyerDao.insertOrder(order);
	}
	
	@Override
	public List<CartOrder> selectAllCart(PagingAndCtg upPaging) {
		List<CartOrder> list = buyerDao.selectAllCart(upPaging);
		
		logger.info("bCode: {}", upPaging);
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
	public List<BuyerAdr> selectBybCode(String bCode) {
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
	public List<MyOrder> selectOrderDetailBybCode(PagingAndCtg upPaging) {
		return buyerDao.buyerDaoselectOrderDetailBybCode(upPaging);
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
	public BuyerProf getBuyerProf(String bCode) {

		return buyerDao.getBuyerProf(bCode);
	
	}
	
	@Override
	public CmpFile getCmpFile(int cmpNo) {

		return buyerDao.getCmpFile(cmpNo);
	
	}
	
	@Override
	public int verifyPw(String bId, String currentPw) {

		Buyer buyer = buyerDao.getBuyerDetail(bId);
		
		if(buyer != null && pwEncoder.matches(currentPw, buyer.getbPw())) {
			
			return 1;
			
		}
		
		return 0;
	
	}
	
	@Override
	public int changePw(BuyerLogin buyerLogin, String newPw) {
	
		buyerLogin.setbPw(newPw);
		
		return buyerDao.changePw(buyerLogin);
		
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
	public BuyerProf updateBuyerProf(MultipartFile buyerProf, String bCode) {

		if (buyerProf.getSize() <= 0) {
			
            return null;
        
		}

        String storedPath = servletContext.getRealPath("upload");
        File storedFolder = new File(storedPath);
        storedFolder.mkdir();
        
        String storedName = null;
        File dest = null;
        
        do {
        	
        	storedName = buyerProf.getOriginalFilename();
            storedName += UUID.randomUUID().toString().split("-")[4];
        	dest = new File(storedFolder, storedName);
        	
        } while (dest.exists());
        
        try {
            
            buyerProf.transferTo(dest);
            
        } catch (IllegalStateException e) {
        	
        	e.printStackTrace();
        	
        } catch (IOException e) {
        
        	e.printStackTrace();
            
        }
        
        BuyerProf prof = new BuyerProf();
        
        prof.setbCode(bCode);
        prof.setOriginName(buyerProf.getOriginalFilename());
        prof.setStoredName(storedName);
        
        return prof;
	
	}
	
	@Override
	public CmpFile updateCmpFile(MultipartFile cmpFile, String bCode) {
		
		if (cmpFile.getSize() <= 0) {
			
	        return null;
	    
		}
		
		String storedPath = servletContext.getRealPath("upload");
	    File storedFolder = new File(storedPath);
	    storedFolder.mkdir();
	    
	    String storedName = null;
	    File dest = null;
	    
	    do {
	    	
	    	storedName = cmpFile.getOriginalFilename();
	        storedName += UUID.randomUUID().toString().split("-")[4];
	        dest = new File(storedFolder, storedName);
	    
	    } while (dest.exists());
	    
	    try {

	        cmpFile.transferTo(dest);

	    } catch (IllegalStateException e) {
	    	
	    	e.printStackTrace();
	    	
	    } catch (IOException e) {
	    
	    	e.printStackTrace();
	        
	    }
	    
	    CmpFile file = new CmpFile();
	    Cmp cmp = buyerDao.getCmpDetail(bCode);
	    
	    file.setCmpNo(cmp.getCmpNo());
        file.setOriginName(cmpFile.getOriginalFilename());
        file.setStoredName(storedName);
		
        return file;
        
	}
	
	@Override
	public int updateBuyerProfMapper(BuyerProf updateProf) {
		
		return buyerDao.updateBuyerProf(updateProf);
	
	}
	
	@Override
	public int updateCmpFileMapper(CmpFile cmpFile) {
		
		return buyerDao.updateCmpFile(cmpFile);
		
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
	public int unsetDefaultAdr(String bCode) {
		
		return buyerDao.unsetDefaultAdr(bCode);
		
		
	}

	@Override
	public int setDefaultAdr(String adrCode, String bCode) {
		
		BuyerAdr buyerAdr = new BuyerAdr();
		
		buyerAdr.setbCode(bCode);
		buyerAdr.setAdrCode(adrCode);
		
		return buyerDao.setDefaultAdr(buyerAdr);
		
	}
	
	@Override
	public int deleteBuyer(String bCode) {
		
		return buyerDao.deleteBuyer(bCode);
		
	}

	@Override
	public int deleteSeller(String sCode) {

		return buyerDao.deleteSeller(sCode);
	
	}
	
	@Override
	public int changePw(BuyerLogin buyerLogin) {
		return buyerDao.changePw(buyerLogin);
	}
	
	@Override
	public OrderDetail selectByorddtCode(String orddtCode) {
		return buyerDao.selectByorddtCode(orddtCode);
	}
	
	@Override
	public int insertChange(Change change) {
		return buyerDao.insertChange(change);
	}
	
	//paging cnt
	@Override
	public int selectCntAllCart(PagingAndCtg upPaging) {
		return buyerDao.selectCntAllCart(upPaging);
	}
	
	@Override
	public int selectCntOrderDetailBybCode(PagingAndCtg upPaging) {
		return buyerDao.selectCntOrderDetailBybCode(upPaging);
	}
	
	//paging cnt end
	
}
package recycling.buyer.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
	public List<MyOrder> selectOrderDetailBybCode(String bCode) {
		return buyerDao.buyerDaoselectOrderDetailBybCode(bCode);
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
	public int updateBuyerProf(MultipartFile buyerProf, String bCode) {

		if (buyerProf.isEmpty()) {
			
            return 0;
        
		}

		BuyerProf prof = new BuyerProf();
        String originalFilename = buyerProf.getOriginalFilename();
        String storedName = System.currentTimeMillis() + "_" + originalFilename;
        Path path = Paths.get(servletContext.getRealPath("/resources/image/") + storedName);
        
        try {
            
        	Files.createDirectories(path.getParent());
            buyerProf.transferTo(path.toFile());
            
            prof.setbCode(bCode);
            prof.setOriginName(originalFilename);
            prof.setStoredName(storedName);
            
            return buyerDao.updateBuyerProf(prof);
        
        } catch (IOException e) {
        
        	e.printStackTrace();
            
        	return 0;
        
        }
	
	}
	
	@Override
	public int updateCmpFile(MultipartFile cmpFile, String bCode) {
		
		if (cmpFile.isEmpty()) {
			
	        return 0;
	    
		}

	    CmpFile file = new CmpFile();
	    String originalFilename = cmpFile.getOriginalFilename();
	    String storedName = System.currentTimeMillis() + "_" + originalFilename;
	    Path path = Paths.get(servletContext.getRealPath("/resources/cmpfile/") + storedName);

	    try {

	    	Files.createDirectories(path.getParent());
	        cmpFile.transferTo(path.toFile());

	        Cmp cmp = buyerDao.getCmpDetail(bCode);

	        file.setCmpNo(cmp.getCmpNo());
	        file.setOriginName(originalFilename);
	        file.setStoredName(storedName);


	        return buyerDao.updateCmpFile(file);
	    
	    } catch (IOException e) {
	    
	    	e.printStackTrace();
	        
	    	return 0;
	    
	    }
		
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

}
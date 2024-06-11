package recycling.buyer.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.RecyclingDao;
import recycling.buyer.service.face.RecyclingService;
import recycling.dto.seller.Seller;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Cmt;
import recycling.dto.seller.Prd;

@Service
@Transactional
public class RecyclingServiceImpl implements RecyclingService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private RecyclingDao recyclingDao;
	
	@Override
	public List<Seller> findSeller() {
		return recyclingDao.findSeller();
	}
	
	@Override
    public List<Prd> findRcyBySellerCode(String sCode) {
        return recyclingDao.findRcyBySellerCode(sCode);
    }
	
	@Override
	public List<Prd> selectPrdList() {
		
		List<Prd> prdList = recyclingDao.selectPrdList();
		logger.info("selectPrdList() - prdList size: {}", prdList.size());
		for(Prd prd : prdList) {
	        logger.info("selectPrdList() - Prd: {}", prd);
	    }
		
		return prdList;
	}
	
	@Override
	public List<Prd> selectLatestList() {
		return recyclingDao.selectLatestList();
	}

	@Override
	public List<Prd> selectHitList() {
		return recyclingDao.selectHitList();
	}

    @Override
    public List<String> selectPrdImageThums(String prdCode) {
        return recyclingDao.selectPrdImageThums(prdCode);
    }

    @Override
    public List<String> selectLatestPrdImageThums(String prdCode) {
        return recyclingDao.selectLatestPrdImageThums(prdCode);
    }

    @Override
    public List<String> selectHitPrdImageThums(String prdCode) {
        return recyclingDao.selectHitPrdImageThums(prdCode);
    }
    
	@Override
	public String selectPrdImageThum(String prdCode) {
		logger.info("selectPrdImageThum() - prdCode: {}", prdCode);
		return recyclingDao.selectPrdImageThum(prdCode);
	}
    
	@Override
	public List<String> selectPrdImageDetail(String prdCode) {
		logger.info("selectPrdImageDetail() - prdCode: {}", prdCode);
		return recyclingDao.selectPrdImageDetail(prdCode);
	}


	@Override
	public Prd view(String prdCode) {
		
		Prd prd = recyclingDao.selectPrd(prdCode);
		
		if (prd != null) {
            logger.info("viewByPrdCode() - Prd found: {}", prd);
        } else {
            logger.info("viewByPrdCode() - No Prd found with prdCode: {}", prdCode);
        }
		
		return prd;
	}

	@Override
	public Seller getSeller(String sCode) {
		return recyclingDao.selectSellerProfByCode(sCode);
	}

	public Seller selectSeller(String getsCode) {
		return recyclingDao.selectSeller(getsCode);
	}
	
	@Override
	public Buyer selectBuyerByBCode(String getbCode) {
		return recyclingDao.selectBuyerByBCode(getbCode);
	}

	@Override
	public int selectShipCnt(String getsCode) {
		return recyclingDao.selectShipCnt(getsCode);
	}
	
	@Override
	public List<Map<String, Object>> selectRcyList(String prdCode) {
	    
	    List<Map<String, Object>> rcyList = recyclingDao.selectRcyList(prdCode);
	    if (rcyList != null && !rcyList.isEmpty()) {
	        logger.info("selectRcyList() - rcy list found for product code: {}", prdCode);
	        for (Map<String, Object> rcy : rcyList) {
	            String bCode = (String) rcy.get("B_CODE");
	            Buyer buyer = recyclingDao.selectBuyerByBCode(bCode);
	            
	            if (buyer != null) {
	                rcy.put("B_NAME", buyer.getbName());
	            } else {
	                rcy.put("B_NAME", "Unknown");
	            }
	            
	            logger.info("selectRcyList() - rcy: {}", rcy);
	        }
	    } else {
	        logger.info("selectRcyList() - No Rcy found for product code: {}", prdCode);
	    }
	    
	    return rcyList; // 수정된 qnaList를 반환
	}

	@Override
	public Cmt selectCmtByRcyCode(String rcyCode) {
		return recyclingDao.selectCmtByRcyCode(rcyCode);
	}

	@Override
	public int insertCmt(Cmt cmt) {
		return recyclingDao.insertCmt(cmt);
	}
	
	@Override
	public Buyer selectBuyerDetail(String bId) {
		return recyclingDao.selectBuyerBybId(bId);
	}

	@Override
	public int insertRcy(Rcy rcy) {
		logger.info("Inserting Rcy: {}", rcy);
		return recyclingDao.insertRcy(rcy);
	}

	@Override
	public void updateHit(String prdCode) {
		recyclingDao.updateHit(prdCode);
	}
	








}


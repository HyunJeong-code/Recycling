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
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerAns;
import recycling.dto.seller.SellerQST;

@Service
@Transactional
public class RecyclingServiceImpl implements RecyclingService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private RecyclingDao recyclingDao;
	
	@Override
		public java.util.List<Seller> findSeller() {
			return recyclingDao.findSeller();
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
	public Seller selectSeller(String getsCode) {
		return recyclingDao.selectSeller(getsCode);
	}
	
	@Override
	public List<Map<String, Object>> selectQnaList(String prdCode) {
		
		List<Map<String, Object>> qnaList = recyclingDao.selectQnaList(prdCode);
	    if (qnaList != null && !qnaList.isEmpty()) {
	        logger.info("selectRvwList() - qna list found for product code: {}", prdCode);
	        for (Map<String, Object> qna : qnaList) {
	            logger.info("selectQnaList() - qna: {}", qna);
	        }
	    } else {
	        logger.info("selectQnaList() - No QnA found for product code: {}", prdCode);
	    }
		
		return recyclingDao.selectQnaList(prdCode);
	}
	
	@Override
	public List<SellerAns> selectSellerAnswers(String qstCode) {
		return recyclingDao.selectSellerAnswers(qstCode);
	}

	@Override
	public int insertSellerQST(SellerQST sellerQST) {
		return recyclingDao.insertSellerQST(sellerQST);
	}


	@Override
	public int updateSellerQST(SellerQST sellerQST) {
		return recyclingDao.updateSellerQST(sellerQST);
	}


	@Override
	public int  deleteSellerQST(String qstCode) {
		return recyclingDao.deleteSellerQST(qstCode);
	}


//	@Override
//	public int insertSellerAnswer(SellerAns sellerAns) {
//		return recyclingDao.insertSellerAnswer(sellerAns);
//	}
//
//
//	@Override
//	public int updateSellerAnswer(SellerAns sellerAns) {
//		return recyclingDao.updateSellerAnswer(sellerAns);
//	}


	@Override
	public int deleteSellerAnswer(String qnaCode) {
		return recyclingDao.deleteSellerAnswer(qnaCode);
	}

}

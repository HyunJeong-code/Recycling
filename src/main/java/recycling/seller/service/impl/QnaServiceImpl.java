package recycling.seller.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.buyer.Qst;
import recycling.seller.dao.face.QnaDao;
import recycling.seller.service.face.QnaService;

@Service
public class QnaServiceImpl implements QnaService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired QnaDao qnaDao;
	
	@Override
	public List<Qst> selectBysCode(String sCode) {
		return qnaDao.selecBysCode(sCode);
	}

}

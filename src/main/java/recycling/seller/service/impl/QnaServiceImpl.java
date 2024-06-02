package recycling.seller.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.dto.buyer.Qst;
import recycling.dto.buyer.QstA;
import recycling.dto.seller.Qna;
import recycling.seller.dao.face.QnaDao;
import recycling.seller.service.face.QnaService;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class QnaServiceImpl implements QnaService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired QnaDao qnaDao;
	
	@Override
	public List<QstA> selectQstBysCode(PagingAndCtg upPaging) {
		return qnaDao.selectQstBysCode(upPaging);
	}
	
	@Override
	public List<QstA> selectQstAllBysCode(PagingAndCtg unPaging) {
		return qnaDao.selectQstAllBysCode(unPaging);
	}
	
	@Override
	public Qst selectQstByqstCode(String qstCode) {
		return qnaDao.selectQstByqstCode(qstCode);
	}
	
	@Override
	public int insertQna(Qna qna) {
		return qnaDao.insertQna(qna);
	}
	
	@Override
	public Qna selectQnaByqstCode(String qstCode) {
		return qnaDao.selectQnaByqstCode(qstCode);
	}
	
	@Override
	public int updateQna(Qna qna) {
		return qnaDao.updateQna(qna);
	}
	
	@Override
	public int deleteQna(String qnaCode) {
		return qnaDao.deleteQna(qnaCode);
	}

	@Override
	public int selectCntQstBysCode(PagingAndCtg upPaging) {
		return qnaDao.selectCntQstBysCode(upPaging);
	}

	@Override
	public int selectCntQstAllBysCode(PagingAndCtg unPaging) {
		return qnaDao.selectCntQstAllBysCode(unPaging);
	}
}

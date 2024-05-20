package recycling.seller.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.buyer.Qst;
import recycling.dto.buyer.QstA;
import recycling.dto.seller.Qna;
import recycling.seller.dao.face.QnaDao;
import recycling.seller.service.face.QnaService;

@Service
public class QnaServiceImpl implements QnaService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired QnaDao qnaDao;
	
	@Override
	public List<QstA> selectBysCode(String sCode) {
		return qnaDao.selecBysCode(sCode);/**
		 * qnaCode가 일치하는 qna 삭제
		 * 
		 * @param qnaCode - 삭제하는 qnaCode 
		 * @return - DELETE 결과
		 */
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
}

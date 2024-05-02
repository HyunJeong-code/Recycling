package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.ExpDao;
import recycling.buyer.service.face.ExpService;
import recycling.dto.seller.Exp;
import recycling.util.Paging;

@Service
public class ExpServiceImpl implements ExpService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ExpDao expDao;
	
	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = expDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging( totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Exp> selectAllExp(Paging paging) {
		
		return expDao.selectAllExp(paging);
	}
}

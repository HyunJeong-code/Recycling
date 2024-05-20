package recycling.buyer.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

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
	@Autowired private ServletContext servletContext;
	
	@Override
	public List<Exp> selectAllExp(Paging paging) {
		
		return expDao.selectAllExp(paging);
	}

	@Override
	public Paging getSearchPaging(int curPage, String search) {
		
		Paging paging = null;
		
		int totalCount = expDao.selectCntAll(search);
		
		if("".equals(search)) {
			paging = new Paging(totalCount, curPage, search);
		} else {
			paging = new Paging(totalCount, curPage, search);
		}
		return paging;
	}

	@Override
	public List<Exp> selectRecentExp(Paging paging) {
		
		return expDao.selectRecentExp(paging);
	}

	@Override
	public List<Exp> selectPopularExp(Paging paging) {
		return expDao.selectPopularExp(paging);
	}


	@Override
	public List<Exp> selectTopPopExp() {
		return expDao.selectTopPopExp();
	}

	@Override
	public List<Exp> selectTopRecExp() {
		return expDao.selectTopRecExp();
	}
}

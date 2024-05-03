package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.seller.Exp;
import recycling.manager.dao.face.SlsDao;
import recycling.manager.service.face.SlsService;

@Service
public class SlsServiceImpl implements SlsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired SlsDao slsDao;
	
	@Override
	public List<Exp> selectAll() {
		logger.info("SlsService: selectAll");
		
		return slsDao.selectAll();
	}

	@Override
	public Exp selectDetail(Exp exp) {
		logger.info("SlsService: selectDetail");

//		조회수 증감
		slsDao.hit(exp);
		
		//세부사항 조회
		return slsDao.selectDetail(exp);
	}
}

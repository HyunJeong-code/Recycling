package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.WashDao;
import recycling.buyer.service.face.WashService;
import recycling.dto.manager.Wash;

@Service
@Transactional
public class WashServiceImpl implements WashService {

	@Autowired private WashDao washDao;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<Wash> selectWashList() {
		
		List<Wash> washList = washDao.selectWashList();
		logger.info("selectWashList() - washList size : {}" , washList.size());
		for(Wash wash : washList) {
			logger.info("selectWashList() - washList : {}", wash);
		}
		
		return washList;
	}
	
	@Override
	public Wash selectWash(String wCode) {
		
		Wash wash = washDao.selectWash(wCode);
		
		if(wash != null) {
			logger.info("selectByWashCode() - Wash found: {}", wash);
		} else {
			logger.info("selectByWashCode() - No Wash found with wCode: {}", wCode);
		}
		
		return wash;
	}

	

}

package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.manager.Manager;
import recycling.manager.dao.face.HrDao;
import recycling.manager.service.face.HrService;

@Service
public class HrServiceImpl implements HrService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private HrDao hrDao;
	
	@Override
	public List<Manager> selectAll() {
//		logger.info("service: select");
		
	    return hrDao.selectAll();
	}

	@Override
	public Manager selectDetail(Manager manager) {
//		logger.info("service: selectDetail");
		
		return hrDao.selectDetail(manager);
	}

	@Override
	public void insert(Manager manager) {
//		logger.info("service: insert");
		
		hrDao.insert(manager);
		
	}

	@Override
	public int listDel(List<String> chBox) {
		logger.info("service: listDel");
		int result = 0;
		
		for(int i = 0; i < chBox.size(); i++) {
			String mgrCode = chBox.get(i);
			logger.info("{}", mgrCode);
			
			result += hrDao.listDel(mgrCode);
		}
		
		return result;
		
	}
}

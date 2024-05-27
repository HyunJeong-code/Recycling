package recycling.manager.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.manager.dao.face.ManagerDao;
import recycling.manager.service.face.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ManagerDao managerDao;
	
	@Override
	public int selectByIdPw(String mgrId, String mgrPw) {
		logger.info("ManagerService.selectByIdPw");
		logger.info("id : {}, pw : {}", mgrId, mgrPw);
		return managerDao.selectByIdPw(mgrId, mgrPw);
	}
	
	@Override
	public int updatePw(String mgrCode, String mgrId, String mgrPw) {
		return managerDao.updatePw(mgrCode, mgrId, mgrPw);
	}
}

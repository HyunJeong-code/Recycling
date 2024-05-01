package a.b.c.service.face;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import a.b.c.dao.face.TestDao;

@Service
public class TestServiceImpl implements TestService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired TestDao testDao;
	
	@Override
	public int insert(String test) {
		logger.info("service.insert()");
		return testDao.insert(test);
	}
}

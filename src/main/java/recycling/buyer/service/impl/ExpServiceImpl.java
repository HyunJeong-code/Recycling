package recycling.buyer.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.ExpDao;

@Service
public class ExpServiceImpl implements ExpDao {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
}

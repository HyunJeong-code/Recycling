package recycling.buyer.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.WashDao;
import recycling.buyer.service.face.WashService;
import recycling.dto.manager.Wash;

@Service
public class WashServiceImpl implements WashService {

	@Autowired private WashDao washDao;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Override
	public List<Wash> getWashList() {
		
		return washDao.selectWashList();
	}


	@Override
	public Wash view(String wCode) {
		return washDao.view(wCode);
	}
}

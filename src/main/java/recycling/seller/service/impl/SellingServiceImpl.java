package recycling.seller.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.seller.dao.face.SellingDao;
import recycling.seller.service.face.SellingService;

@Service
public class SellingServiceImpl implements SellingService {

	@Autowired private SellingDao sellingDao;
	
	@Override
	public List<Exp> selectMyExpList() {
		
		
		return sellingDao.selectMyExpList();
	}


}

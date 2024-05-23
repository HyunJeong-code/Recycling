package recycling.buyer.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.MypageDao;
import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.BuyerLogin;

@Service
public class MypageServiceImpl implements MypageService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MypageDao mypageDao;
	
	@Override
	public List<Map<String, Object>> selectQnaBybCode(BuyerLogin buyerLogin) {
		return mypageDao.selectQnaBybCode(buyerLogin);
	}
	
	@Override
	public List<Map<String, Object>> selectRvwBybCode(BuyerLogin buyerLogin) {
		return mypageDao.selectRvwBybCode(buyerLogin);
	}
}

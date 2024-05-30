package recycling.buyer.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.MypageDao;
import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.BuyerLogin;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MypageDao mypageDao;
	
	@Override
	public List<Map<String, Object>> selectQnaBybCode(PagingAndCtg paging) {
		return mypageDao.selectQnaBybCode(paging);
	}
	
	@Override
	public List<Map<String, Object>> selectRvwBybCode(PagingAndCtg paging) {
		return mypageDao.selectRvwBybCode(paging);
	}
	
	@Override
	public int selectCntQna(PagingAndCtg upPaging) {
		return mypageDao.selectCntQna(upPaging);

	}
	
	@Override
	public int selectCntRvw(PagingAndCtg unPaging) {
		return mypageDao.selectCntRvw(unPaging);
	}
}
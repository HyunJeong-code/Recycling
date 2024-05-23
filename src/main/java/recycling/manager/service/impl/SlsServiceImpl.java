package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.seller.Seller;
import recycling.manager.dao.face.SlsDao;
import recycling.manager.service.face.SlsService;
import recycling.util.Paging;

@Service
public class SlsServiceImpl implements SlsService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private SlsDao slsDao;

	@Override
	public List<Seller> main(Paging paging) {
		return slsDao.main(paging);
	}

	@Override
	public Paging getPaging(Paging pagingParam) {
		
		// 총 게시글 수 조회
		int totalCount = slsDao.getPaging();

		// 페이징 계산
		Paging paging = new Paging(totalCount, pagingParam.getCurPage(), pagingParam.getSearch());

		return paging;
	}
}

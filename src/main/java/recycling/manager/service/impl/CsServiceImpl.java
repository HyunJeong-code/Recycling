package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.manager.dao.face.CsDao;
import recycling.manager.service.face.CsService;
import recycling.util.Paging;

@Service
public class CsServiceImpl implements CsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CsDao csDao;

	@Override
	public List<Oto> list(Paging paging) {
		return csDao.selectAllOto(paging);
	}

	@Override
	public Paging getPaging(Paging pagingParam) {

		// 총 게시글 수 조회
		int totalCount = csDao.selectCntAll();

		// 페이징 계산
		Paging paging = new Paging(totalCount, pagingParam.getCurPage(), pagingParam.getSearch());

		return paging;
	}

	@Override
	public List<Buyer> buyerList(Paging paging) {
		return csDao.selectAllBuyer(paging);
	}
}

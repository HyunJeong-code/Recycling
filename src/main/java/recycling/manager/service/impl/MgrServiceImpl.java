package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.Notice;
import recycling.manager.dao.face.MgrDao;
import recycling.manager.service.face.MgrService;
import recycling.util.Paging;

@Service
public class MgrServiceImpl implements MgrService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrDao mgrDao;
	
	@Override
	public ManagerLogin selectByIdPw(Manager manager) {
		return mgrDao.selectByIdPw(manager);
	}
	
	//공지사항 전체조회
	@Override
	public List<Notice> selectAll() {
		//ctNtcNo = 2일경우 manager공지사항이므로 2번만 조회
		List<Notice> selectAllManager = mgrDao.selectAll(2);
		
		return selectAllManager;
	}
	
	//공지사항 세부조회
	@Override
	public Notice selectDetail(String ntcCode) {

		//조회수 증감
		mgrDao.hit(ntcCode);
		
		//세부사항 조회
		return mgrDao.selectDetail(ntcCode);
	}

	//페이징 계산기능
	@Override
	public Paging selectCntAll(Paging pagingParam) {
		logger.info("service: selectCntAll");
		
		Paging paging = null;
		
		//총 게시글 수 조회
		int totalCount = mgrDao.selectCntAll(pagingParam);
	    
		//페이징 계산
		paging = new Paging(totalCount, pagingParam.getCurPage(), pagingParam.getSearch() );
		
		return paging;
	}
	

}

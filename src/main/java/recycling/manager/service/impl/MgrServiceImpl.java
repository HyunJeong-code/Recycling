package recycling.manager.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.manager.Notice;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.manager.dao.face.MgrDao;
import recycling.manager.service.face.MgrService;
import recycling.util.Paging;

@Service
public class MgrServiceImpl implements MgrService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrDao mgrDao;
	
	//조회기능
	@Override
	public List<Notice> selectAll(Paging paging) {
		logger.info("mgrservice: selectAll");
		
		return mgrDao.selectAll(paging);
	}
	
	//세부사항 조회
	@Override
	public Notice selectDetail(Notice notice) {
		logger.info("MgrService: selectDetail");

		//조회수 증감
		mgrDao.hit(notice);
		
		//세부사항 조회
		return mgrDao.selectDetail(notice);
	}

	//페이징 계산기능
	@Override
	public Paging selectCntAll(Paging pagingParam) {
		logger.info("service: selectCntAll");
		
		Paging paging = null;
		
		//총 게시글 수 조회
		int totalCount = mgrDao.selectCntAll(pagingParam);
	    
		//페이징 계산
//		paging = new Paging(totalCount, pagingParam.getCurPage(), pagingParam.getSearch(), pagingParam.getCategory() ); //카테고리
		paging = new Paging(totalCount, pagingParam.getCurPage(), pagingParam.getSearch() );
		
		return paging;
	}
	
	@Override
	public ManagerLogin selectByIdPw(Manager manager) {
		return mgrDao.selectByIdPw(manager);
	}
}

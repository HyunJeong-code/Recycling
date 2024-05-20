package recycling.manager.service.face;

import java.util.List;

import recycling.dto.manager.Notice;
import recycling.util.Paging;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;


// 메인 페이지 관련 처리

public interface MgrService {
	
	/**
	 * 관리자 로그인(임시)
	 * @param mgr - 관리자 로그인 정보 DTO
	 * @return null : 로그인 실패, else : 로그인 성공
	 */
	public ManagerLogin selectByIdPw(Manager manager);

	/**
	 * 관리자 공지사항 전체조회
	 * @return - List<Notice>
	 */
	public List<Notice> selectAll();

	/**
	 * 공지사항 세부조회
	 * 
	 * @param notice - Notice
	 * @return
	 */
	public Notice selectDetail(String ntcCode);

	/**
	 * 페이징 계산 시스템
	 * 
	 * @param pagingParam - 페이징 객체
	 * @param search - 검색 
	 * @return
	 */
	public Paging selectCntAll(Paging pagingParam);
	
}

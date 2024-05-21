package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.manager.Notice;
import recycling.util.Paging;
import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;

//메인 페이지 DB 처리(로그인, 회원가입, 전체 사원 조회 등)

public interface MgrDao {
	
	/**
	 * 관리자 로그인(임시)
	 * @param mgr - 관리자 로그인 정보 DTO
	 * @return null : 로그인 실패, else : 로그인 성공
	 */
	ManagerLogin selectByIdPw(Manager manager);

	/**
	 * 관리자 공지사항 전체조회
	 *  
	 * @param i - 매니저 카테고리 2번만 가져오기
	 * @return
	 */
	public List<Notice> selectAll(int i);

	/**
	 * 관리자 공지사항 세부조회 
	 * 
	 * @param ntcCode
	 * @return
	 */
	public Notice selectDetail(String ntcCode);

	/**
	 * 조회수 증감
	 * 
	 * @param ntcCode
	 */
	public void hit(String ntcCode);

	/**
	 * 페이징 기능 + 검색기능
	 * 
	 * @param pagingParam
	 * @return - DTO 객체 페이징
	 */
	public int selectCntAll(Paging pagingParam);
}

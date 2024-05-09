package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.manager.Notice;
import recycling.util.Paging;

//메인 페이지 DB 처리(로그인, 회원가입, 전체 사원 조회 등)

public interface MgrDao {

	/**
	 * 공지사항 전체 조회하기
	 * 
	 * @param paging - 페이징 정보 객체 
	 * @return - DTO 객체
	 */
	public List<Notice> selectAll(Paging paging);

	/**
	 * 공지사항 세부 조회하기
	 * 
	 * @param notice - DTO 객체
	 * @return
	 */
	public Notice selectDetail(Notice notice);

	/**
	 * 조회수 증감
	 * 
	 * @param notice - DTO 객체
	 */
	public void hit(Notice notice);

	/**
	 * 페이징 기능 + 검색기능
	 * 
	 * @param pagingParam
	 * @return - DTO 객체 페이징
	 */
	public int selectCntAll(Paging pagingParam);
}

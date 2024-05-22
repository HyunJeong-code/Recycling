package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

//메인 페이지 DB 처리(로그인, 회원가입, 전체 사원 조회 등)

public interface MgrDao {
	
	/**
	 * ID를 통해서 DB에서 사용자 정보를 가져옴
	 * 
	 * @param username - ID
	 * @return 로그인에 필요한 정보
	 */
	public ManagerLogin selectById(String username);

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
	
	/**
	 * 회원 가입을 위해 인사 등록이 되어있는지 확인
	 * 
	 * @param manager - 관리자 회원가입 정보
	 * @return - 0 : 실패, 1 : 성공
	 */
	public int selectByManager(Manager manager);
	
	/**
	 * 회원 가입 정보 확인 후, 일치 시 아이디/비밀번호 업데이트
	 * @param manager - 관리자 회원가입 정보
	 * @return - 0 : 실패, 1 : 성공
	 */
	public int updateManager(Manager manager);
	
	/**
	 * 프로필 사진 삽입
	 * @param mgrFile - 프로필 파일 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertMgrProf(MgrFile mgrFile);

	
}

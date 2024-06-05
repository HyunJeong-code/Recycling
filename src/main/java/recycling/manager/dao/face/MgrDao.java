package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerJoinDe;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.dto.manager.Notice;
import recycling.util.PagingAndCtg;

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

	public ManagerLogin selectByIdPw(Manager manager);
	
	/**
	 * 전체사원조회[empList]
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<ManagerJoinDe> selectAllempList(PagingAndCtg upPaging);
	
	/**
	 * 전체사원조회 페이징[empList]
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllempList(PagingAndCtg upPaging);
	
	/**
	 * 공지사항 조회하기
	 * 
	 * @return  List<Notice>
	 */
	public List<Notice> selectAllNotice(PagingAndCtg upPaging);

	/**
	 * 공지사항 조회하기 페이징
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllNotice(PagingAndCtg upPaging);

	/**
	 * 공지사항 세부조회
	 * 
	 * @param notice
	 * @return
	 */
	public Notice selectDetail(String ntcCode);

	
	/**
	 * 조회수 증감
	 * 
	 * @param ntcCode
	 */
	public void hit(String ntcCode);

}

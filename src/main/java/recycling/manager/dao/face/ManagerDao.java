package recycling.manager.dao.face;

import org.apache.ibatis.annotations.Param;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;

// 관리자 정보 DB 처리

public interface ManagerDao {
	
	/**
	 * 사원 정보 변경을 위해 비밀번호 확인
	 * 
	 * @param mgrId - 동일 비밀번호를 대비, 아이디도 같이 조회
	 * @param mgrPw - 비밀번호 확인을 위한 입력 비밀번호
	 * @return 0 : 실패, 1 : 성공
	 */
	public int selectByIdPw(@Param("mgrId") String mgrId, @Param("mgrPw") String mgrPw);
	
	/**
	 * 비밀번호 변경
	 * 
	 * @param mgr - 비밀번호 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updatePw(ManagerLogin mgr);
	
	/**
	 * 관리자 정보 변경
	 * 
	 * @param manager - 변경할 정보가 있는 관리자 DTO
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updateMgr(Manager manager);
	
	/**
	 * 관리자 프로필 사진 변경
	 * 
	 * @param mgrFile - 변경할 정보가 있는 관리자 프로필 DTO
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updateMgrProf(MgrFile mgrFile);
	
	/**
	 * 관리자 정보 조회
	 * 
	 * @param mgr - 관리자 로그인 정보
	 * @return 관리자 정보
	 */
	public Manager selectByMgr(ManagerLogin mgr);
	
	/**
	 * 관리자 프로필 정보 조회
	 * 
	 * @param mgr - 관리자 정보
	 * @return 관리자 프로필 정보
	 */
	public MgrFile selectByMgrProf(ManagerLogin mgr);

	public int updatePw(String mgrCode, String mgrId, String mgrPw);

}
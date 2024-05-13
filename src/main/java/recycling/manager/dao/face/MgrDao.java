package recycling.manager.dao.face;

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

}

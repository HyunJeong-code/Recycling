package recycling.manager.service.face;

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

}

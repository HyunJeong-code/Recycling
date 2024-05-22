package recycling.manager.service.face;

// 사원(본인) 정보 관리 관련 처리

public interface ManagerService {
	
	/**
	 * 사원 정보 변경을 위해 비밀번호 확인
	 * 
	 * @param mgrId - 동일 비밀번호를 대비, 아이디도 같이 조회
	 * @param mgrPw - 비밀번호 확인을 위한 입력 비밀번호
	 * @return 0 : 실패, 1 : 성공
	 */
	public int selectByIdPw(String mgrId, String mgrPw);

	/**
	 * 비밀번호 변경
	 * 
	 * @param mgrCode - 정확한 변경을 위해 관리자 코드
	 * @param mgrId - 정확한 변경을 위해 관리자 아이디
	 * @param mgrPw - 변경 비밀번호
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updatePw(String mgrCode, String mgrId, String mgrPw);
}

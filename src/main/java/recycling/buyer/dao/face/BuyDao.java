package recycling.buyer.dao.face;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;

// 메인페이지, 로그인/회원가입 관련 DB 처리

public interface BuyDao {

	/**
	 * ID를 통해서 DB에서 사용자 정보를 가져옴
	 * 
	 * @param username - ID
	 * @return 로그인에 필요한 정보
	 */
	public BuyerLogin selectById(String username);
	
	/**
	 * 구매자 기본정보 회원가입 처리
	 * 
	 * @param buyer - 회원가입 기본 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertBuyer(Buyer buyer);
	
	/**
	 * 로그인 처리(임시) -> 시큐리티 완성되면 삭제 예정
	 * 
	 * @param buyer - 로그인 정보가 들어있는 DTO
	 * @return - null : 실패, else : 성공
	 */
	public BuyerLogin selectBybIdbPw(Buyer buyer);
	
	/**
	 * 아이디 찾기
	 * 
	 * @param buyer - 아이디 찾을 회원 정보
	 * @return 아이디 반환
	 */
	public String selectByBuyerId(Buyer buyer);
	
	/**
	 * 비밀번호 찾기
	 * 
	 * @param buyer - 비밀번호를 찾을 회원 정보
	 * @return true : 회원 정보 존재, false : 회원정보 존재 X
	 */
	public Buyer selectByBuyerPw(Buyer buyer);
	
	/**
	 * 비밀번호 찾기 후 변경
	 * 
	 * @param buyer - 회원 코드와 변경할 비밀번호
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updatePw(Buyer buyer);
	
}

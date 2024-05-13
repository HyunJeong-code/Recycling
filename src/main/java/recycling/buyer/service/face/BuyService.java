package recycling.buyer.service.face;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;

// 메인페이지, 로그인/회원가입

public interface BuyService {
	
	/** 
	 * 로그인 권한 처리
	 * 
	 * @param buyerLogin - 로그인 정보
	 * @return 권한 정보가 포함된 로그인 정보
	 */
	public BuyerLogin chkAuth(BuyerLogin buyerLogin);
	
	/**
	 * 구매자 기본정보 회원가입 처리
	 * 
	 * @param buyer - 회원가입 기본 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertBuyer(Buyer buyer);
	
	/**
	 * 비밀번호 암호화, 구매자 코드, 핸드폰 번호, 이메일 합치기
	 * 
	 * @param buyer - 구매자 회원가입 정보
	 * @param bEmail2 - 이메일 도메인 주소
	 * @param mPhone - 핸드폰 번호 중간자리
	 * @param lPhone - 핸드폰 번호 마지막 자리
	 * @return 처리 완료된 구매자 회원가입 정보
	 */
	public Buyer priProc(Buyer buyer, String bEmail2, String mPhone, String lPhone);
	
	/**
	 * 로그인 처리(임시) -> 시큐리티 완성되면 삭제 예정
	 * 
	 * @param buyer - 로그인 정보가 들어있는 DTO
	 * @return - null : 실패, else : 성공
	 */
	public BuyerLogin selectBybIdbPw(Buyer buyer);

}
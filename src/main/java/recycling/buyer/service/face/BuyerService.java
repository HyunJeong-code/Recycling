package recycling.buyer.service.face;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련

public interface BuyerService {

	/**
	 * 구매자 코드, 비밀번호를 이용하여 비밀번호 일치 확인
	 * 
	 * @param bCode - 구매자 코드
	 * @param password - 입력된 비밀번호
	 * @return 비밀번호 일치 - true, 아니면 false
	 */
	public boolean chkPw(String bCode, String password);

	/**
	 * 구매자 구분해서 조회 (개인, 기업)
	 * 
	 * @param bCode - 구매자 코드
	 * @return "pri", "cmp"로 구분
	 */
	public String getBuyerType(String bCode);

	/**
	 * 비밀번호 변경
	 * 
	 * @param bCode - 구매자 코드
	 * @param newPw - 새로 만든 비밀번호
	 */
	public void changePw(String bCode, String newPw);

	/**
	 * 구매자 상세조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return Buyer 객체
	 */
	public Buyer getBuyerDetail(String bCode);

	/**
	 * 구매자 배송지 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return BuyerAdr 객체
	 */
	public BuyerAdr getBuyerAdr(String bCode);

	/**
	 * 구매자 상세정보 업데이트
	 * 
	 * @param buyer - 업데이트 할 구매자 정보
	 */
	public void updateBuyerDetail(Buyer buyer);

	/**
	 * 구매자 배송지 정보 업데이트
	 * 
	 * @param buyerAdr - 업데이트 할 구매자 배송지
	 */
	public void updateBuyerAdr(BuyerAdr buyerAdr);

	/**
	 * 기업 상세조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return Cmp 객체
	 */
	public Cmp getCmpDetail(String bCode);

	/**
	 * 기업 정보 업데이트
	 * 
	 * @param cmp - 업데이트 할 기업 정보
	 */
	public void updateCmpDetail(Cmp cmp);
	
}
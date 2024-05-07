package recycling.buyer.dao.face;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련 DB 처리

public interface BuyerDao {

	/**
	 * 구매자 비밀번호 일치 여부 확인
	 * 
	 * @param bCode - 구매자 코드
	 * @param password - 검사할 비밀번호
	 * @return 비밀번호 일치하면 true, 아니면 false 반환
	 */
	public boolean chkPw(String bCode, String password);

	/** 
	 * 구매자 타입 반환
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 타입 문자열로 반환
	 */
	public String getBuyerType(String bCode);

	/**
	 * 구매자 비밀번호 변경
	 * 
	 * @param bCode - 구매자 코드
	 * @param newPw - 새 비밀번호
	 */
	public void changePw(String bCode, String newPw);

	/**
	 * 구매자 코드에 해당하는 구매자 상세정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 정보 반환
	 */
	public Buyer getBuyerDetail(String bCode);

	/**
	 * 구매자 코드에 해당하는 구매자 배송지 정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 배송지 정보 반환
	 */
	public BuyerAdr getBuyerAdr(String bCode);

	/**
	 * 구매자 상세정보 DB에 업데이트
	 * 
	 * @param buyer - 업데이트 할 구매자 정보
	 */
	public void updateBuyerDetail(Buyer buyer);

	/**
	 * 구매자 배송지 정보 DB에 업데이트
	 * 
	 * @param buyerAdr - 업데이트 할 배송지 정보
	 */
	public void updateBuyerAdr(BuyerAdr buyerAdr);

	/**
	 * 구매자 코드에 해당하는 기업 정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 기업 정보 반환
	 */
	public Cmp getCmpDetail(String bCode);

	/**
	 * 기업 정보 DB에 업데이트
	 * 
	 * @param cmp - 업데이트 할 기업 정보
	 */
	public void updateCmpDetail(Cmp cmp);

}
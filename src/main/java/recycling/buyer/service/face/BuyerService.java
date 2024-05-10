package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련

public interface BuyerService {

	/**
	 * 현재 로그인 한 구매자 정보
	 * 
	 * @param bId - 구매자 아이디
	 * @return 현재 로그인 된 구매자 정보
	 */
	public Buyer getCurrentBuyer(String bId);
	
	/**
	 * 구매자 비밀번호 확인
	 * 
	 * @param getbId - 구매자 아이디
	 * @param password - 입력된 비밀번호
	 * @return 비밀번호 일치 확인
	 */
	public boolean verifyPw(String getbId, String password);

	/**
	 * 구매자 비밀번호 변경
	 * 
	 * @param bId - 구매자 아이디
	 * @param newPw - 새 비밀번호
	 */
	public void changePw(String bId, String newPw);
	
	/**
	 * 구매자 배송지 정보
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 배송지 정보
	 */
	public BuyerAdr getBuyerAdr(String bCode);
	
	/**
	 * 기업 구매자 정보
	 * 
	 * @param bCode - 구매자 코드
	 * @return 기업 구매자 정보
	 */
	public Cmp getCmpDetail(String bCode);
	
	/**
	 * 개인 구매자 상세 정보 업데이트
	 * 
	 * @param buyer - 업데이트 할 구매자 정보
	 */
	public void updatePriDetail(Buyer buyer);
	
	/**
	 * 기업 구매자 상세 정보 업데이트
	 * 
	 * @param buyer - 업데이트 할 구매자 정보
	 * @param cmp - 업데이트 할 기업 정보
	 */
	public void updateCmpDetail(Buyer buyer, Cmp cmp);

	/**
	 * 배송지 등록
	 * 
	 * @param buyerAdr - 등록할 배송지 정보
	 */
	public void registerAdr(BuyerAdr buyerAdr);

	/**
	 * 배송지 수정
	 * 
	 * @param buyerAdr - 수정할 배송지 정보
	 */
	public void updateAdr(BuyerAdr buyerAdr);

	/**
	 * 배송지 삭제
	 * 
	 * @param adrCode - 삭제할 배송지 코드
	 */
	public void deleteAdr(String adrCode);

	/**
	 * 구매자 배송지 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 배송지 목록
	 */
	public List<BuyerAdr> getBuyerAdrList(String bCode);

	/**
	 * 구매자 배송지 목록 조회
	 * 
	 * @param buyer - 구매자
	 * @return 구매자 배송지 목록
	 */
	public List<BuyerAdr> getBuyerAdrList(Buyer buyer);

	/**
	 * 구매자 탈퇴
	 * 
	 * @param bCode - 구매자 코드
	 */
	public void deleteBuyer(String bCode);

	/**
	 * 구매자 등급 조회
	 * 
	 * @param rankNo - 구매자 등급 번호
	 * @return 구매자 등급 정보
	 */
	public BuyerRank getBuyerRank(int rankNo);
	
}
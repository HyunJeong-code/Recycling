package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련 DB 처리

public interface BuyerDao {

	/**
	 * 구매자 아이디로 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 조회된 구매자 정보
	 */
	public Buyer selectBuyerBybId(String bId);

	/**
	 * 구매자 코드로 배송지 정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 조회된 배송지 정보
	 */
	public BuyerAdr selectBuyerAdrBybCode(String bCode);
	
	/**
	 * 구매자 코드로 기업 정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 조회된 기업 정보
	 */
	public Cmp selectCmpBybCode(String bCode);
	
	/**
	 * 구매자 정보 업데이트
	 * 
	 * @param buyer - 업데이트 할 구매자 정보
	 */
	public void updateBuyer(Buyer buyer);

	/**
	 * 구매자 배송지 정보 업데이트
	 * 
	 * @param buyerAdr - 업데이트 할 배송지 정보
	 */
	public void updateBuyerAdr(BuyerAdr buyerAdr);

	/**
	 * 기업 정보 업데이트
	 * 
	 * @param cmp - 업데이트 할 기업 정보
	 */
	public void updateCmp(Cmp cmp);

	/**
	 * 배송지 등록
	 * 
	 * @param buyerAdr - 추가할 배송지 정보
	 */
	public void registerAdr(BuyerAdr buyerAdr);

	/**
	 * 배송지 수정
	 * 
	 * @param buyerAdr - 수정할 배송지 정보
	 */
	public void updaterAdr(BuyerAdr buyerAdr);

	/**
	 * 배송지 삭제
	 * 
	 * @param adrCode - 삭제할 배송지 코드
	 */
	public void deleteAdr(String adrCode);

	/**
	 * 구매자 배송지 목록 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 배송지 목록
	 */
	public List<BuyerAdr> selectBuyerAdrList(String bCode);

}
package recycling.buyer.dao.face;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련 DB 처리

public interface BuyerDao {

	/**
	 * ID로 구매자 정보 조회
	 * 
	 * @param bId - 조회하려는 구매자 ID
	 * @return 구매자 정보가 존재하면 Buyer 객체 반환, 없을 경우 null
	 */
	public Buyer selectBuyerById(String bId);

	/**
	 * 구매자 코드로 구매자 유형을 DB에서 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 유형을 나타냄
	 */
	public Buyer selectBuyerTypeByCode(String bCode);
	
	/** 
	 * 구매자 코드로 구매자의 주소 정보 조회
	 * 
	 * @param bCode - 구매자 분류 코드
	 * @return 조회된 주소가 있는 BuyerAdr 객체, 없을 경우 null
	 */
	public BuyerAdr selectByBuyerAdr(String bCode);

	/**
	 * 구매자 코드로 구매자의 기업 정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 조회된 기업 정보가 있는 Cmp 객체, 없을 경우 null
	 */
	public Cmp selectByCmpDetail(String bCode);

	/**
	 * 구매자 정보를 DB에 업데이트
	 * 
	 * @param buyer - 업데이트할 구매자 정보가 있는 Buyer 객체
	 */
	public void updateBuyer(Buyer buyer);

	/**
	 * 구매자 주소 정보를 DB에 업데이트
	 * 
	 * @param buyerAdr - 업데이트할 주소 정보가 있는 BuyerAdr 객체
	 */
	public void updateBuyerAdr(BuyerAdr buyerAdr);

	/**
	 * 기업 정보를 DB에 업데이트
	 * 
	 * @param cmp - 업데이트할 기업 정보가 있는 Cmp 객체
	 */
	public void updateCmpDetail(Cmp cmp);

	

	
	
	
}
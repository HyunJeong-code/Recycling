package recycling.buyer.service.face;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련

public interface BuyerService {

	/**
	 * ID로 구매자 검색
	 * 
	 * @param bId - 검색하려는 구매자 ID
	 * @return 찾은 경우 Buyer 객체, 아니면 null
	 */
	public Buyer getBuyerById(String bId);

	/**
	 * 구매자 코드로 구매자 유형 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 유형을 나타냄
	 */
	public Buyer getBuyerTypeByCode(String bCode);
	
	/**
	 * 구매자 코드로 구매자 주소 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 조회된 주소 정보가 담긴 BuyerAdr 객체, 아니면 null
	 */
	public BuyerAdr getBuyerAdr(String bCode);

	/**
	 * 구매자 코드로 기업 정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 조회된 기업 정보가 담긴 Cmp 객체, 아니면 null
	 */
	public Cmp getCmpDetail(String bCode);

	/**
	 * Buyer 객체의 정보로 DB의 구매자 정보 업데이트
	 * 
	 * @param buyer - 업데이트할 구매자 정보
	 */
	public void updateBuyer(Buyer buyer);

	/**
	 * BuyerAdr 객체의 정보로 DB의 주소 정보 업데이트
	 * 
	 * @param buyerAdr - 업데이트할 주소 정보
	 */
	public void updateBuyerAdr(BuyerAdr buyerAdr);

	/**
	 * Cmp 객체의 정보로 DB의 기업 정보 업데이트
	 * 
	 * @param cmp - 업데이트할 기업 정보
	 */
	public void updateCmpDetail(Cmp cmp);

	



	
	
	
}
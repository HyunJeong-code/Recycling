package recycling.seller.dao.face;

import java.util.Map;

import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Seller;

// 메인 페이지 관련 DB

public interface SellDao {
	
	/**
	 * 판매자인지 판단을 위한 조회
	 * 
	 * @param bCode
	 * @return Seller DTO 반환
	 */
	public Seller selectSeller(String bCode);
	
	/**
	 * 판매자 가입 전, 구매자 정보에서 주소 가져오기
	 * 
	 * @param seller - 구매자 코드
	 * @return buyerAdr
	 */
	public BuyerAdr selectBuyerAdr(Seller seller);
	
	/**
	 * 판매자 신청을 DB에 삽입
	 * 
	 * @param seller - 판매자 신청 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertSeller(Seller seller);

	/**
	 * 신청 거절된 구매자의 판매자 정보 삭제
	 * 
	 * @param buyerLogin - 판매자 코드
	 * @return 0 : 실패, 1 : 성공
	 */
	public int deleteSeller(BuyerLogin buyerLogin);
}

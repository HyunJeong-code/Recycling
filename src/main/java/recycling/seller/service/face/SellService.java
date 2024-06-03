package recycling.seller.service.face;

import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Seller;

// 판매자 전환 및 공지사항, 메인 페이지 관련 처리

public interface SellService {

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

	public int selectPrdCnt(BuyerLogin buyerLogin);

	public int selectOrdCnt(BuyerLogin buyerLogin);


}

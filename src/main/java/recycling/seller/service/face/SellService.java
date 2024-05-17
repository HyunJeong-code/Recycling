package recycling.seller.service.face;

import java.util.Map;

import recycling.dto.seller.Seller;

// 판매자 전환 및 공지사항, 메인 페이지 관련 처리

public interface SellService {

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
	 * @param getbCode - 구매자 코드
	 * @return seller DTO에 넣기
	 */
	public Map<String, Object> selectBuyerAdr(String getbCode);
	
	/**
	 * 판매자 신청을 DB에 삽입
	 * 
	 * @param seller - 판매자 신청 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertSeller(Seller seller);


}

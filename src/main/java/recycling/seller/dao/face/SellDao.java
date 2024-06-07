package recycling.seller.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Seller;
import recycling.util.PagingAndCtg;

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
	
	/**
	 * 등록 상품 개수
	 * 
	 * @param buyerLogin - 판매자 정보
	 * @return 개수
	 */
	public int selectPrdCnt(BuyerLogin buyerLogin);

	/**
	 * 결제 완료 주문 개수
	 * 
	 * @param buyerLogin - 판매자 정보
	 * @return 개수
	 */
	public int selectPayCnt(BuyerLogin buyerLogin);

	/**
	 * 배송 중 주문 개수
	 * 
	 * @param buyerLogin - 판매자 정보
	 * @return 개수
	 */
	public int selectShipCnt(BuyerLogin buyerLogin);
	
	/**
	 * 페이징을 위한 상세 주문 총 개수
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 개수
	 */
	public int selectCntAllOrd(PagingAndCtg upPaging);

	/**
	 * 페이징을 위한 문의글 총 개수
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 개수
	 */
	public int selectCntAllQna(PagingAndCtg unPaging);
	
	/**
	 * 상세 주문 리스트
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 주문 리스트
	 */
	public List<Map<String, Object>> selectAllOrd(PagingAndCtg upPaging);

	/**
	 * 미답변 문의 리스트
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 미답변 문의 리스트
	 */
	public List<Map<String, Object>> selectAllQna(PagingAndCtg unPaging);
}

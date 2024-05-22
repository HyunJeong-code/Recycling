package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;

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
	 * 주문하기
	 * 
	 * @param order - 주문 정보
	 */
	public int insertOrder(Orders order);

	/**
	 * Cart 조회하기
	 * 
	 * @param bCode - 조회할 아이디를 담은 session
	 * @return - 아이디로 조회된 모든 Cart List
	 */
	public List<CartOrder> selectAllCart(String bCode);

	/**
	 * cCode로 Cart 조회하기
	 * 
	 * @param cCode - 받아오는 cCode
	 * @return - 조회한 Cart 정보
	 */
	public CartOrder selectBycCode(String cCode);
	
	/**
	 * bCode로 BuyerAdr 조회하기
	 * 
	 * @param bCode - 조회할 bCode
	 * @return - 조회한 BuyerAdr 정보
	 */
	public BuyerAdr selectBybCode(String bCode);

	/**
	 * ordCode로 Orders 조회하기
	 * 
	 * @param ordCode - 조회할 ordCode
	 * @return - 조회한 Orders 정보
	 */
	public Orders selectByordCode(String ordCode);

	/**
	 * prdCode로 상품 수량 확인
	 * 
	 * @param prdCode - 조회할 상품의 prdCode
	 * @return - 해당 상품 수량
	 */
	public Integer selectPrdCnt(String prdCode);

	/**
	 * 선택된 상품 삭제
	 * 
	 * @param cCode - 삭제할 cCode
	 * @return - 삭제 결과
	 */
	public int deleteCart(String cCode);

	/**
	 * 결제된 상품 수량 차감
	 * 
	 * @param cart - 결제한 상품 DTO 객체
	 * @return - UPDATE 결과
	 */
	public int updatePrdCnt(CartOrder cart);
	
	/**
	 * 주문 상세 추가
	 * 
	 * @param orderDetail - 추가할 주문 상세 DTO
	 * @return - INSERT 결과
	 */
	public int insertOrderDetail(OrderDetail orderDetail);

	/**
	 * 주문 상세 조회
	 * 
	 * @param bCode - 조회할 회원의 bCode
	 * @return - 조회 List 결과
	 */
	public List<MyOrder> selectOrderDetailBybCode(String bCode);

	/**
	 * 장바구니 수량 변경
	 * 
	 * @param cart - 변경될 수량을 담고있는 Cart DTO 
	 * @return - UPDATE 결과
	 */
	public int updatecCnt(Cart cart);
	
	/**
	 * 개인 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 개인 구매자 정보
	 */
	public Buyer getBuyerDetail(String bId);
	
	/**
	 * 구매자 등급 조회
	 * 
	 * @param rankNo - 구매자 등급 번호
	 * @return 구매자 등급 정보
	 */
	public BuyerRank getBuyerRank(int rankNo);
	
	/**
	 * 기업 구매자 정보
	 * 
	 * @param bCode - 구매자 코드
	 * @return 기업 구매자 정보
	 */
	public Cmp getCmpDetail(String bCode);
	
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
	 * 개인 구매자 상세 정보 업데이트
	 * 
	 * @param buyer - 업데이트 할 구매자 정보
	 * @return 
	 */
	public Buyer updateBuyerDetail(Buyer buyer);
	
	/**
	 * 기업 구매자 상세 정보 업데이트
	 * 
	 * @param buyer - 업데이트 할 구매자 정보
	 * @param cmp - 업데이트 할 기업 정보
	 * @return 
	 */
	public Cmp updateCmpDetail(Cmp cmp);
	
	/**
	 * 구매자 배송지 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 배송지 목록
	 */
	public List<BuyerAdr> getBuyerAdrList(String bCode);
	
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
	 * 구매자 배송지 정보
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 배송지 정보
	 */
	public BuyerAdr getBuyerAdr(String bCode);
	
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


	public int changePw(BuyerLogin buyerLogin);

}

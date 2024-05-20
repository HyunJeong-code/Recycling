package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Cart;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Cmp;

// 마이페이지 - 회원 정보 관련 DB 처리
public interface BuyerDao {	
	
	/**
	 * 주문 추가
	 * 
	 * @param order - 주문 정보
	 * @return INSERT 결과
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
	public List<MyOrder> buyerDaoselectOrderDetailBybCode(String bCode);

	/**
	 * 장바구니 수량 변경
	 * 
	 * @param cart - 변경될 수량을 담고있는 Cart DTO 
	 * @return - UPDATE 결과
	 */
	public int updatecCnt(Cart cart);

	/**
	 * 구매자 아이디로 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 조회된 구매자 정보
	 */
	public Buyer selectBuyerBybId(String bId);
	
	/**
	 * 구매자 등급 번호로 구매자 등급 조회
	 * 
	 * @param rankNo - 구매자 등급 번호
	 * @return 구매자 등급
	 */
	public BuyerRank selectBuyerRank(int rankNo);

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
	 * @return 
	 */
	public int updateBuyer(Buyer buyer);
	
	/**
	 * 기업 정보 업데이트
	 * 
	 * @param cmp - 업데이트 할 기업 정보
	 * @return 
	 */
	public int updateCmp(Cmp cmp);
	
	/**
	 * 구매자 배송지 목록 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 구매자 배송지 목록
	 */
	public List<BuyerAdr> selectBuyerAdrListBybCode(String bCode);
	
	/**
	 * 시퀀스로부터 새로운 Adr_Code 생성
	 * 
	 * @return 새로운 Adr_Code
	 */
	public String getAdrCode();
	
	/**
	 * 배송지 등록
	 * 
	 * @param buyerAdr - 등록할 배송지 정보
	 * @return 등록 성공 행 개수
	 */
	public int registerAdr(BuyerAdr buyerAdr);

//	/**
//	 * 기본 배송지 설정
//	 * 
//	 * @param adrCode - 기본 배송지로 설정할 주소 코드
//	 * @return 설정 성공 여부
//	 */
//	public boolean setDefaultAdr(String adrCode);
	
	/**
	 * 현재 기본 배송지 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 기본 배송지 정보
	 */
	public BuyerAdr selectCurrentDefaultAdr(String bCode);
	
	/**
	 * 배송지 수정
	 * 
	 * @param buyerAdr - 수정할 배송지 정보
	 * @return 수정 성공 행 개수
	 */
	public int updateAdr(BuyerAdr buyerAdr);

	/**
	 * 배송지 삭제
	 * 
	 * @param adrCode - 삭제할 배송지 코드
	 * @return 삭제 성공 행 개수
	 */
	public int deleteAdr(String adrCode);
	
	/**
	 * 배송지 코드로 배송지 정보 조회
	 * 
	 * @param adrCode - 조회할 배송지 코드
	 * @return 배송지 정보
	 */
	public BuyerAdr selectBuyerAdrByAdrCode(String adrCode);

	/**
	 * 구매자 코드로 배송지 정보 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 조회된 배송지 정보
	 */
	public BuyerAdr selectBuyerAdrBybCode(String bCode);

	/**
	 * 구매자 탈퇴
	 * 
	 * @param bCode - 구매자 코드
	 */
	public void deleteBuyer(String bCode);

}
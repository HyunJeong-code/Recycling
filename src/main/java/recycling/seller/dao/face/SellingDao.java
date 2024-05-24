package recycling.seller.dao.face;

import java.util.List;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.dto.seller.AllPrd;
import recycling.dto.seller.Exp;
import recycling.util.Paging;

// 상품-판매 관련 DB

public interface SellingDao {

	/**
	 * 판매자가 올린 체험단 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectMyExpList(Paging paging);

	/**
	 * 검색된 데이터 개수
	 * 
	 * @param search - 데이터 입력
	 * @return 입력된 데이터를 검색
	 */
	public int selectCntAll(String search);

	/**
	 * 전체 페이징 조회
	 * 
	 * @return 총 페이지 수
	 */
	public int selectPageAll();

	/**
	 * expcode와 일치하는 체험단 조회
	 * 
	 * @param expCode - 체험단 코드번호
	 * @return 일치하는 exp 조회
	 */
	public Exp selectByExp(String expCode);

	/**
	 * expCode와 일치하는 expRes예약 리스트 조회
	 * 
	 * @param expCode - 체험단 코드번호
	 * @return 조회된 모든 expRes 리스트
	 */
	public List<ExpRes> selectResList(String expCode);

//	public List<ExpRes> selectResList(String expCode, Paging paging);

	/**
	 * sCode와 일치하는 모든 rcyPrd 조회
	 * 
	 * @param sCode - 조회할 sCode
	 * @return - 모든 rcyPrd 리스트
	 */
	public List<Prd> selectAllrcyPrd(String sCode);

	/**
	 * prdCode와 일치하는 모든 orders 조회
	 * 
	 * @param prdCode - 조회할 prdCode
	 * @return - 모든 orders 리스트
	 */
	public List<MyOrder> selectAllMyOrder(String prdCode);

	/**
	 * sCode와 일치하는 모든 upcyPrd 조회
	 * 
	 * @param sCode - 조회할 sCode
	 * @return - 모든 upcyPrd 리스트
	 */
	public List<Prd> selectAllupcyPrd(String sCode);

	/**
	 * prdCode와 일치하는 Prd 삭제
	 * 
	 * @param prdCode - 삭제하는 Prd의 prdCode
	 * @return - DELETE 결과
	 */
	public int deletePrd(String prdCode);

	/**
	 * prdCode와 일치하는 Prd 조회
	 * 
	 * @param prdCode - 조회하는 Prd의 prdCode
	 * @return - 조회한 Prd 객체
	 */
	public Prd selectByprdCode(String prdCode);

	/**
	 * Prd 객체 UPDATE
	 * 
	 * @param prd - prd 수정 정보를 가진 DTO 객체
	 * @return - UPDATE 결과
	 */
	public int updatePrd(Prd prd);

	/**
	 * orddtCode로 OrderDetail 조회
	 * 
	 * @param orddtCode - 조회할 orddtCode
	 * @return - SELECT 결과
	 */
	public OrderDetail selectByorddtCode(String orddtCode);
	
	public List<ExpRes> selectResList(Paging paging);
	
	/**
	 * 모든 상품과 체험단을 조회
	 * 
	 * @param seller - 로그인한 판매자 정보
	 * @return 모든 상품에 대한 정보
	 */
//	public List<AllPrd> selectAllPrd(BuyerLogin seller);

	/**
	 * 주문 상태 변경
	 * 
	 * @param ordd - 주문상세 번호와 UPDATE하는 상태번호를 가진 DTO
	 * @return - UPDATE 결과
	 */
	public int updateOrderDetail(OrderDetail ordd);

	/**
	 * 송장 등록
	 * 
	 * @param myOrder - 송장 정보가 담긴 DTO
	 * @return - INSERT 결과
	 */
	public int insertShip(MyOrder myOrder);

	/**
	 * 송장 삭제
	 * 
	 * @param orddtCode - 삭제할 송장의 orddtCode
	 * @return - DELETE 결과
	 */
	public int deleteShip(String orddtCode);

}

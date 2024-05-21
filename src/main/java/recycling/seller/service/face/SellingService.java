package recycling.seller.service.face;

import java.util.List;

import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.util.Paging;

// 상품-판매 관련 처리

public interface SellingService {

	/**
	 * 판매자가 올린 체험단 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectMyExpList(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체와 검색 객체를 생성
	 * 
	 * 전달 파라미터의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 게시글 수
	 * 
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환
	 * 
	 * @param curPage - 현재 페이지 번호
	 * @param search - 데이터 입력
	 * @return 페이징 계산이 완료된 객체, 입력된 데이터 검색 
	 */
	public Paging getSearchPaging(int curPage, String search);

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성
	 * 
	 * 전달 파라미터의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 게시글 수
	 * 
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환
	 * 
	 * @param curPage - 현재 페이지 번호
	 * @return 페이징 계산이 완료된 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * expcode와 일치하는 체험단 조회
	 * 
	 * @param expCode - 체험단 코드번호
	 * @return 일치하는 exp 조회
	 */
	public Exp selectByExp(String expCode);

//	public List<ExpRes> selectResList(String expCode, Paging paging);
	
	/**
	 * expCode와 일치하는 expRes예약 리스트 조회
	 * 
	 * @param expCode - 체험단 코드번호
	 * @return 조회된 모든 expRes 리스트
	 */
	public List<ExpRes> selectResList(String expCode);
	
	
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

	/**
	 * 토큰 발급
	 * 
	 * @return - 토큰
	 */
	public String getToken();

	/**
	 * 결제 취소
	 * 
	 * @param order - 취소하는 주문 DTO
	 * @param token - 토큰
	 * @return - 결제 취소 결과
	 */
	public int cencelpay(OrderDetail order, String token);

	/**
	 * 주문 상태 변경
	 * 
	 * @param ordd - 주문상세 번호와 UPDATE하는 상태번호를 가진 DTO
	 * @return - UPDATE 결과
	 */
	public int updateOrderDetail(OrderDetail ordd);


}

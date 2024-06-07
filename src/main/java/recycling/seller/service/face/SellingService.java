package recycling.seller.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.manager.ResSchCnt;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;
import recycling.util.PagingAndCtg;

// 상품-판매 관련 처리

public interface SellingService {

	/**
	 * sCode가 올린 체험단 전체조회
	 * 
	 * @param upPaging - 조회할 sCode 
	 * @return sCode와 연관된 exp 객체 List
	 */
	public List<Exp> selectMyExpList(PagingAndCtg upPaging);
	
	/**
	 * exp paging
	 * 
	 * @param upPaging - paging
	 * @return paging 결과
	 */
	public int selectCntAllexpList(PagingAndCtg upPaging);
	
	/**
	 * 체험단 체험일정 조회 페이징
	 * 
	 * @param upPaging - paging
	 * @return paging 결과
	 */
	public int selectCntAllExpSch(PagingAndCtg upPaging);
	
	/**
	 * expcode와 일치하는 체험단 조회
	 * 
	 * @param expCode - 체험단 코드번호
	 * @return 일치하는 exp 조회
	 */
	public Exp selectByExp(String expCode);
	
	/**
	 * expCode와 일치하는 체험단 일정 조회
	 * 
	 * @param expCode - 체험코드
	 * @return expSch 체험일정 List
	 */
	public List<ExpSch> selectAllSch(String expCode);

	/**
	 * 체험 스케쥴 예약된 인원 조회
	 * 
	 * @param schNo - 일정번호
	 * @param expCode - 체험코드
	 * @return 예약된 인원 List
	 */
	public List<ResSchCnt> selectByResCnt(String expCode);

	/**
	 * expCode와 일치하는 체험 file 조회(main, detail)
	 * 
	 * @param expCode - 체험코드
	 * @return file List
	 */
	public List<ExpFile> selectByExpFile(String expCode);

	
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
	 * 모든 상품과 체험단을 조회
	 * 
	 * @param seller - 로그인한 판매자 정보
	 * @return 모든 상품에 대한 정보
	 */
//	public List<AllPrd> selectAllPrd(BuyerLogin seller);

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
	

	/**
	 * 주문 상세 조회
	 * 
	 * @param orddtCode - 조회할 주문 상세
	 * @return - 조회한 MyOrder DTO
	 */
	public MyOrder selectMyOrderByOrddtCode(String orddtCode);


	/**
	 * rcyprd paging
	 * 
	 * @param upPaging - paging
	 * @return
	 */
	public int selectCntAllrcyPrd(PagingAndCtg upPaging);

	/**
	 * rcyMyOrder paging
	 * 
	 * @param unPaging - paging
	 * @return
	 */
	public int selectCntAllrcyMyOrder(PagingAndCtg unPaging);
	
	/**
	 * 주문 상세 수정, 송장 추가
	 * 
	 * @param myOrder - 수정 정보를 담은 DTO 객체
	 * @return - UPDATE 결과
	 */
	public int updateMyOrder(MyOrder myOrder);

	/**
	 * upcyprd paging
	 * 
	 * @param upPaging - paging
	 * @return
	 */
	public int selectCntAllupcyPrd(PagingAndCtg upPaging);

	/**
	 * upcyMyOrder paging
	 * 
	 * @param unPaging - paging
	 * @return
	 */
	public int selectCntAllMyOrder(PagingAndCtg unPaging);
	
	/**
	 * 판매자 전체 상품 개수 조회
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 개수
	 */
	public int selectCntAllPrd(PagingAndCtg upPaging);
	
	/**
	 * 판매자 전체 주문 개수 조회
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 개수
	 */
	public int selectCntAllOrd(PagingAndCtg unPaging);
	
	/**
	 * 판매자 전체 상품 조회
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 상품 리스트
	 */
	public List<Map<String, Object>> selectAllPrd(PagingAndCtg upPaging);

	/**
	 * 판매자 전체 주문 조회
	 * 
	 * @param upPaging - 판매자 정보, 검색어
	 * @return 주문 리스트
	 */
	public List<Map<String, Object>> selectAllOrd(PagingAndCtg unPaging);

	/**
	 * 체험정보
	 * 
	 * @param expRes
	 * @return
	 */
	public Exp expResDetail(String expCode);

	/**
	 * 체험 예약 조회
	 * 
	 * @param schNo - 체험 일정번호로 조회
	 * @return
	 */
	public ExpSch selectExpSchbySchNo(int schNo);

	/**
	 * 체험예약 정보
	 * 
	 * @param expCode
	 * @return
	 */
	public List<ExpRes> expResDetailRes(int schNo);

	public int expResUpdate(List<String> chBox, String actionType);

	/**
	 * PRD 파일 조회 
	 * 
	 * @param prdCode - 조회할 prdCode
	 * @return - 파일 조회 결과
	 */
	public List<PrdFile> selectPrdFile(String prdCode);
	
	/**
	 * 파일 업데이트
	 * @param prdCode 
	 * 
	 * @param profile - 업데이트할 파일
	 * @param file 
	 * @return
	 */
//	public int updatePrdFile(String prdCode, MultipartFile profile, MultipartFile file);

	/**
	 * 파일 업데이트
	 * 
	 * @param prdCode - 업데이트할 상품코드
	 * @param profile - 업데이트할 파일
	 * @return
	 */
	public int updateMainFile(String prdCode, MultipartFile profile);

	/**
	 * 파일 업데이트
	 * 
	 * @param prdCode - 업데이트할 상품코드
	 * @param profile - 업데이트할 파일
	 * @return
	 */
	public int updateDetailFile(String prdCode, MultipartFile detailFile);

	/**
	 * 상세 파일 삭제
	 * 
	 * @param map - 삭제할 파일코드
	 */
	public void deleteDetailFile(HashMap<String, String> map);

}

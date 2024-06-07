package recycling.manager.service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.manager.ResSchCnt;
import recycling.dto.manager.SellerOrderJoin;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.dto.seller.Seller;
import recycling.util.PagingAndCtg;

// 판매제휴팀 관련 처리
public interface SlsService {

	/**
	 * 판매자 목록
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Seller> main(PagingAndCtg upPaging);

	/**
	 * 판매자 전환 요청 전체 목록
	 * 
	 * @param paging
	 * 
	 * @return 판매자 리스트
	 */
	public List<Map<String, Object>> selectBysChk(PagingAndCtg paging);
	
	/**
	 * 체험단 전체 조회하기
	 * 
	 * @return - List<Exp>
	 */
	public List<Exp> selectAllExp(PagingAndCtg upPaging);

	/**
	 * 체험단 전체 조회 페이징[expList]
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllExp(PagingAndCtg upPaging);

	/**
	 * 체험단 세부 조회하기
	 * 
	 * @param upPaging - DTO 객체
	 * @return
	 */
	public Exp selectDetailExp(String expCode);

	/**
	 * 체험단 체험일정 조회[expdetail]
	 * 
	 * @param expCode
	 * 
	 * @return
	 */
	public List<ExpSch> selectAllSch(String expCode);

	/**
	 * 체험단 체험일정 조회페이징[expdetail]
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllExpSch(PagingAndCtg upPaging);

	/**
	 * 체험단 등록
	 * 
	 * @param exp
	 * @param selectedTimes
	 * @param expSch
	 * @param file
	 * @param file2
	 */
	public void insert(Exp exp, List<String> schTime, ExpSch expSch, MultipartFile profile, List<MultipartFile> file);

	/**
	 * 체험정보 업데이트항목 조회
	 * 
	 * @param exp
	 * @return
	 */
	public Exp expUpdateView(Exp exp);

	/**
	 * 체험정보 업데이트
	 * 
	 * @param manager
	 * @return
	 */
	public void expUpdateProc(Exp exp);

	/**
	 * 체험정보
	 * 
	 * @param expRes
	 * @return
	 */
	public Exp expResDetail(String expCode);

	/**
	 * 체험예약 정보
	 * 
	 * @param expCode
	 * @return
	 */
	public List<ExpRes> expResDetailRes(int schNo);

	/**
	 * 체험단 리스트 리뷰삭제
	 * 
	 * @param expCode
	 * @return
	 */
	public int expReviewListDel(String expCode);

	/**
	 * 체험단 리스트 파일삭제
	 * 
	 * @param expCode
	 * @return
	 */
	public int expFileListDel(String expCode);

	/**
	 * 체험단 리스트 스케줄삭제
	 * 
	 * @param expCode
	 * @return
	 */
	public int expSchListDel(String expCode);

	/**
	 * 체험단 리스트 삭제
	 * 
	 * @param chBox
	 */
	public int expListDel(String expCode);

	/**
	 * 이미지 업로드 번호조회
	 * 
	 * @param expFile
	 * @return
	 */
	public ExpFile image(ExpFile expFile);

	/**
	 * 예약 확정, 취소버튼에 따른 예약변경
	 * 
	 * @param chBox
	 */
	public int expResUpdate(List<String> chBox, String actionType);

	/**
	 * 체험 예약 조회
	 * 
	 * @param schNo - 체험 일정번호로 조회
	 * @return
	 */
	public ExpSch selectExpSchbySchNo(int schNo);

	/**
	 * 체험 예약, 인원 조인
	 * @param schNo 
	 * @param schNo 
	 * @param expCode 
	 * 
	 * @return
	 */
	public List<ResSchCnt> selectByResCnt(String expCode);

	/**
	 * 체험단 예약인원 예약변경창 조회하기
	 * 
	 * @param resSchCnt
	 * 
	 * @return
	 */
	public ResSchCnt changeExpRes(ResSchCnt resSchCnt);

	/**
	 * 체험단 예약인원 예약변경창 조회[ExpSchList]
	 * 
	 * @return
	 */
	public List<ExpSch> changeExpSch();

	/**
	 * 체험단 예약인원 예약변경하기
	 * 
	 * @param resSchCnt
	 * 
	 * @return
	 */
	public void changeExpResProc(ResSchCnt resSchCnt);

	/**
	 * 인원 변경
	 * 
	 * @param expSch
	 * @return
	 */
	public int cntChangeUpdate(ExpSch expSch);

	/**
	 * 예약인원 총합
	 * 
	 * @param expSch
	 * @return
	 */
	public int getTotalResCnt(ExpSch expSch);

	/**
	 * 예약자 체크삭제
	 * 
	 * @param chBox
	 */
	public int expResDetailListDel(List<String> chBox);

	/**
	 * expdetail 체크삭제[클래스]
	 * 
	 * @param chBox
	 */
	public int expDetailListDel(List<String> chBox);

	/**
	 * 판매자 코드로 구매자 코드 조회
	 * 
	 * @param sCode - 판매자 코드
	 * @return bCode - 구매자 코드
	 */
	public String selectBysCode(String sCode);

	/**
	 * 개인 판매자 상세 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 상세 정보
	 */
	public Map<String, Object> selectPriSeller(String bCode);

	/**
	 * 기업 판매자 상세 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 상세 정보
	 */
	public Map<String, Object> selectCmpSeller(String bCode);

	/**
	 * 신고 받은 횟수
	 * 
	 * @param sCode - 판매자 코드
	 * @return 총 신고 횟수
	 */
	public int selectCntRpt(String sCode);

	/**
	 * 총 거래완료 건수
	 * 
	 * @param sCode - 판매자 코드
	 * @return 총 거래 건수
	 */
	public int selectCntOrd(String sCode);

	/**
	 * 판매자 조회
	 * 
	 * @return
	 */
	public List<Map<String, Object>> sellerSelect(String getbCode);

	/**
	 * 판매자 전환 수락/거절
	 * 
	 * @param seller - 판매자 정보 및 수락/거절 여부
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updateSelChk(Seller seller);

	/**
	 * 판매자 전환 신청 리스트 페이징
	 * @param paging 
	 * 
	 * @return 총 게시물 수
	 */
	public int selectCntSeller(PagingAndCtg paging);
	
	/**
	 * 판매자 탈퇴 처리
	 * 
	 * @param sCode - 판매자 코드
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updateSelOut(String sCode);

	/**
	 * 업데이트 프로필 조회
	 * 
	 * @param expCode
	 * @return
	 */
	public ExpFile expUpdateProfile(ExpFile expFile);

	/**
	 * 업데이트 파일 조회
	 * 
	 * @param expFile
	 * @return
	 */
	public List<ExpFile> expUpdateFile(ExpFile expFile);

	/**
	 * 업데이트 프로필 수정하기
	 * 
	 * @param expFile
	 * @return
	 */
	public void expUpdatefileProc(ExpFile expfile);

	/**
	 * 업데이트 파일 가져오기
	 * 
	 * @param expfileUpdate
	 * @param expFileJoinCt
	 * @return
	 */
	public ExpFile updateFile(MultipartFile expfileUpdate, Exp exp);

	/**
	 * 멀티 업데이트 파일 가져오기
	 *
	 * @param expMultiFileUpdate
	 * @param exp
	 * @return
	 */
	public void updateMutiFile(List<MultipartFile> expMultiFileUpdate, Exp exp);

	/**
	 * 판매자 상품 조회
	 * 
	 * @param upPaging
	 * 
	 * @return
	 */
//	public List<SellerOrderJoin> selectAllPrdList(PagingAndCtg upPaging);

	/**
	 * 판매자 상품 조회[페이징]
	 * 
	 * @param upPaging
	 * 
	 * @return
	 */
	public int selectCntAllPrdList(PagingAndCtg upPaging);

	/**
	 * 판매자 판매 조회
	 * 
	 * @param unPaging
	 * 
	 * @return
	 */
	public List<MyOrder> selectAllSellList(PagingAndCtg unPaging);

	/**
	 * 판매자 판매 조회[페이징]
	 * 
	 * @param getsCode
	 * @return
	 */
	public int selectCntAllSellList(PagingAndCtg unPaging);

	/**
	 * 판매자 정보 조회
	 * @param seller 
	 * @param string
	 * @return
	 */
	public Map<String, Object> sellerAllSeller(Seller seller);

	/**
	 * 판매자 상품 세부조회
	 * 
	 * @param prdCode
	 * @return
	 */
	public Prd selectDetailPrd(String prdCode);

	/**
	 * 판매자 상품 업데이트
	 * 
	 * @param prd
	 * @return
	 */
	public int slsPrdUpdate(Prd prd);

	/**
	 * 판매자 상품 삭제
	 * 
	 * @param prdCode
	 * @return
	 */
	public int slsDeletePrd(String prdCode);

	/**
	 * 주문 상세 조회
	 * 
	 * @param orddtCode
	 * @return
	 */
	public MyOrder orderdetailPrd(String orddtCode);

	/**
	 * 페이징
	 * 
	 * @param pagingParam
	 * @return
	 */
	public int upPageSlsMain(PagingAndCtg upPaging);

	/**
	 * 멀티업로드 전 파일삭제
	 * @param map
	 */
	public void deleteDetailFile(HashMap<String, String> map);

	/**
	 * 멀티업로드 파일 ㄴ
	 * @param expCode
	 * @param detailFile
	 * @return
	 */
	public int updateDetailFile(String expCode, MultipartFile detailFile);

	/**
	 * 체험 프로필 이미지
	 * @param expFile
	 * @return
	 */
	public ExpFile expProImage(ExpFile expFile);
	
	/**
	 * 이미지 업로드 번호조회
	 * 
	 * @param expFile
	 * @return
	 */
	public List<ExpFile> expImage(ExpFile expFile);

	public List<SellerOrderJoin> selectAllPrdList(PagingAndCtg upPaging);

}
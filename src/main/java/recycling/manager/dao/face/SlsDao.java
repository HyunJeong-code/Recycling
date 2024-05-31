package recycling.manager.dao.face;

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
// 판매제휴팀 DB 처리
import recycling.dto.seller.Seller;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 판매제휴팀 DB 처리
public interface SlsDao {
	
	/**
	 * 판매자 전환 요청 전체 목록
	 * 
	 * @param paging - 검색어
	 * @return 판매자 리스트
	 */
	public List<Map<String, Object>> selectBysChk(PagingAndCtg paging);
	
	/**
	 * 판매자 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<Seller> main(Paging paging);

	/**
	 * 페이징
	 * 
	 * @return
	 */
	public int getPaging();
	
	/**
	 * 체험단 전체 조회하기[expList]
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
	 * 체혐 스케쥴 예약된 인원 조회
	 * @param schNo 
	 * @param schNo 
	 * @param expCode 
	 * 
	 * @return
	 */
	public List<ResSchCnt> selectByResCnt(String expCode);
	
	/**
	 * 
	 * 체험단 등록
	 * 
	 * @param exp
	 */
	public void insert(Exp exp);

	/**
	 * 파일 저장
	 * 
	 * @param main
	 * @param exp
	 * @return
	 */
	public ExpFile expSaveFile(MultipartFile main, Exp exp);

	/**
	 * 썸네일 삽입
	 * 
	 * @param expMain
	 * @return
	 */
	public int expInsertFileMain(ExpFile expMain);

	/**
	 * 상품 상세 삽입
	 * 
	 * @param expFile
	 * @return
	 */
	public int expInsertFileDetail(ExpFile expFile);
	
	
	/**
	 * 
	 * 게시판 번호 가져오기
	 * @param exp
	 * @return
	 */
	public String selectByExp(Exp exp);

	/**
	 * 
	 * 파일 업로드
	 * 
	 * @param expFile
	 */
	public void expFileUp(ExpFile expFile);
	
	/**
	 * 
	 * 체험 일정 업로드
	 * 
	 * @param expSch
	 */
	public void expschUp(ExpSch expSch);

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
	 * 
	 * 체험 예약페이지 정보 조회
	 * @param expCode 
	 * 
	 * @param expCode
	 * @return
	 */
	public Exp expResDetail(String expCode);

	/**
	 * 
	 * 체험 예약페이지 예약 조회
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
	 * @param chBox
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
	 * 체험단 리스트삭제
	 * 
	 * @param chBox
	 */
	public int expListDel(String expCode);

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

	/**
	 * 예약 확정버튼에 따른 예약변경
	 * 
	 * @param chBox
	 */
	public int expResCnf(String resCode);

	/**
	 * 예약 취소버튼에 따른 예약변경
	 * 
	 * @param chBox
	 */
	public int expResCnl(String resCode);

	/**
	 * 체험 예약 조회
	 * 
	 * @param schNo - 체험 일정번호로 조회
	 * @return
	 */
	public ExpSch selectExpSchbySchNo(int schNo);

	/**
	 * 체험단 예약인원 예약변경창 조회하기
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
	public int expResDetailListDel(String resCode);
	
	/**
	 * expdetail 체크삭제[클래스]
	 * 
	 * @param chBox
	 */
	public int expDetailListDel(String schNo);
	
	 /** 판매자 코드로 구매자 코드 조회
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
	 * resCnt 조회해서 res_cnt가져오기
	 * 
	 * @param schNo
	 * @return
	 */
	public int getResCntBySchNo(String schNo);

	/**
	 * 업데이트 프로필 조회
	 * 
	 * @param expFile
	 * @return
	 */
	public ExpFile expUpdateProfile(ExpFile expFile);

	/**
	 * 업데이트 파일 조회
	 * 
	 * @param expCode
	 * @return
	 */
	public List<ExpFile> expUpdateFile(ExpFile expFile);

	/**
	 * 업데이트 프로필 수정하기
	 * 
	 * @param expCode
	 * @return
	 */
	public void expUpdatefileProc(ExpFile expfile);

	/**
	 * 업데이트 파일 수정하기
	 * 
	 * @param expFile
	 */
	public void expUpdateMultiFileProc(ExpFile expFile);

	/**
	 * 판매자 전환 수락/거절
	 * @param seller - 판매자 정보 및 수락/거절 여부
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updateSelChk(Seller seller);
	
	/**
	 * 판매자 상품 조회
	 * 
	 * @return
	 */
	public List<SellerOrderJoin> selectAllPrdList();
	
	/**
	 * 판매자 판매 조회
	 * 
	 * @return
	 */
	public List<SellerOrderJoin> selectAllSellList();

	/**
	 * 판매자 정보 조회
	 * @param getsCode 
	 * @return
	 */
	public List<Map<String, Object>> sellerAllSeller(String getsCode);

	/**
	 * 판매자 전환 신청 리스트 페이징
	 * 
	 * @return 총 게시물 수
	 */
	public int selectCntSeller();
	
	/**
	 * 판매자 탈퇴 처리
	 * 
	 * @param sCode - 판매자 코드
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updateSelOut(String sCode);

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
	
}

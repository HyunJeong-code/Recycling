package recycling.manager.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;


import recycling.dto.seller.Seller;
import recycling.util.Paging;

// 판매제휴팀 관련 처리
public interface SlsService {

	/**
	 * 판매자 목록
	 * 
	 * @param paging
	 * @return
	 */
	public List<Seller> main(Paging paging);
	
	
	/**
	 * 페이징
	 * 
	 * @param pagingParam
	 * @return
	 */
	public Paging getPaging(Paging pagingParam);

	/**
	 * 판매자 전환 요청 전체 목록
	 * 
	 * @return 판매자 리스트
	 */
	public List<Map<String, Object>> selectBysChk();
	
	/**
	 * 체험단 전체 조회하기
	 * 
	 * @return - List<Exp>
	 */
	public List<Exp> selectAll();
	
	/**
	 * 체험단 체험일정 조회하기
	 * @param expCode 
	 * 
	 * @return
	 */
	public List<ExpSch> selectSchAll(String expCode);

	/**
	 * 체험단 세부사항 조회
	 * 
	 * @param exp - Exp
	 * @return Exp
	 */
	public Exp selectDetail(Exp exp);

	/**
	 * 체험단 등록
	 * 
	 * @param exp
	 * @param selectedTimes 
	 * @param expSch 
	 * @param file 
	 */
	public void insert(Exp exp, List<String> schTime, ExpSch expSch, MultipartFile file);
	
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
	public List<ExpRes> expResDetailRes(ExpRes expRes);

	/**
	 * 체험단 예약정보 리스트 삭제
	 * 
	 * @param chBox
	 */
	public int expListDel(List<String> chBox);

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

	public void insert(Exp exp, ExpSch expSch, MultipartFile file);
	
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
	
}

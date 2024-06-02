package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 고객 센터 관련 DB 처리

public interface HelpDao {

	/**
	 * 전체 페이징 조회
	 * 
	 * @return 총 페이지 수
	 */
	public int selectPageAll();

	
	/**
	 * 자주 묻는 질문 전체 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 자주 묻는 질문 List
	 */
	public List<Faq> selectAllFaq(Paging paging);

	/**
	 * 자주 묻는 질문 분류 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 질문 분류 List
	 */
	public List<FaqCt> selectAllCtFaq(Paging paging);

	/**
	 * 공지사항 구매자 판매자 분류 조회
	 * 
	 * @param i - 0은 구매자, 1은 판매자
	 * @return 선택한 분류에 맞는 공지사항 List
	 */
	public List<Notice> selectByCategory(int i);

	/**
	 * 공지사항 상세조회
	 * 
	 * @param ntcCode - 공지사항 코드
	 * @return 공지사항 상세내용
	 */
	public Notice selectByNotice(String ntcCode);

	/**
	 * 공지사항 조회수 
	 * 
	 * @param ntcCode - 공지사항 코드
	 */
	public void updateNtcHit(String ntcCode);

	/**
	 * 1:1문의 게시글 작성을 위한 객체
	 * 
	 * @param oto - 1:1문의글
	 */
	public int insertOto(Oto oto);

	/**
	 * 1:1문의글 분류 선택을 위한 객체
	 * 
	 * @return 분류 List
	 */
	public List<OtoCt> selectAllOtoCt();

	/**
	 * 1:1문의 게시글 전체 조회
	 * 
	 * @return 1:1문의 DTO를 가진 List
	 */
	public List<Oto> selectAllOto();


	/**
	 * 1:1문의 작성 폼에 분류 선택 기능
	 * 
	 * @return 1:1문의 분류 DTO를 가진 List
	 */
	public List<OtoCt> getAllOct();


	/**
	 * 1:1문의 상세페이지 접속 시 조회수 증가
	 * 
	 * @param otoCode - 1:1문의 코드
	 */
	public void updateOtoHit(String otoCode);


	/**
	 * 1:1문의 상세 조회
	 * 
	 * @param otoCode - 1:1 문의 코드
	 * @return 1:1문의 상세내용
	 */
	public Oto selectByOtoCode(String otoCode);


	/**
	 * 개인 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 개인 구매자 정보
	 */
	public Buyer selectBuyerBybId(String bId);


	/**
	 * 파일 정보 DB에 삽입
	 * 
	 * @param otoFile - 파일 정보
	 * @return 0: 실패, 1 : 성공
	 */
	public int insertOtoFiles(OtoFile otoFile);


	/**
	 * 1:1문의 업로드 한 파일 보여주기
	 * 
	 * @param otoCode - 1:1문의 코드
	 * @return otoCode와 일치하는 게시글의 파일 List view
	 */
	public List<OtoFile> getOtoFiles(String otoCode);


	/**
	 * 판매자 여부 확인
	 * 
	 * @param bCode - 구매자 코드
	 * @return 0 : 실패, 1 : 성공
	 */
	public int chkSeller(String bCode);


	/**
	 * oto paging
	 * 
	 * @param upPaging - paging
	 * @return paging 결과
	 */
	public int selectCntAllOtoList(PagingAndCtg upPaging);

	/**
	 * 전체 oto 리스트 조회
	 * 
	 * @param upPaging - paging
	 * @return oto List
	 */
	public List<Map<String, Object>> selectAllOto(PagingAndCtg upPaging);


	/**
	 * ct_otono 값에 해당하는 1:1문의글 분류 
	 * 
	 * @param params - ctOtoNo
	 * @return 선택한 분류 1:1문의글 List
	 */
	public List<Map<String, Object>> selectByCtOto(Map<String, Object> params);


	/**
	 * oto 분류 코드
	 * 
	 * @param params - otoCtNo
	 * @return 
	 */
	public Ans selectAnsByOtoCode(String otoCode);





}

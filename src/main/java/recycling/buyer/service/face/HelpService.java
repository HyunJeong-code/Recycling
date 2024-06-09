package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.PagingAndCtg;

public interface HelpService {

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
	 * 1:1문의 작성 폼에 분류 선택 기능
	 * 
	 * @return 1:1문의 분류 DTO를 가진 List
	 */
	public List<OtoCt> getAllOct();

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
	public Buyer getBuyerDetail(String bId);

	/**
	 * 파일 저장
	 * 
	 * @param mult - 저장할 파일
	 * @param oto - 1:1문의 정보
	 * @return null : 실패, else : 성공
	 */
	public OtoFile saveFile(MultipartFile mult, Oto oto);

	/**
	 * 파일 정보 DB에 삽입
	 * 
	 * @param otoFile - 파일 정보
	 * @return 0 : 실패, 1 : 성공
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
	 * otoCode 와 일치하는 답변
	 * 
	 * @param otoCode - 1:1문의 코드
	 * @return ans
	 */
	public Ans selectAnsByOtoCode(String otoCode);

	/**
	 * 자주 묻는 질문 페이징
	 * 
	 * @param upPaging - 페이징 정보 객체
	 * @return 
	 */
	public int selectCntAllFaq(PagingAndCtg upPaging);

	/**
	 * 자주 묻는 질문 전체 조회
	 * 
	 * @param upPaging - 페이징 정보 객체
	 * @return 자주 묻는 질문 List
	 */
	public List<Faq> selectAllFaq(PagingAndCtg upPaging);

	/**
	 * 자주 묻는 질문 분류 리스트
	 * 
	 * @param upPaging - 페이징 정보 객체
	 * @return 질문 분류 List
	 */
	public List<FaqCt> selectAllCtFaq();

	/**
	 * 자주 묻는 질문 분류별 페이징
	 * 
	 * @param params - 페이징 정보 객체
	 * @return paging
	 */
	public int selectCntFaqByCt(Map<String, Object> params);


	/**
	 * 자주 묻는 질문 분류별 리스트 조회
	 * 
	 * @param upPaging - 페이징 정보 객체
	 * @return list
	 */
	public List<Faq> selectFaqByCt(PagingAndCtg upPaging);

	/**
	 * isSelller 가 true면 판매자 + 구매자 공지사항 조회
	 * 
	 * @param params - isSeller, ct_nctno
	 * @return noticeList
	 */
	public List<Notice> selectNoticeForSeller(Map<String, Object> params);

	/**
	 * isSelller 가 false면 판매자 + 구매자 공지사항 조회
	 * 
	 * @param params - isSeller, ct_nctno
	 * @return noticeList
	 */
	public List<Notice> selectNoticeForBuyer(Map<String, Object> params);

	/**
	 * 공지사항 페이징 개수 조회
	 * 
	 * @param params - 페이징 객체, ct_nctno
	 * @return paging
	 */
	public int selectCntAllNoticeList(PagingAndCtg upPaging, boolean isSeller);

	/**
	 * 판매자 여부 확인
	 * 
	 * @param bCode - 구매자 코드
	 * @return 0 : 실패, 1 : 성공
	 */
	public boolean chkSeller(String bCode);

	/**
	 * 공지사항 상세조회
	 * 
	 * @param ntcCode - 공지사항 코드
	 * @return 공지사항 상세내용
	 */
	public Notice selectByNotice(String ntcCode);


	



}

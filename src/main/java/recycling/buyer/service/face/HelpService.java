package recycling.buyer.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

public interface HelpService {

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
	 * 판매자 전용 공지사항 전체 조회
	 * 
	 * @return 공지사항 List
	 */
	public List<Notice> selectNoticeSeller();

	/**
	 * default값 구매자로, 기본 공지사항 전체 조회
	 * 
	 * @return 공지사항 List 
	 */
	public List<Notice> selectNoticeBuyer();

	/**
	 * 공지사항 상세조회
	 * 
	 * @param ntcCode - 공지사항 코드
	 * @return 공지사항 상세내용
	 */
	public Notice selectByNotice(String ntcCode);

	/**
	 * 1:1문의 게시글 작성을 위한 객체
	 * 
	 * @param oto - 1:1문의글
	 */
	public int insertOto(Oto oto);
//	public void insertOto(Oto oto);


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
	 * ct_otono 값에 해당하는 1:1문의글 분류 
	 * 
	 * @param string - ct_otono를 형식 변환
	 * @return 선택한 분류 1:1문의글 List
	 */
	public List<Oto> selectByCtOto(String string);

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
	 * 판매자 여부 확인
	 * 
	 * @param bCode - 구매자 코드
	 * @return 0 : 실패, 1 : 성공
	 */
	public boolean chkSeller(String bCode);

	



}

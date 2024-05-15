package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

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
	public void ntcHit(String ntcCode);

	/**
	 * 1:1문의 게시글 작성을 위한 객체
	 * 
	 * @param oto - 1:1문의글
	 */
	public void insertOto(Oto oto);

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




}

package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.buyer.Qst;
import recycling.dto.buyer.QstCt;
import recycling.dto.seller.Qna;
import recycling.util.PagingAndCtg;

// 마이페이지 - 내 게시물 관련

public interface MypageService {

	/**
	 * 로그인한 구매자 문의글 전체 조회
	 * 
	 * @param paging - 구매자 정보
	 * @return 문의글 리스트
	 */
	public List<Map<String, Object>> selectQnaBybCode(PagingAndCtg paging);
	
	/**
	 * 로그인한 구매자 후기글 전체 조회
	 * 
	 * @param paging - 구매자 정보
	 * @return 후기글 리스트
	 */
	public List<Map<String, Object>> selectRvwBybCode(PagingAndCtg paging);
	
	/**
	 * 문의글 페이징 처리
	 * 
	 * @param paging - 페이지 및 검색어/카테고리/사용자 정보
	 * @return 총 페이지 개수
	 */
	public int selectCntQna(PagingAndCtg upPaging);
	
	/**
	 * 후기 페이징 처리
	 * 
	 * @param paging - 페이지 및 검색어/카테고리/사용자 정보
	 * @return 총 페이지 개수
	 */
	public int selectCntRvw(PagingAndCtg unPaging);
	
	/**
	 * 구매 완료, 체험 완료 개수 조회
	 * @param paging
	 * @return 개수
	 */
	public int selectAllCnt(PagingAndCtg paging);

	/**
	 * 구매 완료, 체험 완료 리스트 조회
	 * @param paging
	 * @return 리스트
	 */
	public List<Map<String, Object>> selectAll(PagingAndCtg paging);

	/**
	 * 1:1 문의 상세 조회
	 * 
	 * @param otoCode - 문의 코드
	 * @return 조회된 문의 상세 정보
	 */
	public Oto getByOtoCode(String otoCode);
	
	/**
	 * 1:1 문의 상세 조회 분류
	 * 
	 * @return 1:1 문의 분류 리스트
	 */
	public List<OtoCt> getAllOct();
	
	/**
	 * 1:1 문의 파일 조회
	 * 
	 * @param otoCode - 문의 코드
	 * @return 조회된 문의 파일 리스트
	 */
	public List<OtoFile> getOtoFiles(String otoCode);

	/**
	 * 개인 구매자 정보 조회
	 * 
	 * @param bId - 구매자 아이디
	 * @return 개인 구매자 정보
	 */
	public Buyer getBuyerDetail(String bId);

//	/**
//	 * 1:1 문의 게시글 작성을 위한 객체
//	 * 
//	 * @param oto - 1:1 문의글
//	 * @return
//	 */
//	public int insertOto(Oto oto);
//
//	/**
//	 * 파일 저장
//	 * 
//	 * @param mult - 저장할 파일
//	 * @param oto - 1:1 문의 정보
//	 * @return null: 실패, else: 성공
//	 */
//	public OtoFile saveFile(MultipartFile file, Oto oto);
//
//	/**
//	 * 1:1 문의 업로드 한 파일 보여주기
//	 * 
//	 * @param otoFile - 파일 정보
//	 * @return 0: 실패, 1: 성공
//	 */
//	public int insertOtoFiles(OtoFile otoFile);
	
	/**
	 * 1:1 문의 삭제
	 * 
	 * @param otoCode - 1:1 문의 코드
	 * @return 삭제된 행의 수
	 */
	public int deleteOto(String otoCode);

	/**
	 * 판매자 문의 상세 조회 분류
	 * 
	 * @return 판매자 문의 분류 리스트
	 */
	public List<QstCt> getAllQct();
	
	/**
	 * qstCode와 일치하는 Qst 조회
	 * 
	 * @param qstCode - 조회할 qstCode
	 * @return 조회된 Qst 객체
	 */
	public Qst getQstByqstCode(String qstCode);

	/**
	 * qstCode와 일치하는 Qna 조회
	 * 
	 * @param qstCode - 조회할 qstCode
	 * @return 조회된 Qna 객체
	 */
	public Qna getQnaByqstCode(String qstCode);

//	/**
//	 * Qna 작성
//	 * 
//	 * @param qna - 작성할 Qna 객체
//	 * @return 삽입 결과
//	 */
//	public int insertQna(Qna qna);

	/**
	 * Qna 삭제
	 * 
	 * @param qnaCode - 삭제할 qnaCode
	 * @return 삭제된 행의 수
	 */
	public int deleteQna(String qstCode);

	/**
	 * Qst 삭제
	 * 
	 * @param qstCode - 삭제할 qstCode
	 * @return 삭제된 행의 수
	 */
	public int deleteQst(String qstCode);

}
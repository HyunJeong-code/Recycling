package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.buyer.Qst;
import recycling.dto.buyer.QstCt;
import recycling.dto.buyer.QstFile;
import recycling.dto.seller.Qna;
import recycling.util.PagingAndCtg;

// 마이페이지 - 내 게시물 관련 DB 처리

public interface MypageDao {
	
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
	 * 1:1 문의 상세 조회
	 * 
	 * @param otoCode - 1:1 문의 코드
	 * @return 1:1 문의 상세 내용
	 */
	public Oto getByOtoCode(String otoCode);
	
	/**
	 * 1:1 문의 분류
	 * 
	 * @return 1:1 문의 분류 리스트
	 */
	public List<OtoCt> getAllOct();
	
	/**
	 * 1:1 문의 첨부 파일 리스트 조회
	 * 
	 * @param otoCode - 1:1 문의 코드
	 * @return 조회된 첨부 파일 리스트
	 */
	public List<OtoFile> getOtoFiles(String otoCode);

	/**
	 * 1:1 문의 상세페이지 접속 시 조회수 증가
	 * 
	 * @param otoCode - 1:1 문의 코드
	 */
	public void updateOtoHit(String otoCode);

	/**
	 * 
	 * 
	 * @param bId
	 * @return
	 */
	public Buyer getBuyerDetail(String bId);

	/**
	 * 1:1 문의 삭제
	 * 
	 * @param otoCode - 1:1 문의 코드
	 * @return 삭제된 행의 수
	 */
	public int deleteOto(String otoCode);

	/**
	 * 1:1 문의 파일 삭제
	 * 
	 * @param otoCode - 1:1 문의 코드
	 * @return 삭제된 행의 수
	 */
	public int deleteOtoFile(String otoCode);
	
	/**
	 * 판매자 분류
	 * 
	 * @return 판매자 분류 리스트
	 */
	public List<QstCt> getAllQct();
	
	/**
	 * qstCode에 해당하는 QstFile 리스트 조회
	 * 
	 * @param qstCode - 조회된 qstCode
	 * @return 조회된 Qst 파일 리스트
	 */
	public List<QstFile> getQstFiles(String qstCode);
	
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

	/**
	 * Qst 삭제
	 * 
	 * @param qstCode - 삭제할 qstCode
	 * @return 삭제된 행의 수
	 */
	public int deleteQst(String qstCode);

	/**
	 * Qna 삭제
	 * 
	 * @param qnaCode - 삭제할 qnaCode
	 * @return 삭제된 행의 수
	 */
	public int deleteQna(String qstCode);
	
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
	 * 마이페이지 메뉴 기본 정보
	 * 
	 * @param buyerLogin
	 * @return
	 */
	public List<Map<String, Object>> selectBuyer(BuyerLogin buyerLogin);

}


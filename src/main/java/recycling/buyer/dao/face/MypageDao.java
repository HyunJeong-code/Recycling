package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoFile;
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
	 * @param otoCode - 문의 코드
	 * @return 조회된 1:1 문의 정보
	 */
	public Oto getOtoDetail(String otoCode);

	/**
	 * 1:1 문의 첨부 파일 리스트 조회
	 * 
	 * @param otoCode - 문의 코드
	 * @return 조회된 첨부 파일 리스트
	 */
	public List<OtoFile> getOtoFile(String otoCode);

	/**
	 * 1:1 문의 작성
	 * 
	 * @param oto - 문의 정보
	 * @return 작성 결과
	 */
	public int insertOto(Oto oto);

	/**
	 * 1:1 문의 첨부 파일 작성
	 * 
	 * @param otoFile - 첨부 파일
	 * @return 작성 결과
	 */
	public int insertOtoFile(OtoFile otoFile);

	/**
	 * 1:1 문의 삭제
	 * 
	 * @param otoCode - 문의 코드
	 * @return 삭제 결과
	 */
	public int deleteOto(String otoCode);
	
	/**
	 * 1:1 문의 첨부 파일 삭제
	 * 
	 * @param otoCode - 문의 코드
	 * @return 삭제 결과
	 */
	public int deleteOtoFile(String otoCode);
}
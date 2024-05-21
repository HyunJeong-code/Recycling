package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.util.Paging;

public interface ExpService {


	/**
	 * 체험단 전체 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectAllExp(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체와 검색 객체를 생성
	 * 
	 * 전달 파라미터의 curPage - 현재 페이지
	 * DB에서 조회한 totalCount - 총 게시글 수
	 * 
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하고 반환
	 * 
	 * @param curPage - 현재 페이지 번호
	 * @param search - 데이터 입력
	 * @return 페이징 계산이 완료된 객체, 입력된 데이터 검색 
	 */
	public Paging getSearchPaging(int curPage, String search);

	/**
	 * 최신순 체험단 전체 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectRecentExp(Paging paging);

	/**
	 * 인기순위 체험단 전체 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectPopularExp(Paging paging);

	/**
	 * 인기순 체험단 5개 리스트
	 * 
	 * @return 체험단 List
	 */
	public List<Exp> selectTopPopExp();

	/**
	 * 새체험 체험단 5개 리스트
	 * 
	 * @return 체험단 List
	 */
	public List<Exp> selectTopRecExp();

	public Exp selectByExpCode(String expCode);

	public List<ExpFile> selectByExpFile(String expCode);

}

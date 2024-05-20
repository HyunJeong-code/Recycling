package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Exp;
import recycling.util.Paging;

// 체험단 관련 DB 처리

public interface ExpDao {

	/**
	 * 체험단 전체 리스트
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 체험단 List
	 */
	public List<Exp> selectAllExp(Paging paging);

	/**
	 * 검색된 데이터 개수
	 * 
	 * @param search - 데이터 입력
	 * @return 입력된 데이터를 검색
	 */
	public int selectCntAll(String search);

	public List<Exp> selectRecentExp(Paging paging);

	public List<Exp> selectPopularExp(Paging paging);


	public List<Exp> selectTopPopExp();

	public List<Exp> selectTopRecExp();

}

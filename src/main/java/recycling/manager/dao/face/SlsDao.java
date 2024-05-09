package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.seller.Exp;

// 판매제휴팀 DB 처리

public interface SlsDao {
	/**
	 * 체험단 전체 조회하기
	 * 
	 * @return - List<Exp>
	 */
	public List<Exp> selectAll();

	/**
	 * 체험단 세부 조회하기
	 * 
	 * @param exp - DTO 객체
	 * @return
	 */
	public Exp selectDetail(Exp exp);

	/**
	 * 조회수 증감
	 * 
	 * @param exp - DTO 객체
	 */
	public void hit(Exp exp);

	/**
	 * 
	 * 체험단 등록
	 * 
	 * @param exp
	 */
	public void insert(Exp exp);
}

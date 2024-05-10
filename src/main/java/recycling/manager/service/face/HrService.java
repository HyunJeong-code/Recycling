package recycling.manager.service.face;

import java.util.List;

import recycling.dto.manager.Manager;

// 인사팀 관련 처리

public interface HrService {

	/**
	 * 전체조회
	 * 
	 * @return
	 */
	public List<Manager> selectAll();
	/**
	 * 세부사항 조회
	 * 
	 * @param manager - DTO 정보
	 * @return
	 */
	public Manager selectDetail(Manager manager);
	
	/**
	 * 글쓰기 폼
	 * 
	 * @param manager - DTO 정보
	 */
	public void insert(Manager manager);

	
	/**
	 * 체크박스 삭제
	 * 
	 * @param chBox - 체크 여부
	 * @return
	 */
	public int listDel(List<String> chBox);
}

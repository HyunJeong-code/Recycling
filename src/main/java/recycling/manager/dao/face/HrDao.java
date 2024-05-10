package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.manager.Manager;


// 인사팀 DB 처리

public interface HrDao {
	/**
	 * Manager 전체 조회하기
	 * 
	 * @return
	 */
	public List<Manager> selectAll();

	/**
	 * Manager mgrCode를 이용한 특정데이터 조회 
	 * 
	 * @param manager - DTO 정보
	 * @return
	 */
	public Manager selectDetail(Manager manager);

	/**
	 * 데이터 [어떤거 들어갈지 아직 안정함]
	 * 
	 * @param manager
	 */
	public void insert(Manager manager);

	
	/**
	 *
	 * mgrCode를 이용해서 체크유무에 따른 삭제구현
	 * 
	 * @param mgrCode
	 * @return
	 */
	public int listDel(String mgrCode);


}

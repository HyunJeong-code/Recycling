package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerJoinDe;
import recycling.dto.manager.MgrFile;
import recycling.util.PagingAndCtg;


// 인사팀 DB 처리

public interface HrDao {
	
	/**
	 * 전체조회[main]
	 * 
	 * @return
	 */
	public List<ManagerJoinDe> selectAllHr(PagingAndCtg upPaging);

	/**
	 * 전체조회 페이징[main]
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllHr(PagingAndCtg upPaging);

	/**
	 * Manager mgrCode를 이용한 특정데이터 조회 
	 * 
	 * @param manager - DTO 정보
	 * @return
	 */
	public Manager selectDetail(Manager manager);

	/**
	 * 세부사항 파일조회
	 * @param manager 
	 * 
	 * @return
	 */
	public MgrFile mgrFileList(MgrFile mgrFile);
	
	/**
	 * 인사정보 등록
	 * 
	 * @param manager
	 */
	public void insert(Manager manager);
	
	/**
	 * 파일 업로드
	 * 
	 * @param mgrFile
	 */
	public void fileup(MgrFile mgrFile);
	
	/**
	 * 파일 다운로드
	 * 
	 * @param mgrFile
	 * @return
	 */
	public MgrFile FileDown(MgrFile mgrFile);
	
	/**
	 * 회원정보 업데이트항목 조회
	 * 
	 * @param manager
	 * @return
	 */
	public Manager hrUpdateView(Manager manager);
	
	/**
	 * 회원정보 업데이트
	 * 
	 * @param manager
	 */
	public void hrUpdate(Manager manager);

	/**
	 * mgrCode를 이용해서 체크유무에 따른 삭제구현
	 * 
	 * @param mgrCode
	 * @return
	 */
	public int listDel(String mgrCode);

	/**
	 * 세부사항 파일조회
	 * @param manager 
	 * 
	 * @return
	 */
	public MgrFile mgrFileUpdateList(MgrFile mgrFile);

	
	/**
	 * 파일 업데이트
	 * 
	 * @param mgrFile
	 */
	public void updateProfileProc(MgrFile mgrFile);

}

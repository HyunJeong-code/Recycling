package recycling.manager.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerJoinDe;
import recycling.dto.manager.MgrFile;
import recycling.dto.seller.ExpFile;
import recycling.util.PagingAndCtg;

// 인사팀 관련 처리

public interface HrService {

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
	 * 세부사항 조회
	 * 
	 * @param manager - DTO 정보
	 * @return
	 */
	public Manager selectDetail(Manager manager);

	/**
	 * 세부사항 프로필 조회
	 * @param mgrFile
	 * @return
	 */
	public MgrFile mgrProFileList(MgrFile mgrFile);
	
	/**
	 * 세부사항 파일조회
	 * @param manager 
	 * 
	 * @return
	 */
	public MgrFile mgrFileList(MgrFile mgrFile);

	/**
	 * 파일 다운로드
	 * 
	 * @param fileno
	 * @return
	 */
	public MgrFile FileDown(MgrFile mgrFile);
	
	/**
	 * 글쓰기 폼
	 * 
	 * @param manager - DTO 정보
	 */
	public void insert(Manager manager,MultipartFile profile, MultipartFile file);

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
	 * @param file 
	 */
	public void hrUpdate(Manager manager);
	
	/**
	 * 체크박스 삭제
	 * 
	 * @param chBox - 체크 여부
	 * @return
	 */
	public int listDel(List<String> chBox);

	/**
	 * 세부사항 파일조회
	 * @param manager 
	 * 
	 * @return
	 */
	public MgrFile mgrFileUpdateList(MgrFile mgrFile);

	/**
	 * 업데이트 파일 가져오기
	 * 
	 * @param empFileUpdate
	 * @param manager
	 * @return
	 */
	public MgrFile updateProFileGet(MultipartFile empFileUpdate, Manager manager);

	/**
	 * 업데이트 프로필 수정하기
	 * 
	 * @param mgrfile
	 */
	public void updateProfileProc(MgrFile mgrfile);


	

	




	
	

	

	
	
}

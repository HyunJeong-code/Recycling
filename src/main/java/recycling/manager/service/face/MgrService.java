package recycling.manager.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.dto.manager.Notice;
import recycling.util.Paging;
<<<<<<< HEAD
=======
import recycling.util.PagingAndCtg;
>>>>>>> TEST


// 메인 페이지 관련 처리

public interface MgrService {
	
<<<<<<< HEAD
	/**
	 * 공지사항 전체 조회하기 + 페이징 시스템
	 * @param paging - 페이징 객체
	 * 
	 * @return - List<Notice>
	 */
	public List<Notice> selectAll();
=======
>>>>>>> TEST

	/**
	 * 공지사항 세부조회
	 * 
	 * @param notice - Notice
	 * @return
	 */
	public Notice selectDetail(String ntcCode);
<<<<<<< HEAD

	/**
	 * 페이징 계산 시스템
	 * 
	 * @param pagingParam - 페이징 객체
	 * @param search - 검색 
	 * @return
	 */
	public Paging selectCntAll(Paging pagingParam);
=======
>>>>>>> TEST
	
	/**
	 * 비밀번호 암호화, 핸드폰 번호, 이메일 합치기
	 * 
	 * @param manager - 관리자 회원가입 정보
	 * @param sPhone - 핸드폰 번호 시작
	 * @param inPhone - 핸드폰 번호 시작 직접 입력
	 * @param mPhone - 핸드폰 번호 중간
	 * @param lPhone - 핸드폰 번호 마지막
	 * @param mgrEmail2 - 이메일 주소
	 * @param inEmail - 이메일 주소 직접 입력
	 * @return - 관리자 정보
	 */
	public Manager mgrProc(Manager manager, String sPhone, String inPhone, String mPhone, String lPhone,
			String mgrEmail2, String inEmail);
	
	/**
	 * 회원 가입을 위해 인사 등록이 되어있는지 확인
	 * 
	 * @param manager - 관리자 회원가입 정보
	 * @return - 0 : 실패, 1 : 성공
	 */
	public int selectByManager(Manager manager);
	
	/**
	 * 회원 가입 정보 확인 후, 일치 시 아이디/비밀번호 업데이트
	 * @param manager - 관리자 회원가입 정보
	 * @return - 0 : 실패, 1 : 성공
	 */
	public int updateManager(Manager manager);
	
	/**
	 * 관리자 사원증 사진 파일 처리
	 * 
	 * @param mgrPic - 파일 정보
	 * @param manager - 관리자 정보
	 * @return 처리된 파일 정보
	 */
	public MgrFile saveFile(MultipartFile mgrProf, Manager manager);
	
	/**
	 * 프로필 사진 삽입
	 * @param mgrFile - 프로필 파일 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertMgrProf(MgrFile mgrFile);

<<<<<<< HEAD
	public ManagerLogin selectByIdPw(Manager manager);

	public List<Notice> selectAll(Paging paging);
	
=======
	/**
	 * 전체사원조회[empList]
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<ManagerJoinDe> selectAllempList(PagingAndCtg upPaging);
	
	/**
	 * 전체사원조회 페이징[empList]
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllempList(PagingAndCtg upPaging);
	
	/**
	 * 공지사항 관리자조회[noticeist]
	 * 
	 * @return  List<Notice>
	 */
	public List<Notice> selectAllNotice(PagingAndCtg upPaging);

	/**
	 * 공지사항 관리자조회 페이징[noticelist]
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllNotice(PagingAndCtg upPaging);

>>>>>>> TEST
}

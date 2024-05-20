package recycling.manager.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;

// 판매제휴팀 DB 처리

public interface SlsDao {
	
	/**
	 * 판매자 전환 요청 전체 목록
	 * 
	 * @return 판매자 리스트
	 */
	public List<Map<String, Object>> selectBysChk();
	
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

	/**
	 * 
	 * 게시판 번호 가져오기
	 * @param exp
	 * @return
	 */
	public String selectByExp(Exp exp);

	/**
	 * 
	 * 파일 업로드
	 * 
	 * @param expFile
	 */
	public void fileup(ExpFile expFile);

	/**
	 * 
	 * 체험 일정 업로드
	 * 
	 * @param expSch
	 */
	public void expschUp(ExpSch expSch);
	
	/**
	 * 판매자 코드로 구매자 코드 조회
	 * 
	 * @param sCode - 판매자 코드
	 * @return bCode - 구매자 코드
	 */
	public String selectBysCode(String sCode);
	
	/**
	 * 개인 판매자 상세 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 상세 정보
	 */
	public Map<String, Object> selectPriSeller(String bCode);
	
	/**
	 * 기업 판매자 상세 조회
	 * 
	 * @param bCode - 구매자 코드
	 * @return 상세 정보
	 */
	public Map<String, Object> selectCmpSeller(String bCode);
	
	/**
	 * 신고 받은 횟수
	 * 
	 * @param sCode - 판매자 코드
	 * @return 총 신고 횟수
	 */
	public int selectCntRpt(String sCode);
	
	/**
	 * 총 거래완료 건수
	 * 
	 * @param sCode - 판매자 코드
	 * @return 총 거래 건수
	 */
	public int selectCntOrd(String sCode);
}

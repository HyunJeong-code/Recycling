package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;

// 판매제휴팀 DB 처리

public interface SlsDao {
	/**
	 * 체험단 전체 조회하기
	 * 
	 * @return - List<Exp>
	 */
	public List<Exp> selectAll();
	
	/**
	 * 체험단 체험일정 조회하기
	 * @param expCode 
	 * 
	 * @return
	 */
	public List<ExpSch> selectSchAll(String expCode);

	/**
	 * 체험단 세부 조회하기
	 * 
	 * @param exp - DTO 객체
	 * @return
	 */
	public Exp selectDetail(Exp exp);

	/**
	 * 조회수 증감
	 * [관리자 - 미구현]
	 * @param exp - DTO 객체
	 */
//	public void hit(Exp exp);

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
	 * 체험정보 업데이트항목 조회
	 * 
	 * @param exp
	 * @return
	 */
	public Exp expUpdateView(Exp exp);

	/**
	 * 체험정보 업데이트
	 * 
	 * @param manager
	 */
	public void expUpdateProc(Exp exp);
	
	/**
	 * 
	 * 체험정보
	 * 
	 * @param expCode
	 * @return
	 */
	public Exp expResDetail();

	/**
	 * 
	 * 체험예약 정보
	 * 
	 * @param expCode
	 * @return
	 */
	public List<ExpRes> expResDetailRes();


	
	
}

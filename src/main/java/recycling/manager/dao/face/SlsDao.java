package recycling.manager.dao.face;

import java.util.List;

import recycling.dto.buyer.ExpRes;
import recycling.dto.manager.ResSchCnt;
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
	 * @param expCode - DTO 객체
	 * @return
	 */
	public Exp selectDetail(String expCode);

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
	 * 체험 예약페이지 정보 조회
	 * @param expCode 
	 * 
	 * @param expCode
	 * @return
	 */
	public Exp expResDetail(String expCode);

	/**
	 * 
	 * 체험 예약페이지 예약 조회
	 * 
	 * @param expCode
	 * @return
	 */
	public List<ExpRes> expResDetailRes(int schNo);

	/**
	 * 체험단 예약정보 리스트 삭제
	 * 
	 * @param expCode
	 */
	public int expListDel(String expCode);

	/**
	 * 이미지 업로드 번호조회
	 * 
	 * @param expFile
	 * @return
	 */
	public ExpFile image(ExpFile expFile);

	/**
	 * 예약 확정버튼에 따른 예약변경
	 * 
	 * @param chBox
	 */
	public int expResCnf(String resCode);

	/**
	 * 예약 취소버튼에 따른 예약변경
	 * 
	 * @param chBox
	 */
	public int expResCnl(String resCode);

	/**
	 * 체험 예약 조회
	 * 
	 * @param schNo - 체험 일정번호로 조회
	 * @return
	 */
	public ExpSch selectExpSchbySchNo(int schNo);

	/**
	 * 체험 예약, 인원 조인
	 * @param schNo 
	 * @param schNo 
	 * @param expCode 
	 * 
	 * @return
	 */
	public List<ResSchCnt> selectByResCnt(String expCode);

	/**
	 * 체험단 예약인원 예약변경창 조회하기
	 * @param resSchCnt 
	 * 
	 * @return
	 */
	public ResSchCnt changeExpRes(ResSchCnt resSchCnt);

	/**
	 * 체험단 예약인원 예약변경하기
	 * @param resSchCnt 
	 * 
	 * @return
	 */
	public void changeExpResProc(ResSchCnt resSchCnt);
	
	/**
	 * 인원 변경 
	 * 
	 * @param expSch
	 * @return
	 */
	public int cntChangeUpdate(ExpSch expSch);
	
	/**
	 * 예약인원 총합
	 * 
	 * @param expSch
	 * @return
	 */
	public int getTotalResCnt(ExpSch expSch);
	
	/**
	 * 예약자 체크삭제
	 * 
	 * @param chBox
	 */
	public int expResDetailListDel(String resCode);
	
	/**
	 * expdetail 체크삭제[클래스]
	 * 
	 * @param chBox
	 */
	public int expDetailListDel(String schNo);
}

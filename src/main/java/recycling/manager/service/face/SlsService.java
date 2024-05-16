package recycling.manager.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;


// 판매제휴팀 관련 처리

public interface SlsService {

	/**
	 * 체험단 조회하기
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
	 * 체험단 세부사항 조회
	 * 
	 * @param exp - Exp
	 * @return Exp
	 */
	public Exp selectDetail(Exp exp);

	/**
	 * 체험단 등록
	 * 
	 * @param exp
	 * @param expSch 
	 * @param file 
	 */
	public void insert(Exp exp, ExpSch expSch, MultipartFile file);
	
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
	 * 체험정보
	 * 
	 * @param expRes
	 * @return
	 */
	public Exp expResDetail(String expCode);
	
	/**
	 * 체험예약 정보
	 * 
	 * @param expCode
	 * @return
	 */
	public List<ExpRes> expResDetailRes(ExpRes expRes);

	/**
	 * 체험단 예약정보 리스트 삭제
	 * 
	 * @param chBox
	 */
	public int expListDel(List<String> chBox);


}

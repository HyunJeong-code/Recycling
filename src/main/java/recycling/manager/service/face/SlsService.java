package recycling.manager.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;


// 판매제휴팀 관련 처리

public interface SlsService {

	/**
	 * 체험단 전체 조회하기
	 * 
	 * @return - List<Exp>
	 */
	public List<Exp> selectAll();

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
}

package recycling.seller.service.face;

import java.util.List;

import recycling.dto.buyer.Qst;

// 판매자 문의 관련 처리

public interface QnaService {

	/**
	 * sCode가 판매중인 prd의 문의 조회
	 * 
	 * @param sCode - 조회할 sCode
	 * @return - sCode와 연관된 Qst 객체 리스트
	 */
	public List<Qst> selectBysCode(String sCode);

}

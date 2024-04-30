package recycling.buyer.service.face;

import recycling.dto.buyer.Buyer;

// 메인페이지, 로그인/회원가입

public interface BuyService {
	
	/**
	 * 로그인 처리
	 * 
	 * @param buyer - 아이디와 비밀번호 저장한 DTO
	 * @return Buyer : null일 경우 로그인 실패
	 */
	public Buyer selectByIdPw(Buyer buyer);

}

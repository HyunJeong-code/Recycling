package recycling.buyer.service.face;

import recycling.dto.buyer.Buyer;

// 메인페이지, 로그인/회원가입

public interface BuyService {

	public Buyer selectByIdPw(Buyer buyer);

}

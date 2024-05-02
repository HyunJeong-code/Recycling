package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;

// 마이페이지 - 회원 정보 관련

public interface BuyerService {

	public boolean selectByPwAndCt(String bPw, String bCtCode);

	public List<BuyerAdr> getBuyerAdr(String bCode);

	public void updateBuyerInfo(Buyer buyer, BuyerAdr buyerAdr);


	
	
	
}
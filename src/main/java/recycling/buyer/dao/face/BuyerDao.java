package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;

// 마이페이지 - 회원 정보 관련 DB 처리

public interface BuyerDao {

	public boolean selectByPwAndCt(String bPw, String bCtCode);

	public List<BuyerAdr> selectBuyerAdr(String bCode);

	public void updateBuyer(Buyer buyer);

	public void upadateBuyerAdr(BuyerAdr buyerAdr);

	
	
	
}
package recycling.seller.dao.face;

import java.util.List;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.AllPrd;
import recycling.dto.seller.Exp;
import recycling.util.Paging;

// 상품-판매 관련 DB

public interface SellingDao {

	public List<Exp> selectMyExpList(Paging paging);

	public int selectCntAll(String search);

	public int selectPageAll();

	public Exp selectByExp(String expCode);

	public List<ExpRes> selectResList(Paging paging);
	
	/**
	 * 모든 상품과 체험단을 조회
	 * 
	 * @param seller - 로그인한 판매자 정보
	 * @return 모든 상품에 대한 정보
	 */
//	public List<AllPrd> selectAllPrd(BuyerLogin seller);


}

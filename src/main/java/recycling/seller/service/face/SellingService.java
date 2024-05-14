package recycling.seller.service.face;

import java.util.List;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.AllPrd;
import recycling.dto.seller.Exp;
import recycling.util.Paging;

// 상품-판매 관련 처리

public interface SellingService {

	public List<Exp> selectMyExpList(Paging paging);

	public Paging getSearchPaging(int curPage, String search);

	public Paging getPaging(int curPage);

	public List<ExpRes> selectResList(Paging paging);

	public Exp selectByExp(String expCode);

	/**
	 * 모든 상품과 체험단을 조회
	 * 
	 * @param seller - 로그인한 판매자 정보
	 * @return 모든 상품에 대한 정보
	 */
//	public List<AllPrd> selectAllPrd(BuyerLogin seller);


}

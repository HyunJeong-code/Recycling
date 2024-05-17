package recycling.seller.service.face;

import java.util.List;

import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.util.Paging;

// 상품-판매 관련 처리

public interface SellingService {

	public List<Exp> selectMyExpList(Paging paging);

	public Paging getSearchPaging(int curPage, String search);

	public Paging getPaging(int curPage);

	public Exp selectByExp(String expCode);

//	public List<ExpRes> selectResList(String expCode, Paging paging);
	public List<ExpRes> selectResList(String expCode);
	/**
	 * sCode와 일치하는 모든 rcyPrd 조회
	 * 
	 * @param sCode - 조회할 sCode
	 * @return - 모든 rcyPrd 리스트
	 */
	public List<Prd> selectAllrcyPrd(String sCode);

	/**
	 * prdCode와 일치하는 모든 orders 조회
	 * 
	 * @param prdCode - 조회할 prdCode
	 * @return - 모든 orders 리스트
	 */
	public List<MyOrder> selectAllMyOrder(String prdCode);

	/**
	 * sCode와 일치하는 모든 upcyPrd 조회
	 * 
	 * @param sCode - 조회할 sCode
	 * @return - 모든 upcyPrd 리스트
	 */
	public List<Prd> selectAllupcyPrd(String sCode);


}

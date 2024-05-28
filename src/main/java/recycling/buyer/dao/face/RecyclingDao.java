package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerAns;
import recycling.dto.seller.SellerQST;

// 재활용품 관련 DB 처리

import recycling.dto.seller.Seller;

// 재활용품 관련 DB 처리
public interface RecyclingDao {

	/**
	 * 판매자 찾기
	 * 
	 * @param sCode
	 * @return
	 */
	public List<Seller> findSeller();
	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);

	public Seller selectSeller(String getsCode);

	public SellerQST selectSellerQST(String qstCode);

	public int insertSellerQST(SellerQST sellerQST);

	public int updateSellerQST(SellerQST sellerQST);

	public int deleteSellerQST(String qstCode);

	public List<SellerAns> selectSellerAnswers(String qstCode);

	public int insertSellerAnswer(SellerAns sellerAns);

	public int updateSellerAnswer(SellerAns sellerAns);

	public int deleteSellerAnswer(String qnaCode);

}

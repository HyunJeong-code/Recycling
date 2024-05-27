package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerAns;
import recycling.dto.seller.SellerProf;
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
<<<<<<< HEAD
	public List<Seller> findSeller();
=======
	List<Seller> findSeller();
	
>>>>>>> 6658305de9ba193b447276c42d2b25f3b0299231
	public List<Prd> selectPrdList();

	public Prd selectPrd(String prdCode);

	public SellerProf selectSellerProfByCode(String sCode);

	public SellerQST selectSellerQST(String qstCode);

	public int insertSellerQST(SellerQST sellerQST);

	public int updateSellerQST(SellerQST sellerQST);

	public int deleteSellerQST(String qstCode);

	public List<SellerAns> selectSellerAnswers(String qstCode);

	public int insertSellerAnswer(SellerAns sellerAns);

	public int updateSellerAnswer(SellerAns sellerAns);

	public int deleteSellerAnswer(String qnaCode);

}

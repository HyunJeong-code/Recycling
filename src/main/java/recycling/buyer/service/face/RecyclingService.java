package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Seller;
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerAns;
import recycling.dto.seller.SellerProf;
import recycling.dto.seller.SellerQST;

public interface RecyclingService {
	
	/**
	 * 판매자 찾기
	 * 
	 * @return
	 */
	public List<Seller> findSeller();
	
	/**
	 * 판매자 코드로 재활용품 조회
	 * 
	 * @param sCode
	 * @return
	 */
	public List<Prd> findRcyBySellerCode(String sCode);
	
	 /** 제품 DTO에서 리스트를 불러온다
	List<Seller> findSeller();
	
	/**
	 * 제품 DTO에서 리스트를 불러온다
	 * 
	 * @return
	 */
	public List<Prd> getPrdList();

	/**
	 * 제품번호를 기준으로 불러오면서 제품 정보를 불러온다
	 * 
	 * @param prdno 제품번호
	 * @return 제품번호의 상세페이지
	 */
	public Prd view(String prdCode);

	/**
	 * 판매자 상세 프로필을 가져오는 코드
	 * 
	 * @param	getsCode 프라이머리키인 sCode
	 * @return	판매자 상세 정보
	 */
	public Seller getSeller(String sCode);

	/**
	 * 판매자 문의 코드를 통해서 판매자 문의 불러오기
	 * 
	 * @param qstCode	문의 코드
	 * @return	판매자 문의
	 */
	public SellerQST selectSellerQst(String qstCode);

	/**
	 * 판매자 문의 작성
	 * 
	 * @param sellerQST 판매자 문의
	 * @return 
	 */
	public int insertSellerQST(SellerQST sellerQST);

	/**
	 * 판매자 문의 리스트를 조회
	 * @param qstCode 판매자 문의 코드
	 * @return	핀메매지 문의 리스트
	 */
	public List<SellerAns> selectSellerAnswers(String qstCode);
	
	/**
	 * 판매자 문의 수정
	 * 
	 * @param sellerQST 판매자 문의
	 * @return 
	 */
	public int updateSellerQST(SellerQST sellerQST);

	/**
	 * 판매자 문의 삭제
	 * 
	 * @param qstCode 문의 코드
	 * @return 
	 */
	public int deleteSellerQST(String qstCode);

	/** 
	 * 판매자 문의 답변 작성
	 * 
	 * @param sellerAns
	 * @return
	 */
	public int insertSellerAnswer(SellerAns sellerAns);

	/**
	 * 판매자 문의 답변 수정
	 * 
	 * @param sellerAns
	 * @return
	 */
	public int updateSellerAnswer(SellerAns sellerAns);

	
	/**
	 * 판매자 문의 답변 삭제
	 * 
	 * @param qnaCode
	 * @return
	 */
	public int deleteSellerAnswer(String qnaCode);

}

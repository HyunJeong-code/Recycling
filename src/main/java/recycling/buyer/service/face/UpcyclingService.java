package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Review;
import recycling.dto.seller.Prd;
<<<<<<< HEAD
import recycling.dto.seller.SellerProf;
=======
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

public interface UpcyclingService {

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
	 * 구매자 정보 로드
	 * 
	 * @param bCode 구매자 코드
	 * @return 구매자 정보
	 */
	public Buyer selectBuyerCode(int bCode);

	/**
	 * 리뷰 DTO 로드
<<<<<<< HEAD
	 * @param prdCode 
	 * 
	 * @return
	 */
	public List<Review> getUpcyvwList(String prdCode);
=======
	 * 
	 * @return
	 */
	public List<Review> getUpcyvwList();
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

	/**
	 * 리뷰 상세 조회
	 * @param rvwCode 리뷰번호
	 * @return 특정 리뷰번호 로드
	 */
	public Review selectReviewByCode(int rvwCode);

	/**
	 * 리뷰 작성
	 * 
	 * @param rvwContent 리뷰 내용
<<<<<<< HEAD
	 * @param prdCode 
	 * @param buyer 작성자 로그인 정보
	 */
	public void writeReview(String rvwContent, String prdCode, Buyer buyer);
=======
	 * @param buyer 작성자 로그인 정보
	 */
	public void writeReview(String rvwContent, Buyer buyer);
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

	
	/**
	 * 리뷰 업데이트 메소드
	 * 
	 * @param rvwCode 리뷰코드
	 * @param rvwContent 리뷰내용
	 */
	public void updateReview(int rvwCode, String rvwContent);

	/**
	 * 리뷰 삭제 메소드
	 * 
	 * @param rvwCode 리뷰코드
	 */
	public void deleteReview(int rvwCode);

<<<<<<< HEAD
	/**
	 * 판매자 상세 프로필을 가져오는 코드
	 * 
	 * @param	getsCode 프라이머리키인 sCode
	 * @return	판매자 상세 정보
	 */
	public SellerProf getSellerProf(String sCode);

=======
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e
}

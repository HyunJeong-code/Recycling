package recycling.buyer.service.face;

import java.util.List;

<<<<<<< HEAD
import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;
=======
import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.util.Paging;
>>>>>>> f19f9ceb93cb50d853ecf2cef33dca70a5aa799e

public interface RecyclingService {
	
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
	public SellerProf getSellerProf(String sCode);
	
	

	/**
	 * 상품리스트의 상품 전체 조회
	 * 
	 * @return 상품 DTO를 가진 List
	 */
	public List<Prd> getPrdList();

	
	/**
	 * 상품리스트 중 상품 번호를 통해 상품 상세 조회
	 * 
	 * @param prdno 상품번호
	 * @return 해당 상품번호의 상세페이지
	 */
	public Prd view(int prdno);

	
	/**
	 * 
	 * 
	 * @param curPage
	 * @return
	 */
	public Paging getDetailPaging(int curPage);

	/**
	 * 위치기반 판매자 위치 찾기
	 * 
	 * @param location
	 * @return
	 */
	public String findSeller(String location);

	/**
	 * 재활용품 문의 리스트 조회
	 * 
	 * @return
	 */
	public List<Rcy> gerRcyList();




}

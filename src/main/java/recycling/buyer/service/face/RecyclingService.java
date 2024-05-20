package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.buyer.Rcy;
import recycling.dto.seller.Prd;
import recycling.util.Paging;

public interface RecyclingService {

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

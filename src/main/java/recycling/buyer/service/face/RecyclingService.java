package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.seller.Prd;
import recycling.dto.seller.SellerProf;

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
	
	

}

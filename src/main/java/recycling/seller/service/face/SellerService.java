package recycling.seller.service.face;

import recycling.dto.seller.Seller;

// 판매자 정보 관련 처리

public interface SellerService {

	/**
	 * 판매자의 sCode를 사용하여 구매자의 bCode를 확인하고, 해당 구매자의 비밀번호를 가져옴
	 * @param pw
	 * @return
	 */
	public String getBuyerPwBySellerCode(String sCode);

	
	/**
	 * 판매자 정보 조회
	 * @param pw
	 * @return
	 */
	public Seller getSellerInfo(String pw);

	


}

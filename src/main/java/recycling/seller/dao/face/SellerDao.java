package recycling.seller.dao.face;

import recycling.dto.seller.Seller;

// 판매자 정보 관리 관련 DB

public interface SellerDao {

	public String getBuyerCodeBySellerCode(String sCode);

	public String getBuyerPasswordByBuyerCode(String bCode);

	public Seller getSellerInfoByPassword(String pw);

	
}

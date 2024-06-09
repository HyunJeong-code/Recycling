package recycling.seller.dao.face;

import recycling.dto.seller.Seller;

// 판매자 정보 관리 관련 DB

public interface SellerDao {

	/**
	 * 판매자의 sCode로 구매자의 bCode를 조회하여
	 * 해당 구매자의 비밀번호을 가져옴
	 * 
	 * @param sCode 판매자 코드
	 * @return
	 */
	public String getbCodeBysCode(String sCode);

	/**
	 * 구매자의 bCode로 비밀번호를 조회
	 *  
	 * @param bCode 구매자 코드
	 * @return
	 */
	public String selectSeller(String bCode);

	/**
	 * 비밀번호로 판매자 정보 조회
	 * 
	 * @param pw 입력 비밀번호
	 * @return
	 */
	public Seller getSellerInfoByPw(String pw);

	
	
	/**
	 * 비밀번호 변경 매서드
	 * 
	 * @param bPw 기존 비밀번호
	 * @param newPw 새 비밀번호
	 * @return
	 */
	public boolean updatePw(String bPw, String newPw);

	/**
	 * 비밀번호 변경 매서드
	 * 
	 * @param seller
	 * @return
	 */
	public String updateBank(Seller seller);

	public Seller selectSellerBybCode(String bCode);

	public void deletSeller(String bCode);



	
}

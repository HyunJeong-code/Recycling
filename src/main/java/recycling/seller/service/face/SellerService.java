package recycling.seller.service.face;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Cmp;
import recycling.dto.seller.Seller;

// 판매자 정보 관련 처리

public interface SellerService {

	/**
	 * 판매자의 sCode를 사용하여 구매자의 bCode를 확인하고, 해당 구매자의 비밀번호를 가져옴
	 * @param pw
	 * @return
	 */
	public String selectSeller(String sCode);

	
	/**
	 * 판매자 정보 조회
	 * @param pw
	 * @return
	 */
	public Seller getSellerInfo(String pw);


	/**
	 * 비밀번호 변경 메소드 불러오기
	 * 
	 * @param bPw 기존 비번
	 * @param newPw 새 비번
	 * @return
	 */
	public boolean updatePw(String bPw, String newPw);

	/**
	 * 계좌 변경 메소드 
	 * 
	 * @param seller
	 */
	public String updateBank(Seller seller);

	/**
	 * 판매자 정보 변경
	 * 
	 * @param seller
	 */
	public void updateSellerProf(Seller seller);


	/**
	 * 프로필 이미지 업로드 파일 구현 메소드
	 * 
	 * @param file
	 * @return
	 */
	public String uploadImage(MultipartFile file);

	


}

package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.BuyerLogin;

// 마이페이지 - 내 게시물 관련

public interface MypageService {

	/**
	 * 로그인한 구매자 문의글 전체 조회
	 * 
	 * @param buyerLogin - 구매자 정보
	 * @return 문의글 리스트
	 */
	public List<Map<String, Object>> selectQnaBybCode(BuyerLogin buyerLogin);
	
	/**
	 * 로그인한 구매자 후기글 전체 조회
	 * 
	 * @param buyerLogin - 구매자 정보
	 * @return 후기글 리스트
	 */
	public List<Map<String, Object>> selectRvwBybCode(BuyerLogin buyerLogin);

}

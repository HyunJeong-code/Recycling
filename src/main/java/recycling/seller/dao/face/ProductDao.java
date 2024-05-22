package recycling.seller.dao.face;

import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;

// 상품 등록 관련 DB

public interface ProductDao {
	
	/**
	 * 재활용품 상품 정보 삽입
	 * 
	 * @param prd - 상품 정보 DTO
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertRcy(Prd prd);
	
	/**
	 * 파일 정보 DB에 삽입
	 * 
	 * @param prdFile - 파일 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertPrdFile(PrdFile prdFile);
	
	/**
	 * 새활용 상품 정보 삽입
	 * 
	 * @param prd - 상품 정보 DTO
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertUpcy(Prd prd);

}

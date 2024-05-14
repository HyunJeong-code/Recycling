package recycling.seller.service.face;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;

// 상품 등록 관련 처리

public interface ProductService {

	/**
	 * 재활용품 상품 정보 삽입
	 * 
	 * @param prd - 상품 정보 DTO
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertRcy(Prd prd);
	
	/**
	 * 파일 저장
	 * 
	 * @param main - 저장할 파일
	 * @param prd - 상품 정보
	 * @return null : 실패, else : 성공
	 */
	public PrdFile saveFile(MultipartFile main, Prd prd);
	
	/**
	 * 파일 정보 DB에 삽입(썸네일)
	 * 
	 * @param prdFile - 파일 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertFileMain(PrdFile prdFile);
	
	/**
	 * 파일 정보 DB에 삽입(상품 상세)
	 * 
	 * @param prdFile - 파일 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertFileDetail(PrdFile prdDetail);
	
	/**
	 * 새활용 상품 정보 삽입
	 * 
	 * @param prd - 상품 정보 DTO
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertUpcy(Prd prd);

}

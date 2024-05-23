package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.manager.Wash;

public interface WashService {

	/**
	 * 세척업체 DTO 리스트 조회
	 * 
	 * @return
	 */
	public List<Wash> selectWashList();

	/**
	 * 세척업체 상세조회
	 * 
	 * @param wCode	세척업체 코드
	 * @return 세척업체 정보
	 */
	public Wash selectWash(String wCode);

}

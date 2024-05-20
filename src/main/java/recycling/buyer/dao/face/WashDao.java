package recycling.buyer.dao.face;

import java.util.List;

import recycling.dto.manager.Wash;

// 세척 업체 관련 DB 처리

public interface WashDao {

	public List<Wash> selectWashList();

	public Wash view(String wCode);

}

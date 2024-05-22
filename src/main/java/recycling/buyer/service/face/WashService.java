package recycling.buyer.service.face;

import java.util.List;

import recycling.dto.manager.Wash;

public interface WashService {

	public List<Wash> getWashList();

	public Wash view(String wCode);

}

package recycling.buyer.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.dao.face.MypageDao;
import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoFile;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MypageDao mypageDao;
	
	@Override
	public List<Map<String, Object>> selectQnaBybCode(PagingAndCtg paging) {
		return mypageDao.selectQnaBybCode(paging);
	}
	
	@Override
	public List<Map<String, Object>> selectRvwBybCode(PagingAndCtg paging) {
		return mypageDao.selectRvwBybCode(paging);
	}
	
	@Override
	public int selectCntQna(PagingAndCtg upPaging) {
		return mypageDao.selectCntQna(upPaging);

	}
	
	@Override
	public int selectCntRvw(PagingAndCtg unPaging) {
		return mypageDao.selectCntRvw(unPaging);
	}

	@Override
	public Oto getOtoDetail(String otoCode) {

		return mypageDao.getOtoDetail(otoCode);
	
	}

	@Override
	public List<OtoFile> getOtoFile(String otoCode) {
		
		return mypageDao.getOtoFile(otoCode);
		
	}
	
	@Override
	public int insertOto(Oto oto, MultipartFile file) {
		
		int result = mypageDao.insertOto(oto);
		
		if(result > 0 && file != null && !file.isEmpty()) {
			
			OtoFile otoFile = new OtoFile();
			String fileName = file.getOriginalFilename();
			String storedName = System.currentTimeMillis() + "_" + fileName;
			Path path = Paths.get("D:/uploads/", storedName);
			
			try {
				
				Files.createDirectories(path.getParent());
				file.transferTo(path.toFile());
				
				otoFile.setOtoCode(oto.getOtoCode());
				otoFile.setOriginName(fileName);
				otoFile.setStoredName(storedName);
				
				mypageDao.insertOtoFile(otoFile);
				
			} catch (IOException e) {
				
				e.printStackTrace();
				
				return 0;
				
			}
			
		}
		
		return result;
	
	}

	@Override
	public int deleteOto(String otoCode) {
		
		mypageDao.deleteOtoFile(otoCode);

		return mypageDao.deleteOto(otoCode);
	
	}
}
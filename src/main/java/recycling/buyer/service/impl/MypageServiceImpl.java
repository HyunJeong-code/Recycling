package recycling.buyer.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.dao.face.MypageDao;
import recycling.buyer.service.face.MypageService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class MypageServiceImpl implements MypageService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MypageDao mypageDao;
	@Autowired private ServletContext servletContext;
	
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
	public Oto getByOtoCode(String otoCode) {

		mypageDao.updateOtoHit(otoCode);
		
		return mypageDao.getByOtoCode(otoCode);
	
	}

	@Override
	public List<OtoCt> getAllOct() {

		List<OtoCt> oct = mypageDao.getAllOct();
		
		return oct;
	
	}
	
	@Override
	public List<OtoFile> getOtoFiles(String otoCode) {
		
		return mypageDao.getOtoFiles(otoCode);
		
	}

	@Override
	public Buyer getBuyerDetail(String bId) {
		
		return mypageDao.getBuyerDetail(bId);
	
	}

	@Override
	public int insertOto(Oto oto) {

		return mypageDao.insertOto(oto);
	
	}

	@Override
	public OtoFile saveFile(MultipartFile mult, Oto oto) {

		if(mult.getSize() <= 0) {
			
			logger.info("파일 없음");
			
			return null;
			
		}
		
		String storedPath = servletContext.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		String storedName = null;
		
		File dest = null;
		
		do {
			
			storedName = mult.getOriginalFilename();
			
			storedName += UUID.randomUUID().toString().split("-")[4];
			logger.info("storedName : {}", storedName);
			
			dest = new File(storedFolder, storedName);
			
		} while(dest.exists());
		
		try {
			mult.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		OtoFile otoFile = new OtoFile();
		
		otoFile.setOtoCode(oto.getOtoCode());
		otoFile.setOriginName(mult.getOriginalFilename());
		otoFile.setStoredName(storedName);
		
		return otoFile;
	
	}

	@Override
	public int insertOtoFiles(OtoFile otoFile) {

		return mypageDao.insertOtoFiles(otoFile);
	
	}
	
	@Override
	public int deleteOto(String otoCode) {

		return mypageDao.deleteOto(otoCode);
	
	}

}
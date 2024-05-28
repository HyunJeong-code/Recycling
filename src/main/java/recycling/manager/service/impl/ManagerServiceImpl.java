package recycling.manager.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.manager.dao.face.ManagerDao;
import recycling.manager.service.face.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ManagerDao managerDao;
	@Autowired private ServletContext servletContext;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	
	@Override
	public int selectByIdPw(String mgrId, String mgrPw) {
		logger.info("ManagerService.selectByIdPw");
		
		mgrPw = pwEncoder.encode(mgrPw);
		logger.info("id : {}, pw : {}", mgrId, mgrPw);
		
		return managerDao.selectByIdPw(mgrId, mgrPw);
	}
	
	@Override
	public int updatePw(ManagerLogin mgr) {
		return managerDao.updatePw(mgr);
	}
	
	@Override
	public MgrFile saveFile(MultipartFile mgrProf, Manager manager) {
		
		if(mgrProf.getSize() <= 0) {
			logger.info("파일 없음");
			
			return null;
		}
		
		String storedPath = servletContext.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		String storedName = null;
		
		File dest = null;
		
		do {
			storedName = mgrProf.getOriginalFilename(); // 원본 파일명
			
			storedName += UUID.randomUUID().toString().split("-")[4]; // UUID 추가
			logger.info("storedName : {}", storedName);
			
			dest = new File(storedFolder, storedName);			
		} while(dest.exists());
		
		try {
			mgrProf.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		MgrFile mgrFile = new MgrFile();
		mgrFile.setctMflNo(1000);
		mgrFile.setMgrCode(manager.getMgrCode());
		mgrFile.setOriginName(mgrProf.getOriginalFilename());
		mgrFile.setStoredName(storedName);
		
		return mgrFile;
	}
	
	@Override
	public int updateMgr(Manager manager) {
		return managerDao.updateMgr(manager);
	}
	
	@Override
	public int updateMgrProf(MgrFile mgrFile) {
		return managerDao.updateMgrProf(mgrFile);
	}
	
	@Override
	public Manager selectByMgr(ManagerLogin mgr) {
		return managerDao.selectByMgr(mgr);
	}
	
	@Override
	public MgrFile selectByMgrProf(ManagerLogin mgr) {
		return managerDao.selectByMgrProf(mgr);
	}
}

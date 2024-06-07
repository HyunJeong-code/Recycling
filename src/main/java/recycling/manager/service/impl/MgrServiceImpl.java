package recycling.manager.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.ManagerJoinDe;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.MgrFile;
import recycling.dto.manager.Notice;
import recycling.manager.dao.face.MgrDao;
import recycling.manager.service.face.MgrService;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class MgrServiceImpl implements MgrService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrDao mgrDao;
	@Autowired private ServletContext servletContext;
	@Autowired private BCryptPasswordEncoder pwEncoder;

	//공지사항 세부조회
	@Override
	public Notice selectDetail(String ntcCode) {

		//조회수 증감
		mgrDao.hit(ntcCode);
		
		//세부사항 조회
		return mgrDao.selectDetail(ntcCode);
	}
	
	@Override
	public Manager mgrProc(
			Manager manager, 
			String sPhone, String inPhone, String mPhone, String lPhone,
			String mgrEmail2, String inEmail) {
		
		// 비밀번호 암호화
		if(manager.getMgrPw() != null) {
			String enPw = pwEncoder.encode(manager.getMgrPw());
			manager.setMgrPw(enPw);			
		}
		
		// 핸드폰 번호 처리
		if(inPhone.equals("")) {
			manager.setMgrPhone(sPhone+"-"+mPhone+"-"+lPhone);
		} else {
			manager.setMgrPhone(inPhone+"-"+mPhone+"-"+lPhone);			
		}
		
		// 이메일 처리
		if(inEmail.equals("")) {
			manager.setMgrEmail(manager.getMgrEmail() + mgrEmail2);
		} else {
			manager.setMgrEmail(manager.getMgrEmail() + inEmail);			
		}
		
		return manager;
	}
	
	@Override
	public int selectByManager(Manager manager) {
		return mgrDao.selectByManager(manager);
	}
	
	@Override
	public int updateManager(Manager manager) {
		return mgrDao.updateManager(manager);
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
	public int insertMgrProf(MgrFile mgrFile) {
		return mgrDao.insertMgrProf(mgrFile);
	}

	//전체사원조회[empList]
	@Override
	public List<ManagerJoinDe> selectAllempList(PagingAndCtg upPaging) {
		return mgrDao.selectAllempList(upPaging);
	}
	

	//전체사원조회 페이징[empList]
	@Override
	public int selectCntAllempList(PagingAndCtg upPaging) {
		return mgrDao.selectCntAllempList(upPaging);
	}
	
	//공지사항 관리자조회
	@Override
	public List<Notice> selectAllNotice(PagingAndCtg upPaging) {
		//ctNtcNo = 2일경우 manager공지사항이므로 2번만 조회
		List<Notice> selectAllManager = mgrDao.selectAllNotice(upPaging);
		
		return selectAllManager;
	}

	//공지사항 관리자조회 페이징
	@Override
	public int selectCntAllNotice(PagingAndCtg upPaging) {
		return mgrDao.selectCntAllNotice(upPaging);
	}

	
}

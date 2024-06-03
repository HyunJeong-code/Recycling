package recycling.manager.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.manager.Manager;
import recycling.dto.manager.MgrFile;
import recycling.manager.dao.face.HrDao;
import recycling.manager.service.face.HrService;
import recycling.util.Paging;

@Service
@Transactional
public class HrServiceImpl implements HrService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired private ServletContext servletContext;
	@Autowired private HrDao hrDao;
	
	//페이징 처리
	@Override
	public Paging getPaging(int curPage) {
		
		//전체 페이지수 카운팅
		int totalCount = hrDao.getPaging();
		
		//전체 페이지, 현재 페이지 담기
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	
	//전체 사원조회
	@Override
	public List<Manager> selectAll() {
		logger.info("service: select");
		
	    return hrDao.selectAll();
	}

	//사원정보 상세조회
	@Override
	public Manager selectDetail(Manager manager) {
		logger.info("service: selectDetail");
		
		return hrDao.selectDetail(manager);
	}

	//세부사항 파일 조회하기
	@Override
	public MgrFile mgrFileList(MgrFile mgrFile) {
		logger.info("service: mgrFileList");
		
		return hrDao.mgrFileList(mgrFile);
	}
	
	//파일 다운로드
	@Override
	public MgrFile FileDown(MgrFile mgrFile) {
		logger.info("service: FileDown");
		
		return hrDao.FileDown(mgrFile);
	}
	
	//사원정보 등록
	@Override
	public void insert(Manager manager, MultipartFile file) {
		logger.info("service: insert");
		
		//사원 정보 등록
		hrDao.insert(manager);
		
		//expCode에 exp_code만 가져오기
		String mgrCode = manager.getMgrCode();

		if( file.getSize() <= 0 ) {
			logger.info("파일의 크기가 0, 처리 중단!");
			
			//파일 처리 메소드 filesave() 중단
			return;
		}
			
		//파일이 저장될 경로 - RealPath
		String storedPath = servletContext.getRealPath("upload");
				
		//upload폴더가 존재하지 않으면 생성하기
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
				
		//업로드된 파일이 저장될 이름
		String storedName = null;
		
		//저장될 파일 객체
		File dest = null;
		
		//저장될 파일명이 중복되지 않도록 반복
		do {
			storedName = file.getOriginalFilename(); //원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[4]; //UUID추가
			
			dest = new File( storedFolder, storedName );
		} while( dest.exists() );
		//----------------------------------------------------------------
			
		try {
			//업로드된 임시 파일을 upload 폴더로 옮기기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		//----------------------------------------------------------------
			
		//DB에 기록하기
		MgrFile mgrFile = new MgrFile();
		
		mgrFile.setOriginName( file.getOriginalFilename() );
		mgrFile.setStoredName( storedName );
		
		// 파일업로드 체험코드 가져오기
		mgrFile.setMgrCode(mgrCode);
		
		//document 데이터 1010
		mgrFile.setctMflNo(1010);
		
		//파일 업로드
		hrDao.fileup(mgrFile);
	
	}
	
	//수정항목 조회
	@Override
	public Manager hrUpdateView(Manager manager) {
		return hrDao.hrUpdateView(manager);
	}

	//수정하기
	@Override
	public void hrUpdate(Manager manager) {

		hrDao.hrUpdate(manager);
		
	}

	//사원정보 리스트 삭제
	@Override
	public int listDel(List<String> chBox) {
		logger.info("service: listDel");
		int result = 0;
		
		for(int i = 0; i < chBox.size(); i++) {
			String mgrCode = chBox.get(i);
			logger.info("{}", mgrCode);
			
			result += hrDao.listDel(mgrCode);
		}
		
		return result;
		
	}
	//업데이트창 파일조회
	@Override
	public MgrFile mgrFileUpdateList(MgrFile mgrFile) {
		return hrDao.mgrFileUpdateList(mgrFile);
	}

	//업데이트창 파일가져오기
	@Override
	public MgrFile updateProFileGet(MultipartFile empFileUpdate, Manager manager) {
		if(empFileUpdate.getSize() <= 0) {
			logger.info("파일 없음");
			
			return null;
		}
		
		
		String mgrCode = manager.getMgrCode();

		String storedPath = servletContext.getRealPath("upload");
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		String storedName = null;
		File destProfile = null;
		
		//저장될 파일명이 중복되지 않도록 반복
		do {
			storedName = empFileUpdate.getOriginalFilename(); //원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[4]; //UUID추가
			
			destProfile = new File( storedFolder, storedName );
		} while( destProfile.exists() );
		try {
			//업로드된 임시 파일을 upload 폴더로 옮기기
			empFileUpdate.transferTo(destProfile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	    //프로필 DB에 저장
        MgrFile profileFile = new MgrFile();
        profileFile.setMgrCode(mgrCode);
        profileFile.setctMflNo(1000); // document 데이터 1000
        profileFile.setOriginName(empFileUpdate.getOriginalFilename());
        profileFile.setStoredName(storedName);
		
        return profileFile;

	}

	//업데이트창 파일 변경하기
	@Override
	public void updateProfileProc(MgrFile mgrFile) {
		hrDao.updateProfileProc(mgrFile);
	}


	



	
	
}

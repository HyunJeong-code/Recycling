package recycling.buyer.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.dao.face.HelpDao;
import recycling.buyer.service.face.HelpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

@Service
public class HelpServiceImpl implements HelpService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private HelpDao helpDao;
	@Autowired private ServletContext servletContext;
	
	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = helpDao.selectPageAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Faq> selectAllFaq(Paging paging) {
		
		return helpDao.selectAllFaq(paging);
	}

	@Override
	public List<FaqCt> selectAllCtFaq(Paging paging) {
		return helpDao.selectAllCtFaq(paging);
	}

	@Override
	public List<Notice> selectNoticeSeller() {
		List<Notice> sellerNotices = helpDao.selectByCategory(1);
		
		return sellerNotices;
	}

	@Override
	public List<Notice> selectNoticeBuyer() {
		List<Notice> buyerNotices = helpDao.selectByCategory(0);
		
		return buyerNotices;
	}

	@Override
	public Notice selectByNotice(String ntcCode) {
		helpDao.updateNtcHit(ntcCode);
		
		return helpDao.selectByNotice(ntcCode);
	}

	@Override
	public int insertOto(Oto oto) {
		
		return helpDao.insertOto(oto);
	}
	
//	@Override
//	public void insertOto(Oto oto) {
//
//		helpDao.insertOto(oto);
//	}

	@Override
	public List<OtoCt> selectAllOtoCt() {
		return helpDao.selectAllOtoCt();
	}

	@Override
	public List<Oto> selectAllOto() {
		
		return helpDao.selectAllOto();
	}

	@Override
	public List<Oto> selectByCtOto(String string) {
		return helpDao.selectByCtOto(string);
	}

	@Override
	public List<OtoCt> getAllOct() {
		List<OtoCt> oct = helpDao.getAllOct();
		
		return oct;
	}

	@Override
	public Oto selectByOtoCode(String otoCode) {
		helpDao.updateOtoHit(otoCode);
		
		return helpDao.selectByOtoCode(otoCode);
	}

	@Override
	public Buyer getBuyerDetail(String bId) {
		return helpDao.selectBuyerBybId(bId);
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
			storedName = mult.getOriginalFilename(); // 원본 파일명
			
			storedName += UUID.randomUUID().toString().split("-")[4]; // UUID 추가
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
		
		return helpDao.insertOtoFiles(otoFile);
	}

	@Override
	public List<OtoFile> getOtoFiles(String otoCode) {
		
		return helpDao.getOtoFiles(otoCode);
	}


}

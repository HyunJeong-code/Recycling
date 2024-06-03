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

import recycling.buyer.dao.face.HelpDao;
import recycling.buyer.service.face.HelpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class HelpServiceImpl implements HelpService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private HelpDao helpDao;
	@Autowired private ServletContext servletContext;
	

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
	
	@Override
	public List<OtoCt> selectAllOtoCt() {
		return helpDao.selectAllOtoCt();
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
		
		//파일 경로 변경 필요(현재 해당 컴퓨터에서 올린 게시글의 사진만 업로드 됨)
		// 다른 컴퓨터에서 게시글 조회 시 이미지 not found
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

	@Override
	public boolean chkSeller(String bCode) {
		
		return helpDao.chkSeller(bCode) > 0;
	}

	@Override
	public int selectCntAllOtoList(PagingAndCtg upPaging) {
		
		return helpDao.selectCntAllOtoList(upPaging);
	}

	@Override
    public List<Map<String, Object>> selectAllOto(PagingAndCtg upPaging) {
        return helpDao.selectAllOto(upPaging);
    }


	@Override
	public List<Map<String, Object>> selectByCtOto(Map<String, Object> params) {
		return helpDao.selectByCtOto(params);
	}

	@Override
	public Ans selectAnsByOtoCode(String otoCode) {
		return helpDao.selectAnsByOtoCode(otoCode);
	}

	@Override
	public int selectCntAllFaq(PagingAndCtg upPaging) {
		return helpDao.selectCntAllFaq(upPaging);
	}

	@Override
	public List<Faq> selectAllFaq(PagingAndCtg upPaging) {
		return helpDao.selectAllFaq(upPaging);
	}

	@Override
	public List<FaqCt> selectAllCtFaq(PagingAndCtg upPaging) {
		return helpDao.selectAllCtFaq(upPaging);
	}





}

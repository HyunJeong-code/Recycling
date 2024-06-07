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

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Manager;
import recycling.dto.manager.MgrFile;
import recycling.manager.dao.face.CsDao;
import recycling.manager.service.face.CsService;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class CsServiceImpl implements CsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CsDao csDao;
	
	@Autowired 
	private ServletContext servletContext;

	@Override
	public List<Oto> list(PagingAndCtg upPaging) {
//		logger.info("service");
		return csDao.list(upPaging);
	}
	
	@Override
	public int selectCntAllotoList(PagingAndCtg upPaging) {
		return csDao.selectCntAllotoList(upPaging);
	}

	@Override
	public int selectCntAllbuyerList(PagingAndCtg upPaging) {
		return csDao.selectCntAllbuyerList(upPaging);
	}

	@Override
	public List<Buyer> buyerList(PagingAndCtg upPaging) {
		return csDao.buyerList(upPaging);
	}

	@Override
	public Buyer buyerDetail(Buyer buyer) {
		return csDao.buyerDetail(buyer);
	}
	
	@Override
	public BuyerAdr buyerAdrDetail(BuyerAdr buyerAdr) {
		return csDao.buyerAdrDetail(buyerAdr);
	}
	
	@Override
	public BuyerProf buyerProfDetail(BuyerProf buyerProf) {
		return csDao.buyerProfDetail(buyerProf);
	}

	@Override
	public BuyerRank buyerRankDetail(BuyerRank buyerRank) {
		return csDao.buyerRankDetail(buyerRank);
	}
	
//	@Override
//	public Buyer getBuyer(String bCode) {
//		return csDao.getBuyer(bCode);
//	}
//
//	@Override
//	public void buyerUpdate(Buyer buyer) {
//		csDao.buyerUpdate(buyer);
//	}

	@Override
	public void buyerDel(Buyer buyer) {
		int res = csDao.buyerDel(buyer);				
	}

	@Override
	public Oto ansForm(String otoCode) {
		return csDao.ansForm(otoCode);
	}

	@Override
	public void ansFormInsert(String mgrCode, String ansCode, String ansContent, String otoCode) {
	    Ans ans = new Ans();
	    ans.setMgrCode(mgrCode);
	    ans.setAnsCode(ansCode);
	    ans.setAnsContent(ansContent);
	    ans.setOtoCode(otoCode);

	    csDao.ansFormInsert(ans);
	}
	
	@Override
	public void otoDelAns(String otoCode) {
		csDao.otoDelAns(otoCode);
	}
	
	@Override
	public void otoDelOtoFile(String otoCode) {
		csDao.otoDelOtoFile(otoCode);
	}


	@Override
	public void otoDelOto(String otoCode) {
	    csDao.otoDelOto(otoCode);
	}
	
	
	@Override
	public List<Ans> viewCom(String otoCode) {
//		logger.info("servocedddddddddddddddddddddd");
		return csDao.viewCom(otoCode);
	}

	@Override
	public boolean chkNull (List<Ans> comments) {
		if(comments == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public List<OtoFile> getOtoFiles(String otoCode) {
		return csDao.getOtoFiles(otoCode);
	}

	@Override
	public BuyerProf buyerFileUpdate(BuyerProf buyerProf) {
		return csDao.buyerFileUpdate(buyerProf);
	}

	@Override
	public Buyer csUpdateView(Buyer buyer) {
		return csDao.csUpdateView(buyer);
	}

	@Override
	public void csUpdate(Buyer buyer) {
		csDao.csUpdate(buyer);
	}

	@Override
	public BuyerProf updateProFileGet(MultipartFile buyerFileUpdate, Buyer buyer) {
		
		String bCode = buyer.getbCode();

		String storedPath = servletContext.getRealPath("upload");
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		String profileStoredName = null;
		File destProfile = null;
		
		//저장될 파일명이 중복되지 않도록 반복
		do {
			profileStoredName = buyerFileUpdate.getOriginalFilename(); //원본 파일명
			profileStoredName += UUID.randomUUID().toString().split("-")[4]; //UUID추가
			
			destProfile = new File( storedFolder, profileStoredName );
		} while( destProfile.exists() );
		try {
			//업로드된 임시 파일을 upload 폴더로 옮기기
			buyerFileUpdate.transferTo(destProfile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	    //프로필 DB에 저장
		BuyerProf buyerProfdetail = new BuyerProf();
		buyerProfdetail.setOriginName(buyerFileUpdate.getOriginalFilename());
		buyerProfdetail.setStoredName(profileStoredName);
		buyerProfdetail.setbCode(bCode);
		
        return buyerProfdetail;
	}

	@Override
	public void updateProfileProc(BuyerProf buyerProf) {
		csDao.updateProfileProc(buyerProf);
	}

	@Override
	public Buyer getBuyer1(String bCode) {
		return csDao.getBuyer1(bCode);
	}

	@Override
	public BuyerAdr buyerAdrUpdate(BuyerAdr buyerAdr) {
		return csDao.buyerAdrUpdate(buyerAdr);
	}

	@Override
	public void csUpdateAdr(BuyerAdr buyerAdr) {
		csDao.csUpdateAdr(buyerAdr);
	}

}

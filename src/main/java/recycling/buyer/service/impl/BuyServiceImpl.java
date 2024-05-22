package recycling.buyer.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.dao.face.BuyDao;
import recycling.buyer.service.face.BuyService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.CmpFile;
import recycling.dto.manager.MgrFile;

@Service
public class BuyServiceImpl implements BuyService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyDao buyDao;
	@Autowired private ServletContext servletContext;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	
	
	@Override
	public Buyer buyerProc(Buyer buyer, String sPhone, String inPhone, String mPhone, String lPhone, String bEmail2,
			String inEmail) {	
		// 비밀번호 암호화
		String enPw = pwEncoder.encode(buyer.getbPw());
		buyer.setbPw(enPw);
		
		// 핸드폰 번호 처리
		if(inPhone.equals("")) {
			buyer.setbPhone(sPhone+mPhone+lPhone);
		} else {
			buyer.setbPhone(inPhone+mPhone+lPhone);
		}
		
		// 이메일 처리
		if(inEmail.equals("")) {
			buyer.setbEmail(buyer.getbEmail() + bEmail2);
		} else {
			buyer.setbEmail(buyer.getbEmail() + inEmail);
		}
		
		// 광고 수신 여부
		if(buyer.getAdEmail() == null) {
			buyer.setAdEmail("N");
		}
		
		if(buyer.getAdSms() == null) {
			buyer.setAdSms("N");
		}
		return buyer;
	}
	
	@Override
	public int insertBuyer(Buyer buyer) {
		return buyDao.insertBuyer(buyer);
	}
	
	@Override
	public BuyerProf fileSave(Buyer buyer, MultipartFile buyerProf) {
		if(buyerProf.getSize() <= 0) {
			logger.info("파일 없음");
			
			return null;
		}
		
		String storedPath = servletContext.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		String storedName = null;
		
		File dest = null;
		
		do {
			storedName = buyerProf.getOriginalFilename(); // 원본 파일명
			
			storedName += UUID.randomUUID().toString().split("-")[4]; // UUID 추가
			logger.info("storedName : {}", storedName);
			
			dest = new File(storedFolder, storedName);			
		} while(dest.exists());
		
		try {
			buyerProf.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		BuyerProf prof = new BuyerProf();
		prof.setbCode(buyer.getbCode());
		prof.setOriginName(buyerProf.getOriginalFilename());
		prof.setStoredName(storedName);
		
		return prof;
	}
	
	@Override
	public int insertProf(BuyerProf prof) {
		return buyDao.insertProf(prof);
	}
	
	@Override
	public BuyerAdr AdrProc(Buyer buyer, BuyerAdr buyerAdr) {
		buyerAdr.setbCode(buyer.getbCode());
		buyerAdr.setAdrName(buyer.getbName());
		buyerAdr.setAdrPhone(buyer.getbPhone());
		return buyerAdr;
	}
	
	@Override
	public int insertAdr(BuyerAdr buyerAdr) {
		return buyDao.insertAdr(buyerAdr);
	}
	
	@Override
	public Cmp cmpProc(Buyer buyer, Cmp cmp) {
		cmp.setbCode(buyer.getbCode());
		return cmp;
	}
	
	@Override
	public int insertCmp(Cmp cmp) {
		return buyDao.insertCmp(cmp);
	}
	
	@Override
	public CmpFile cmpFileSave(Cmp cmp, MultipartFile cmpFile) {
		if(cmpFile.getSize() <= 0) {
			logger.info("파일 없음");
			
			return null;
		}
		
		String storedPath = servletContext.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		String storedName = null;
		
		File dest = null;
		
		do {
			storedName = cmpFile.getOriginalFilename(); // 원본 파일명
			
			storedName += UUID.randomUUID().toString().split("-")[4]; // UUID 추가
			logger.info("storedName : {}", storedName);
			
			dest = new File(storedFolder, storedName);			
		} while(dest.exists());
		
		try {
			cmpFile.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		CmpFile file = new CmpFile();
		file.setCmpNo(cmp.getCmpNo());
		file.setOriginName(cmpFile.getOriginalFilename());
		file.setStoredName(storedName);
		
		return file;
	}
	
	@Override
	public int insertCmpFile(CmpFile file) {
		return buyDao.insertCmpFile(file);
	}
	
	@Override
	public BuyerLogin chkAuth(BuyerLogin buyerLogin) {
		logger.info("buyService.chkAuth()");
		
		Collection<SimpleGrantedAuthority> auth = new ArrayList<SimpleGrantedAuthority>();
		if (buyerLogin.getbOut().equals("N") && buyerLogin.getsCode() == null) {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
			auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));			
		} else if(buyerLogin.getbOut().equals("N") && buyerLogin.getsChk().equals("Y") && buyerLogin.getsOut().equals("N")) {
			auth.add(new SimpleGrantedAuthority("ROLE_SELLER"));
			auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));			
		} else if (buyerLogin.getbOut().equals("Y") && buyerLogin.getsChk().equals("Y") && buyerLogin.getsOut().equals("N")) {
			auth.add(new SimpleGrantedAuthority("ROLE_SELLER"));
		} else if (buyerLogin.getbOut().equals("N") && buyerLogin.getsChk().equals("N") && buyerLogin.getsOut().equals("N")) {
			auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));			
		}
		
		buyerLogin.setAuth(auth);
		
		return buyerLogin;
	}
	
	// 로그인 처리(임시)
	@Override
	public BuyerLogin selectBybIdbPw(Buyer buyer) {
		return buyDao.selectBybIdbPw(buyer);
	}
	
	// 아이디 찾기
	@Override
	public String selectByBuyerId(Buyer buyer) {
		return buyDao.selectByBuyerId(buyer);
	}
	
	// 비밀번호 찾기
	@Override
	public Buyer selectByBuyerPw(Buyer buyer) {
		return buyDao.selectByBuyerPw(buyer);
	}
	
	@Override
	public int updatePw(Buyer buyer) {
		return buyDao.updatePw(buyer);
	}
	
	@Override
	public List<Map<String, Object>> selectNtc() {
		return buyDao.selectNtc();
	}
}
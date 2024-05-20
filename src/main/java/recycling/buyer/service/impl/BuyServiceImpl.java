package recycling.buyer.service.impl;

import java.util.ArrayList;
import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.BuyDao;
import recycling.buyer.service.face.BuyService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;

@Service
public class BuyServiceImpl implements BuyService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyDao buyDao;
//	@Autowired private BCryptPasswordEncoder pwEncoder;
	
	@Override
	public Buyer buyerProc(Buyer buyer, String bEmail2, String mPhone, String lPhone) {
		// 비밀번호 암호화
//		String enPw = pwEncoder.encode(buyer.getbPw());
//		buyer.setbPw(enPw);
		
		// 이메일
		buyer.setbEmail(buyer.getbEmail() + bEmail2);
		
		// 핸드폰 번호
		buyer.setbPhone(buyer.getbPhone() + mPhone + lPhone);
		
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
}
package recycling.buyer.service.impl;

import java.util.ArrayList;
import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.BuyDao;
import recycling.dto.buyer.BuyerLogin;

@Service
@Transactional
public class BuyLoginServiceImpl implements UserDetailsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private BuyDao buyDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("LoginService.loadUserByUsername()");
		
		logger.info("username : {}", username);
		
		BuyerLogin buyerLogin = buyDao.selectById(username);
		
		if(buyerLogin == null) {
			logger.info("login Fail");
			throw new UsernameNotFoundException("Not Found Id");
		}
		
		buyerLogin = chkAuth(buyerLogin);
		logger.info("{}", buyerLogin);
		
		return buyerLogin;
	}

	public BuyerLogin chkAuth(BuyerLogin buyerLogin) {
		logger.info("LoginService.chkAuth()");
		
		Collection<SimpleGrantedAuthority> auth = null;
		auth = new ArrayList<SimpleGrantedAuthority>();
		
		if(buyerLogin.getbOut().equals("N")) {
			// 구매자 미탈퇴
			
			if(buyerLogin.getsCode() == null) {
				auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));
				
			} else if(buyerLogin.getsChk().equals("Y")) {
				
				if(buyerLogin.getsOut().equals("N")) {
					// 판매자 미탈퇴
					auth.add(new SimpleGrantedAuthority("ROLE_SELLER"));
					auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));
				} else {
					// 판매자 탈퇴
					auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));
				}
				
			} else {
				// 판매자 신청 거절
				auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));
			}
		} else {
			// 구매자 탈퇴
			auth = new ArrayList<SimpleGrantedAuthority>();
			auth.add(new SimpleGrantedAuthority(null));
		}
		
		buyerLogin.setAuth(auth);
		
		return buyerLogin;
	}
}
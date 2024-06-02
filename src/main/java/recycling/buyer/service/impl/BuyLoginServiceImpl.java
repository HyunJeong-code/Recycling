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
		if (buyerLogin.getbOut().equals("N") && buyerLogin.getsCode() == null) {
			auth = new ArrayList<SimpleGrantedAuthority>();
			auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));			
		} else if(buyerLogin.getbOut().equals("N") && buyerLogin.getsChk().equals("Y") && buyerLogin.getsOut().equals("N")) {
			auth = new ArrayList<SimpleGrantedAuthority>();
			auth.add(new SimpleGrantedAuthority("ROLE_SELLER"));
			auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));			
		} else if (buyerLogin.getbOut().equals("Y") && buyerLogin.getsChk().equals("Y") && buyerLogin.getsOut().equals("N")) {
			auth = new ArrayList<SimpleGrantedAuthority>();
			auth.add(new SimpleGrantedAuthority("ROLE_SELLER"));
		} else if (buyerLogin.getbOut().equals("N") && buyerLogin.getsChk().equals("N") && buyerLogin.getsOut().equals("N")) {
			auth = new ArrayList<SimpleGrantedAuthority>();
			auth.add(new SimpleGrantedAuthority("ROLE_BUYER"));			
		}
		
		buyerLogin.setAuth(auth);
		
		return buyerLogin;
	}
}
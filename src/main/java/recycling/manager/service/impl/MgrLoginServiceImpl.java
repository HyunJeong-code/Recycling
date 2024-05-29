package recycling.manager.service.impl;

import java.util.ArrayList;
import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import recycling.buyer.dao.face.BuyDao;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.manager.ManagerLogin;
import recycling.manager.dao.face.MgrDao;

@Service
@Transactional
public class MgrLoginServiceImpl implements UserDetailsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrDao mgrDao;
//	@Autowired private BCryptPasswordEncoder pwEncoder;
	
	public ManagerLogin chkAuth(ManagerLogin mgrLogin) {
		logger.info("LoginService.chkAuth()");
		
		Collection<SimpleGrantedAuthority> auth = null;
		if(mgrLogin.getMgrOut().equals("N")) {
			auth = new ArrayList<SimpleGrantedAuthority>();
			auth.add(new SimpleGrantedAuthority("ROLE_MANAGER"));
		}
		
		mgrLogin.setAuth(auth);
		
		return mgrLogin;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("LoginService.loadUserByUsername()");
		
		ManagerLogin mgrLogin = mgrDao.selectById(username);		

		if(mgrLogin == null) {
			logger.info("login Fail");
			throw new UsernameNotFoundException("Not Found Id");
		}
		
		mgrLogin = chkAuth(mgrLogin);
		logger.info("{}", mgrLogin);
		
		return mgrLogin;
	}
}

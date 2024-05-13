package recycling.manager.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import recycling.manager.dao.face.MgrDao;
import recycling.manager.service.face.MgrService;

@Service
public class MgrServiceImpl implements MgrService, UserDetailsService{
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private MgrDao mgrDao;

	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("mgrService.loadUserByUsername()");
		
		return null;
	}
}

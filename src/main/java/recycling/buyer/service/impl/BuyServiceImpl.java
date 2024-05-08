package recycling.buyer.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import recycling.buyer.dao.face.BuyDao;
import recycling.buyer.service.face.BuyService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;

@Service
public class BuyServiceImpl implements BuyService, UserDetailsService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BuyDao buyDao;
	
	@Override
	public Buyer selectByIdPw(Buyer buyer) {
		return buyDao.selectByIdPW(buyer);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		BuyerLogin buyerLogin = buyDao.selectById(username);
		return null;
	}
}

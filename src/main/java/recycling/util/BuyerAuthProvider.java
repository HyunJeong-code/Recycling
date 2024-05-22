package recycling.util;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class BuyerAuthProvider extends DaoAuthenticationProvider {
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		return super.authenticate(authentication);
	}
}

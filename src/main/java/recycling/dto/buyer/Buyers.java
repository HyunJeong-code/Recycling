package recycling.dto.buyer;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Buyers implements UserDetails {

	private static final long serialVersionUID = 1L;
	private BuyerLogin buyerLogin;
	
	public Buyers() {}
	
	public Buyers(BuyerLogin buyerLogin) {
		this.buyerLogin = buyerLogin;
	}

	@Override
	public String toString() {
		return "Buyers [buyerLogin=" + buyerLogin + "]";
	}

	public BuyerLogin getBuyerLogin() {
		return buyerLogin;
	}

	public void setBuyerLogin(BuyerLogin buyerLogin) {
		this.buyerLogin = buyerLogin;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return buyerLogin.getAuth();
	}
	
	@Override
	public String getUsername() {
		return buyerLogin.getbId();
	}
	
	@Override
	public String getPassword() {
		return buyerLogin.getbPw();
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
}

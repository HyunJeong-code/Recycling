package recycling.dto.buyer;

import java.util.List;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class Buyers extends User {

	private static final long serialVersionUID = 1L;
	
	private BuyerTest buyer;

	public Buyers(BuyerTest buyer) {
		super(buyer.getbId(), buyer.getbPw(), List.of(new SimpleGrantedAuthority(buyer.getRole())));
		this.buyer = buyer;
	}

	@Override
	public String toString() {
		return "Buyers [buyer=" + buyer + "]";
	}

	public BuyerTest getBuyer() {
		return buyer;
	}

	public void setBuyer(BuyerTest buyer) {
		this.buyer = buyer;
	}
}

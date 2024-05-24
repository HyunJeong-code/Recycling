package recycling.dto.buyer;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;

// Buyer의 로그인 정보 저장
public class BuyerLogin implements UserDetails {
	
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	
	private String bCode;
	private String bCtCode;
	private String bId;
	private String bPw;
	private String bOut; // Buyer 탈퇴 여부
	private String sCode;
	private String sChk; // Seller 여부
	private String sOut; // Seller 탈퇴 여부
	private Collection<? extends GrantedAuthority> auth; // 권한
	
	public BuyerLogin() {}

	public BuyerLogin(String bCode, String bCtCode, String bId, String bPw, String bOut, String sCode, String sChk, String sOut) {
		this.bCode = bCode;
		this.bCtCode = bCtCode;
		this.bId = bId;
		this.bPw = bPw;
		this.bOut = bOut;
		this.sCode = sCode;
		this.sChk = sChk;
		this.sOut = sOut;
	}

	public BuyerLogin(String bCode, String bCtCode, String bId, String bPw, String bOut, String sCode, String sChk,
			String sOut, Collection<? extends GrantedAuthority> auth) {
		this.bCode = bCode;
		this.bCtCode = bCtCode;
		this.bId = bId;
		this.bPw = bPw;
		this.bOut = bOut;
		this.sCode = sCode;
		this.sChk = sChk;
		this.sOut = sOut;
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "BuyerLogin [bCode=" + bCode + ", bCtCode=" + bCtCode + ", bId=" + bId + ", bPw=" + bPw + ", bOut="
				+ bOut + ", sCode=" + sCode + ", sChk=" + sChk + ", sOut=" + sOut + ", auth=" + auth + "]";
	}
	
	@Override
	public String getUsername() {
		return bId;
	}
	
	@Override
	public String getPassword() {
		return bPw;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return auth;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}
	
	public String getbCtCode() {
		return bCtCode;
	}

	public void setbCtCode(String bCtCode) {
		this.bCtCode = bCtCode;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbPw() {
		return bPw;
	}

	public void setbPw(String bPw) {
		this.bPw = bPw;
	}

	public String getbOut() {
		return bOut;
	}

	public void setbOut(String bOut) {
		this.bOut = bOut;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getsChk() {
		return sChk;
	}

	public void setsChk(String sChk) {
		this.sChk = sChk;
	}

	public String getsOut() {
		return sOut;
	}

	public void setsOut(String sOut) {
		this.sOut = sOut;
	}

	public Collection<? extends GrantedAuthority> getAuth() {
		return auth;
	}

	public void setAuth(Collection<? extends GrantedAuthority> auth) {
		this.auth = auth;
	}
}

package recycling.dto.manager;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class ManagerLogin {
	
	private String mgrCode;
	private int deptno;
	private String mgrId;
	private String mgrPw;
	private String mgrOut;
	private Collection<? extends GrantedAuthority> auth; // 권한
	
	public ManagerLogin() {}

	public ManagerLogin(String mgrCode, int deptno, String mgrId, String mgrPw, String mgrOut) {
		this.mgrCode = mgrCode;
		this.deptno = deptno;
		this.mgrId = mgrId;
		this.mgrPw = mgrPw;
		this.mgrOut = mgrOut;
	}
	
	public ManagerLogin(String mgrCode, int deptno, String mgrId, String mgrPw, String mgrOut,
			Collection<? extends GrantedAuthority> auth) {
		this.mgrCode = mgrCode;
		this.deptno = deptno;
		this.mgrId = mgrId;
		this.mgrPw = mgrPw;
		this.mgrOut = mgrOut;
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "ManagerLogin [mgrCode=" + mgrCode + ", deptno=" + deptno + ", mgrId=" + mgrId + ", mgrPw=" + mgrPw
				+ ", mgrOut=" + mgrOut + ", auth=" + auth + "]";
	}

	public String getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(String mgrCode) {
		this.mgrCode = mgrCode;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getMgrId() {
		return mgrId;
	}

	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}

	public String getMgrPw() {
		return mgrPw;
	}

	public void setMgrPw(String mgrPw) {
		this.mgrPw = mgrPw;
	}

	public String getMgrOut() {
		return mgrOut;
	}

	public void setMgrOut(String mgrOut) {
		this.mgrOut = mgrOut;
	}

	public Collection<? extends GrantedAuthority> getAuth() {
		return auth;
	}

	public void setAuth(Collection<? extends GrantedAuthority> auth) {
		this.auth = auth;
	}
}

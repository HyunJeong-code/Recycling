package recycling.dto.seller;

public class Cmt {
	
	private String cmtCode;
	private String rcyCode;
	private String sCode;
	private String cmtAns;
	private String cmtDate;
	
	public Cmt() {}

	public Cmt(String cmtCode, String rcyCode, String sCode, String cmtAns, String cmtDate) {
		this.cmtCode = cmtCode;
		this.rcyCode = rcyCode;
		this.sCode = sCode;
		this.cmtAns = cmtAns;
		this.cmtDate = cmtDate;
	}

	@Override
	public String toString() {
		return "Cmt [cmtCode=" + cmtCode + ", rcyCode=" + rcyCode + ", sCode=" + sCode + ", cmtAns=" + cmtAns
				+ ", cmtDate=" + cmtDate + "]";
	}

	public String getCmtCode() {
		return cmtCode;
	}

	public void setCmtCode(String cmtCode) {
		this.cmtCode = cmtCode;
	}

	public String getRcyCode() {
		return rcyCode;
	}

	public void setRcyCode(String rcyCode) {
		this.rcyCode = rcyCode;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getCmtAns() {
		return cmtAns;
	}

	public void setCmtAns(String cmtAns) {
		this.cmtAns = cmtAns;
	}

	public String getCmtDate() {
		return cmtDate;
	}

	public void setCmtDate(String cmtDate) {
		this.cmtDate = cmtDate;
	}
}

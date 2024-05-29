package recycling.dto.buyer;

public class Rcy {
	
	private String rcyCode;
	private String bCode;
	private String prdCode;
	private String rcyCmt;
	private String rcyDate;
	
	public Rcy() {}

	public Rcy(String rcyCode, String bCode, String prdCode, String rcyCmt, String rcyDate) {
		this.rcyCode = rcyCode;
		this.bCode = bCode;
		this.prdCode = prdCode;
		this.rcyCmt = rcyCmt;
		this.rcyDate = rcyDate;
	}

	@Override
	public String toString() {
		return "Rcy [rcyCode=" + rcyCode + ", bCode=" + bCode + ", prdCode=" + prdCode + ", rcyCmt=" + rcyCmt
				+ ", rcyDate=" + rcyDate + "]";
	}

	public String getRcyCode() {
		return rcyCode;
	}

	public void setRcyCode(String rcyCode) {
		this.rcyCode = rcyCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getRcyCmt() {
		return rcyCmt;
	}

	public void setRcyCmt(String rcyCmt) {
		this.rcyCmt = rcyCmt;
	}

	public String getRcyDate() {
		return rcyDate;
	}

	public void setRcyDate(String rcyDate) {
		this.rcyDate = rcyDate;
	}
}
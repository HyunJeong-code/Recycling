package recycling.dto.manager;

public class Notice {
	
	private String ntcCode;
	private int ctNtcNo;
	private String mgrCode;
	private String ntcTitle;
	private String ntcContent;
	private int ntcHit;
	private String ntcDate;
	
	public Notice() {}

	public Notice(String ntcCode, int ctNtcNo, String mgrCode, String ntcTitle, String ntcContent, int ntcHit,
			String ntcDate) {
		this.ntcCode = ntcCode;
		this.ctNtcNo = ctNtcNo;
		this.mgrCode = mgrCode;
		this.ntcTitle = ntcTitle;
		this.ntcContent = ntcContent;
		this.ntcHit = ntcHit;
		this.ntcDate = ntcDate;
	}

	@Override
	public String toString() {
		return "Notice [ntcCode=" + ntcCode + ", ctNtcNo=" + ctNtcNo + ", mgrCode=" + mgrCode + ", ntcTitle=" + ntcTitle
				+ ", ntcContent=" + ntcContent + ", ntcHit=" + ntcHit + ", ntcDate=" + ntcDate + "]";
	}

	public String getNtcCode() {
		return ntcCode;
	}

	public void setNtcCode(String ntcCode) {
		this.ntcCode = ntcCode;
	}

	public int getCtNtcNo() {
		return ctNtcNo;
	}

	public void setCtNtcNo(int ctNtcNo) {
		this.ctNtcNo = ctNtcNo;
	}

	public String getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(String mgrCode) {
		this.mgrCode = mgrCode;
	}

	public String getNtcTitle() {
		return ntcTitle;
	}

	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}

	public String getNtcContent() {
		return ntcContent;
	}

	public void setNtcContent(String ntcContent) {
		this.ntcContent = ntcContent;
	}

	public int getNtcHit() {
		return ntcHit;
	}

	public void setNtcHit(int ntcHit) {
		this.ntcHit = ntcHit;
	}

	public String getNtcDate() {
		return ntcDate;
	}

	public void setNtcDate(String ntcDate) {
		this.ntcDate = ntcDate;
	}
}
package recycling.dto.seller;

public class Change {
	
	private String chgCode;
	private String ordCode;
	private int ctChgNo;
	private String chgDt;
	private String chgDate;
	
	public Change() {}

	public Change(String chgCode, String ordCode, int ctChgNo, String chgDt, String chgDate) {
		this.chgCode = chgCode;
		this.ordCode = ordCode;
		this.ctChgNo = ctChgNo;
		this.chgDt = chgDt;
		this.chgDate = chgDate;
	}

	@Override
	public String toString() {
		return "Change [chgCode=" + chgCode + ", ordCode=" + ordCode + ", ctChgNo=" + ctChgNo + ", chgDt=" + chgDt
				+ ", chgDate=" + chgDate + "]";
	}

	public String getChgCode() {
		return chgCode;
	}

	public void setChgCode(String chgCode) {
		this.chgCode = chgCode;
	}

	public String getOrdCode() {
		return ordCode;
	}

	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}

	public int getCtChgNo() {
		return ctChgNo;
	}

	public void setCtChgNo(int ctChgNo) {
		this.ctChgNo = ctChgNo;
	}

	public String getChgDt() {
		return chgDt;
	}

	public void setChgDt(String chgDt) {
		this.chgDt = chgDt;
	}

	public String getChgDate() {
		return chgDate;
	}

	public void setChgDate(String chgDate) {
		this.chgDate = chgDate;
	}
}

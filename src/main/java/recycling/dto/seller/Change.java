package recycling.dto.seller;

public class Change {
	
	private String chgCode;
	private String orddtCode;
	private int ctChgNo;
	private String chgDt;
	private String chgDate;
	
	public Change() {}

	public Change(String chgCode, String orddtCode, int ctChgNo, String chgDt, String chgDate) {
		this.chgCode = chgCode;
		this.orddtCode = orddtCode;
		this.ctChgNo = ctChgNo;
		this.chgDt = chgDt;
		this.chgDate = chgDate;
	}

	@Override
	public String toString() {
		return "Change [chgCode=" + chgCode + ", orddtCode=" + orddtCode + ", ctChgNo=" + ctChgNo + ", chgDt=" + chgDt
				+ ", chgDate=" + chgDate + "]";
	}

	public String getChgCode() {
		return chgCode;
	}

	public void setChgCode(String chgCode) {
		this.chgCode = chgCode;
	}

	public String getOrddtCode() {
		return orddtCode;
	}

	public void setOrddtCode(String orddtCode) {
		this.orddtCode = orddtCode;
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

package recycling.dto.manager;

public class Ans {
	
	private String ansCode;
	private String otoCode;
	private String mgrCode;
	private String ansContent;
	private String ansDate;
	
	public Ans() {}

	public Ans(String ansCode, String otoCode, String mgrCode, String ansContent, String ansDate) {
		this.ansCode = ansCode;
		this.otoCode = otoCode;
		this.mgrCode = mgrCode;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
	}

	@Override
	public String toString() {
		return "Ans [ansCode=" + ansCode + ", otoCode=" + otoCode + ", mgrCode=" + mgrCode + ", ansContent="
				+ ansContent + ", ansDate=" + ansDate + "]";
	}

	public String getAnsCode() {
		return ansCode;
	}

	public void setAnsCode(String ansCode) {
		this.ansCode = ansCode;
	}

	public String getOtoCode() {
		return otoCode;
	}

	public void setOtoCode(String otoCode) {
		this.otoCode = otoCode;
	}

	public String getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(String mgrCode) {
		this.mgrCode = mgrCode;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public String getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(String ansDate) {
		this.ansDate = ansDate;
	}
}
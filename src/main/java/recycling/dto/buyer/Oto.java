package recycling.dto.buyer;

public class Oto {
	
	private String otoCode;
	private int ctOtoNo;
	private String bCode;
	private String otoTitle;
	private String otoContent;
	private String otoName;
	private String otoEmail;
	private String otoDate;
	private int otoHit;
	
	public Oto() {}

	public Oto(String otoCode, int ctOtoNo, String bCode, String otoTitle, String otoContent, String otoName,
			String otoEmail, String otoDate, int otoHit) {
		this.otoCode = otoCode;
		this.ctOtoNo = ctOtoNo;
		this.bCode = bCode;
		this.otoTitle = otoTitle;
		this.otoContent = otoContent;
		this.otoName = otoName;
		this.otoEmail = otoEmail;
		this.otoDate = otoDate;
		this.otoHit = otoHit;
	}

	@Override
	public String toString() {
		return "Oto [otoCode=" + otoCode + ", ctOtoNo=" + ctOtoNo + ", bCode=" + bCode + ", otoTitle=" + otoTitle
				+ ", otoContent=" + otoContent + ", otoName=" + otoName + ", otoEmail=" + otoEmail + ", otoDate="
				+ otoDate + ", otoHit=" + otoHit + "]";
	}

	public String getOtoCode() {
		return otoCode;
	}

	public void setOtoCode(String otoCode) {
		this.otoCode = otoCode;
	}

	public int getCtOtoNo() {
		return ctOtoNo;
	}

	public void setCtOtoNo(int ctOtoNo) {
		this.ctOtoNo = ctOtoNo;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getOtoTitle() {
		return otoTitle;
	}

	public void setOtoTitle(String otoTitle) {
		this.otoTitle = otoTitle;
	}

	public String getOtoContent() {
		return otoContent;
	}

	public void setOtoContent(String otoContent) {
		this.otoContent = otoContent;
	}

	public String getOtoName() {
		return otoName;
	}

	public void setOtoName(String otoName) {
		this.otoName = otoName;
	}

	public String getOtoEmail() {
		return otoEmail;
	}

	public void setOtoEmail(String otoEmail) {
		this.otoEmail = otoEmail;
	}

	public String getOtoDate() {
		return otoDate;
	}

	public void setOtoDate(String otoDate) {
		this.otoDate = otoDate;
	}

	public int getOtoHit() {
		return otoHit;
	}

	public void setOtoHit(int otoHit) {
		this.otoHit = otoHit;
	}
}

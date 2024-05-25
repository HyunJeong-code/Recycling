package recycling.dto.buyer;

public class Review {
	
	private String rvwCode;
	private int rvwCtNo;
	private String prdCode;
	private String bCode;
	private String rvwTitle;
	private String rvwContent;
	private int rvwGrade;
	private String rvwDate;
	private int rvwHit;
	
	public Review() {}

	public Review(String rvwCode, int rvwCtNo, String prdCode, String bCode, String rvwTitle, String rvwContent,
			int rvwGrade, String rvwDate, int rvwHit) {
		this.rvwCode = rvwCode;
		this.rvwCtNo = rvwCtNo;
		this.prdCode = prdCode;
		this.bCode = bCode;
		this.rvwTitle = rvwTitle;
		this.rvwContent = rvwContent;
		this.rvwGrade = rvwGrade;
		this.rvwDate = rvwDate;
		this.rvwHit = rvwHit;
	}

	@Override
	public String toString() {
		return "Review [rvwCode=" + rvwCode + ", rvwCtNo=" + rvwCtNo + ", prdCode=" + prdCode + ", bCode=" + bCode
				+ ", rvwTitle=" + rvwTitle + ", rvwContent=" + rvwContent + ", rvwGrade=" + rvwGrade + ", rvwDate="
				+ rvwDate + ", rvwHit=" + rvwHit + "]";
	}

	public String getRvwCode() {
		return rvwCode;
	}

	public void setRvwCode(String rvwCode) {
		this.rvwCode = rvwCode;
	}

	public int getRvwCtNo() {
		return rvwCtNo;
	}

	public void setRvwCtNo(int rvwCtNo) {
		this.rvwCtNo = rvwCtNo;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getRvwTitle() {
		return rvwTitle;
	}

	public void setRvwTitle(String rvwTitle) {
		this.rvwTitle = rvwTitle;
	}

	public String getRvwContent() {
		return rvwContent;
	}

	public void setRvwContent(String rvwContent) {
		this.rvwContent = rvwContent;
	}

	public int getRvwGrade() {
		return rvwGrade;
	}

	public void setRvwGrade(int rvwGrade) {
		this.rvwGrade = rvwGrade;
	}

	public String getRvwDate() {
		return rvwDate;
	}

	public void setRvwDate(String rvwDate) {
		this.rvwDate = rvwDate;
	}

	public int getRvwHit() {
		return rvwHit;
	}

	public void setRvwHit(int rvwHit) {
		this.rvwHit = rvwHit;
	}
}
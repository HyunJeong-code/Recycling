package recycling.dto.buyer;

public class ExpReview {
	
	private String rvwCode;
	private String bCode;
	private String expCode;
	private int rvwGrade;
	private String rvwContent;
	private String rvwDate;
	
	public ExpReview() {}

	public ExpReview(String rvwCode, String bCode, String expCode, int rvwGrade, String rvwContent, String rvwDate) {
		this.rvwCode = rvwCode;
		this.bCode = bCode;
		this.expCode = expCode;
		this.rvwGrade = rvwGrade;
		this.rvwContent = rvwContent;
		this.rvwDate = rvwDate;
	}

	@Override
	public String toString() {
		return "ExpReview [rvwCode=" + rvwCode + ", bCode=" + bCode + ", expCode=" + expCode + ", rvwGrade=" + rvwGrade
				+ ", rvwContent=" + rvwContent + ", rvwDate=" + rvwDate + "]";
	}

	public String getRvwCode() {
		return rvwCode;
	}

	public void setRvwCode(String rvwCode) {
		this.rvwCode = rvwCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getExpCode() {
		return expCode;
	}

	public void setExpCode(String expCode) {
		this.expCode = expCode;
	}

	public int getRvwGrade() {
		return rvwGrade;
	}

	public void setRvwGrade(int rvwGrade) {
		this.rvwGrade = rvwGrade;
	}

	public String getRvwContent() {
		return rvwContent;
	}

	public void setRvwContent(String rvwContent) {
		this.rvwContent = rvwContent;
	}

	public String getRvwDate() {
		return rvwDate;
	}

	public void setRvwDate(String rvwDate) {
		this.rvwDate = rvwDate;
	}
}

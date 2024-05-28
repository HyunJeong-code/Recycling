package recycling.dto.buyer;

public class UpcyReview {
	
	private String upcyCode;
	private String bCode;
	private String prdCode;
	private int upcyGrade;
	private String upcyContent;
	private String upcyDate;
	
	public UpcyReview() {}

	public UpcyReview(String upcyCode, String bCode, String prdCode, int upcyGrade, String upcyContent,
			String upcyDate) {
		this.upcyCode = upcyCode;
		this.bCode = bCode;
		this.prdCode = prdCode;
		this.upcyGrade = upcyGrade;
		this.upcyContent = upcyContent;
		this.upcyDate = upcyDate;
	}

	@Override
	public String toString() {
		return "UpcyReview [upcyCode=" + upcyCode + ", bCode=" + bCode + ", prdCode=" + prdCode + ", upcyGrade="
				+ upcyGrade + ", upcyContent=" + upcyContent + ", upcyDate=" + upcyDate + "]";
	}

	public String getUpcyCode() {
		return upcyCode;
	}

	public void setUpcyCode(String upcyCode) {
		this.upcyCode = upcyCode;
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

	public int getUpcyGrade() {
		return upcyGrade;
	}

	public void setUpcyGrade(int upcyGrade) {
		this.upcyGrade = upcyGrade;
	}

	public String getUpcyContent() {
		return upcyContent;
	}

	public void setUpcyContent(String upcyContent) {
		this.upcyContent = upcyContent;
	}

	public String getUpcyDate() {
		return upcyDate;
	}

	public void setUpcyDate(String upcyDate) {
		this.upcyDate = upcyDate;
	}
}

package recycling.dto.buyer;

public class Review {
	
	private String code; // 리뷰 코드
	private String bCode;
	private String ctgCode; // 리뷰 상품 코드
	private int grade;
	private String content;
	private String rvwDate;
	
	public Review() {}

	public Review(String code, String bCode, String ctgCode, int grade, String content, String rvwDate) {
		this.code = code;
		this.bCode = bCode;
		this.ctgCode = ctgCode;
		this.grade = grade;
		this.content = content;
		this.rvwDate = rvwDate;
	}

	@Override
	public String toString() {
		return "Review [code=" + code + ", bCode=" + bCode + ", ctgCode=" + ctgCode + ", grade=" + grade + ", content="
				+ content + ", rvwDate=" + rvwDate + "]";
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getCtgCode() {
		return ctgCode;
	}

	public void setCtgCode(String ctgCode) {
		this.ctgCode = ctgCode;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRvwDate() {
		return rvwDate;
	}

	public void setRvwDate(String rvwDate) {
		this.rvwDate = rvwDate;
	}
}

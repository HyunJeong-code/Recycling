package recycling.dto.seller;

public class Qna {
	
	private String qnaCode;
	private String qstCode;
	private String sCode;
	private String qnaContent;
	private String qnaDate;
	
	public Qna() {}

	public Qna(String qnaCode, String qstCode, String sCode, String qnaContent, String qnaDate) {
		this.qnaCode = qnaCode;
		this.qstCode = qstCode;
		this.sCode = sCode;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
	}

	@Override
	public String toString() {
		return "Qna [qnaCode=" + qnaCode + ", qstCode=" + qstCode + ", sCode=" + sCode + ", qnaContent=" + qnaContent
				+ ", qnaDate=" + qnaDate + "]";
	}

	public String getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getQstCode() {
		return qstCode;
	}

	public void setQstCode(String qstCode) {
		this.qstCode = qstCode;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
}

package recycling.dto.seller;

import java.util.Date;

public class SellerAns {
	
	private String qnaCode; // 판매자 문의 답변 코드
	private String qstCode; // 판매자 문의 코드
	private String sCode; // 판매자 코드
	private String qnaContent; // 답변 내용
	private Date qnaDate; // 등록일
	
	public SellerAns() {
	}

	@Override
	public String toString() {
		return "SellerAns [qnaCode=" + qnaCode + ", qstCode=" + qstCode + ", sCode=" + sCode + ", qnaContent="
				+ qnaContent + ", qnaDate=" + qnaDate + "]";
	}

	public SellerAns(String qnaCode, String qstCode, String sCode, String qnaContent, Date qnaDate) {
		super();
		this.qnaCode = qnaCode;
		this.qstCode = qstCode;
		this.sCode = sCode;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
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

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	
	
	
}

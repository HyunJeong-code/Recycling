package recycling.dto.seller;

import java.util.Date;

public class SellerQST {
	
	private String qstCode;	// 판매자 문의 코드
    private int CTqstno;	// 판매자 문의 분류코드
    private String PrdCode;	// 상품 코드
    private String bCode;	// 구매자 코드
    private String qstTitle;	// 제목
    private String qstContent;	// 내용
    private String qstName;		// 이름 (구매자 정보 연동, 수정 가능)
    private String qstEmail;	// 이메일 (구매자 정보 연동, 수정 가능)
    private Date qstDate;		// 작성일 (수정시 최신화)
    private int qstHit;			// 조회수
    
    public SellerQST() {
	}

	@Override
	public String toString() {
		return "SellerQST [qstCode=" + qstCode + ", CTqstno=" + CTqstno + ", PrdCode=" + PrdCode + ", bCode=" + bCode
				+ ", qstTitle=" + qstTitle + ", qstContent=" + qstContent + ", qstName=" + qstName + ", qstEmail="
				+ qstEmail + ", qstDate=" + qstDate + ", qstHit=" + qstHit + "]";
	}

	public SellerQST(String qstCode, int cTqstno, String prdCode, String bCode, String qstTitle, String qstContent,
			String qstName, String qstEmail, Date qstDate, int qstHit) {
		super();
		this.qstCode = qstCode;
		CTqstno = cTqstno;
		PrdCode = prdCode;
		this.bCode = bCode;
		this.qstTitle = qstTitle;
		this.qstContent = qstContent;
		this.qstName = qstName;
		this.qstEmail = qstEmail;
		this.qstDate = qstDate;
		this.qstHit = qstHit;
	}

	public String getQstCode() {
		return qstCode;
	}

	public void setQstCode(String qstCode) {
		this.qstCode = qstCode;
	}

	public int getCTqstno() {
		return CTqstno;
	}

	public void setCTqstno(int cTqstno) {
		CTqstno = cTqstno;
	}

	public String getPrdCode() {
		return PrdCode;
	}

	public void setPrdCode(String prdCode) {
		PrdCode = prdCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getQstTitle() {
		return qstTitle;
	}

	public void setQstTitle(String qstTitle) {
		this.qstTitle = qstTitle;
	}

	public String getQstContent() {
		return qstContent;
	}

	public void setQstContent(String qstContent) {
		this.qstContent = qstContent;
	}

	public String getQstName() {
		return qstName;
	}

	public void setQstName(String qstName) {
		this.qstName = qstName;
	}

	public String getQstEmail() {
		return qstEmail;
	}

	public void setQstEmail(String qstEmail) {
		this.qstEmail = qstEmail;
	}

	public Date getQstDate() {
		return qstDate;
	}

	public void setQstDate(Date qstDate) {
		this.qstDate = qstDate;
	}

	public int getQstHit() {
		return qstHit;
	}

	public void setQstHit(int qstHit) {
		this.qstHit = qstHit;
	}
    
    

}

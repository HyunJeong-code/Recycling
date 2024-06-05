package recycling.dto.buyer;

public class QstA {
	private String qstCode;
	private int ctQstNo;
	private String prdCode;
	private String bCode;
	private String qstTitle;
	private String qstContent;
	private String qstName;
	private String qstEmail;
	private String qstDate;
	private int qstHit;
	private int qstA;
	
	public QstA() {}

	public QstA(String qstCode, int ctQstNo, String prdCode, String bCode, String qstTitle, String qstContent,
			String qstName, String qstEmail, String qstDate, int qstHit, int qstA) {
		super();
		this.qstCode = qstCode;
		this.ctQstNo = ctQstNo;
		this.prdCode = prdCode;
		this.bCode = bCode;
		this.qstTitle = qstTitle;
		this.qstContent = qstContent;
		this.qstName = qstName;
		this.qstEmail = qstEmail;
		this.qstDate = qstDate;
		this.qstHit = qstHit;
		this.qstA = qstA;
	}

	@Override
	public String toString() {
		return "QstA [qstCode=" + qstCode + ", ctQstNo=" + ctQstNo + ", prdCode=" + prdCode + ", bCode=" + bCode
				+ ", qstTitle=" + qstTitle + ", qstContent=" + qstContent + ", qstName=" + qstName + ", qstEmail="
				+ qstEmail + ", qstDate=" + qstDate + ", qstHit=" + qstHit + ", qstA=" + qstA + "]";
	}

	public String getQstCode() {
		return qstCode;
	}

	public void setQstCode(String qstCode) {
		this.qstCode = qstCode;
	}

	public int getCtQstNo() {
		return ctQstNo;
	}

	public void setCtQstNo(int ctQstNo) {
		this.ctQstNo = ctQstNo;
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

	public String getQstDate() {
		return qstDate;
	}

	public void setQstDate(String qstDate) {
		this.qstDate = qstDate;
	}

	public int getQstHit() {
		return qstHit;
	}

	public void setQstHit(int qstHit) {
		this.qstHit = qstHit;
	}

	public int getQstA() {
		return qstA;
	}

	public void setQstA(int qstA) {
		this.qstA = qstA;
	}
}

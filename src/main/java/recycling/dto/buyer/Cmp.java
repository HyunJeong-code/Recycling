package recycling.dto.buyer;

public class Cmp {
	
	private int cmpNo;
	private String bCode;
	private String cmpName;
	private String cmpCeo;
	private int cmpNum;
	private String cmpPostcode;
	private String cmpAddr;
	private String cmpDetail;
	
	public Cmp() {}

	public Cmp(int cmpNo, String bCode, String cmpName, String cmpCeo, int cmpNum, String cmpPostcode, String cmpAddr,
			String cmpDetail) {
		super();
		this.cmpNo = cmpNo;
		this.bCode = bCode;
		this.cmpName = cmpName;
		this.cmpCeo = cmpCeo;
		this.cmpNum = cmpNum;
		this.cmpPostcode = cmpPostcode;
		this.cmpAddr = cmpAddr;
		this.cmpDetail = cmpDetail;
	}

	@Override
	public String toString() {
		return "Cmp [cmpNo=" + cmpNo + ", bCode=" + bCode + ", cmpName=" + cmpName + ", cmpCeo=" + cmpCeo + ", cmpNum="
				+ cmpNum + ", cmpPostcode=" + cmpPostcode + ", cmpAddr=" + cmpAddr + ", cmpDetail=" + cmpDetail + "]";
	}

	public int getCmpNo() {
		return cmpNo;
	}

	public void setCmpNo(int cmpNo) {
		this.cmpNo = cmpNo;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getCmpName() {
		return cmpName;
	}

	public void setCmpName(String cmpName) {
		this.cmpName = cmpName;
	}

	public String getCmpCeo() {
		return cmpCeo;
	}

	public void setCmpCeo(String cmpCeo) {
		this.cmpCeo = cmpCeo;
	}

	public int getCmpNum() {
		return cmpNum;
	}

	public void setCmpNum(int cmpNum) {
		this.cmpNum = cmpNum;
	}

	public String getCmpPostcode() {
		return cmpPostcode;
	}

	public void setCmpPostcode(String cmpPostcode) {
		this.cmpPostcode = cmpPostcode;
	}

	public String getCmpAddr() {
		return cmpAddr;
	}

	public void setCmpAddr(String cmpAddr) {
		this.cmpAddr = cmpAddr;
	}

	public String getCmpDetail() {
		return cmpDetail;
	}

	public void setCmpDetail(String cmpDetail) {
		this.cmpDetail = cmpDetail;
	}
}

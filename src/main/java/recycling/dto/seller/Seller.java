package recycling.dto.seller;

public class Seller {

	private String sCode;
	private String bCode;
	private String accName;
	private String accBank;
	private String accNo;
	private String sPostcode;
	private String sAddr;
	private String sDetail;
	private String sEntDate;
	private String sChk;
	private String sOut;
	private String sOutDate;
	
	public Seller() {}

	public Seller(String sCode, String bCode, String accName, String accBank, String accNo, String sPostcode,
			String sAddr, String sDetail, String sEntDate, String sChk, String sOut, String sOutDate) {
		this.sCode = sCode;
		this.bCode = bCode;
		this.accName = accName;
		this.accBank = accBank;
		this.accNo = accNo;
		this.sPostcode = sPostcode;
		this.sAddr = sAddr;
		this.sDetail = sDetail;
		this.sEntDate = sEntDate;
		this.sChk = sChk;
		this.sOut = sOut;
		this.sOutDate = sOutDate;
	}

	@Override
	public String toString() {
		return "Seller [sCode=" + sCode + ", bCode=" + bCode + ", accName=" + accName + ", accBank=" + accBank
				+ ", accNo=" + accNo + ", sPostcode=" + sPostcode + ", sAddr=" + sAddr + ", sDetail=" + sDetail
				+ ", sEntDate=" + sEntDate + ", sChk=" + sChk + ", sOut=" + sOut + ", sOutDate=" + sOutDate + "]";
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getAccName() {
		return accName;
	}

	public void setAccName(String accName) {
		this.accName = accName;
	}

	public String getAccBank() {
		return accBank;
	}

	public void setAccBank(String accBank) {
		this.accBank = accBank;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getsPostcode() {
		return sPostcode;
	}

	public void setsPostcode(String sPostcode) {
		this.sPostcode = sPostcode;
	}

	public String getsAddr() {
		return sAddr;
	}

	public void setsAddr(String sAddr) {
		this.sAddr = sAddr;
	}

	public String getsDetail() {
		return sDetail;
	}

	public void setsDetail(String sDetail) {
		this.sDetail = sDetail;
	}

	public String getsEntDate() {
		return sEntDate;
	}

	public void setsEntDate(String sEntDate) {
		this.sEntDate = sEntDate;
	}

	public String getsChk() {
		return sChk;
	}

	public void setsChk(String sChk) {
		this.sChk = sChk;
	}

	public String getsOut() {
		return sOut;
	}

	public void setsOut(String sOut) {
		this.sOut = sOut;
	}

	public String getsOutDate() {
		return sOutDate;
	}

	public void setsOutDate(String sOutDate) {
		this.sOutDate = sOutDate;
	}
}

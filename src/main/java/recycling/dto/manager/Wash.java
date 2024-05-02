package recycling.dto.manager;

public class Wash {
	
	private String wCode;
	private String mgrCode;
	private String wName;
	private String wPhone;
	private String wEmail;
	private String wCmpName;
	private String wCmpCeo;
	private int wCmpNum;
	private String wPostcode;
	private String wAddr;
	private String wDetail;
	private String wDate;
	
	public Wash() {}

	public Wash(String wCode, String mgrCode, String wName, String wPhone, String wEmail, String wCmpName,
			String wCmpCeo, int wCmpNum, String wPostcode, String wAddr, String wDetail, String wDate) {
		super();
		this.wCode = wCode;
		this.mgrCode = mgrCode;
		this.wName = wName;
		this.wPhone = wPhone;
		this.wEmail = wEmail;
		this.wCmpName = wCmpName;
		this.wCmpCeo = wCmpCeo;
		this.wCmpNum = wCmpNum;
		this.wPostcode = wPostcode;
		this.wAddr = wAddr;
		this.wDetail = wDetail;
		this.wDate = wDate;
	}

	@Override
	public String toString() {
		return "Wash [wCode=" + wCode + ", mgrCode=" + mgrCode + ", wName=" + wName + ", wPhone=" + wPhone + ", wEmail="
				+ wEmail + ", wCmpName=" + wCmpName + ", wCmpCeo=" + wCmpCeo + ", wCmpNum=" + wCmpNum + ", wPostcode="
				+ wPostcode + ", wAddr=" + wAddr + ", wDetail=" + wDetail + ", wDate=" + wDate + "]";
	}

	public String getwCode() {
		return wCode;
	}

	public void setwCode(String wCode) {
		this.wCode = wCode;
	}

	public String getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(String mgrCode) {
		this.mgrCode = mgrCode;
	}

	public String getwName() {
		return wName;
	}

	public void setwName(String wName) {
		this.wName = wName;
	}

	public String getwPhone() {
		return wPhone;
	}

	public void setwPhone(String wPhone) {
		this.wPhone = wPhone;
	}

	public String getwEmail() {
		return wEmail;
	}

	public void setwEmail(String wEmail) {
		this.wEmail = wEmail;
	}

	public String getwCmpName() {
		return wCmpName;
	}

	public void setwCmpName(String wCmpName) {
		this.wCmpName = wCmpName;
	}

	public String getwCmpCeo() {
		return wCmpCeo;
	}

	public void setwCmpCeo(String wCmpCeo) {
		this.wCmpCeo = wCmpCeo;
	}

	public int getwCmpnNum() {
		return wCmpNum;
	}

	public void setwCmpNum(int wCmpNum) {
		this.wCmpNum = wCmpNum;
	}

	public String getwPostcode() {
		return wPostcode;
	}

	public void setwPostcode(String wPostcode) {
		this.wPostcode = wPostcode;
	}

	public String getwAddr() {
		return wAddr;
	}

	public void setwAddr(String wAddr) {
		this.wAddr = wAddr;
	}

	public String getwDetail() {
		return wDetail;
	}

	public void setwDetail(String wDetail) {
		this.wDetail = wDetail;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public int getwCmpNum() {
		return wCmpNum;
	}

	public String getW_addr() {
		return wAddr;
	}

	public void setW_addr(String wAddr) {
		this.wAddr = wAddr;
	}

	public String getW_detail() {
		return wDetail;
	}

	public void setW_detail(String wDetail) {
		this.wDetail = wDetail;
	}

	public String getW_date() {
		return wDate;
	}

	public void setW_date(String wDate) {
		this.wDate = wDate;
	}
}

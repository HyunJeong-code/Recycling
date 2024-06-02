package recycling.dto.buyer;

public class ExpRes {
	
	private String resCode;
	private String bCode;
	private int schNo;
	private String resName;
	private String resPhone;
	private String resEmail;
	private String resExpName;
	private String resDate;
	private String resTime;
	private int resCnt;
	private int resPrice;
	private int resSum;
	private String resPay;
	private String payDate;
	private String resCnf;
	private String resCnl;
	private String resDt;
	
	public ExpRes() {}

	public ExpRes(String resCode, String bCode, int schNo, String resName, String resPhone, String resEmail,
			String resExpName, String resDate, String resTime, int resCnt, int resPrice, int resSum, String resPay,
			String payDate, String resCnf, String resCnl, String resDt) {
		this.resCode = resCode;
		this.bCode = bCode;
		this.schNo = schNo;
		this.resName = resName;
		this.resPhone = resPhone;
		this.resEmail = resEmail;
		this.resExpName = resExpName;
		this.resDate = resDate;
		this.resTime = resTime;
		this.resCnt = resCnt;
		this.resPrice = resPrice;
		this.resSum = resSum;
		this.resPay = resPay;
		this.payDate = payDate;
		this.resCnf = resCnf;
		this.resCnl = resCnl;
		this.resDt = resDt;
	}

	@Override
	public String toString() {
		return "ExpRes [resCode=" + resCode + ", bCode=" + bCode + ", schNo=" + schNo + ", resName=" + resName
				+ ", resPhone=" + resPhone + ", resEmail=" + resEmail + ", resExpName=" + resExpName + ", resDate="
				+ resDate + ", resTime=" + resTime + ", resCnt=" + resCnt + ", resPrice=" + resPrice + ", resSum="
				+ resSum + ", resPay=" + resPay + ", payDate=" + payDate + ", resCnf=" + resCnf + ", resCnl=" + resCnl
				+ ", resDt=" + resDt + "]";
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public int getSchNo() {
		return schNo;
	}

	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getResEmail() {
		return resEmail;
	}

	public void setResEmail(String resEmail) {
		this.resEmail = resEmail;
	}

	public String getResExpName() {
		return resExpName;
	}

	public void setResExpName(String resExpName) {
		this.resExpName = resExpName;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResTime() {
		return resTime;
	}

	public void setResTime(String resTime) {
		this.resTime = resTime;
	}

	public int getResCnt() {
		return resCnt;
	}

	public void setResCnt(int resCnt) {
		this.resCnt = resCnt;
	}

	public int getResPrice() {
		return resPrice;
	}

	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}

	public int getResSum() {
		return resSum;
	}

	public void setResSum(int resSum) {
		this.resSum = resSum;
	}

	public String getResPay() {
		return resPay;
	}

	public void setResPay(String resPay) {
		this.resPay = resPay;
	}

	public String getResCnf() {
		return resCnf;
	}

	public void setResCnf(String resCnf) {
		this.resCnf = resCnf;
	}

	public String getResCnl() {
		return resCnl;
	}

	public void setResCnl(String resCnl) {
		this.resCnl = resCnl;
	}

	public String getResDt() {
		return resDt;
	}

	public void setResDt(String resDt) {
		this.resDt = resDt;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getExpCode() {
		// TODO Auto-generated method stub
		return null;
	}
}

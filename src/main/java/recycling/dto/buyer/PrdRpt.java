package recycling.dto.buyer;

public class PrdRpt {
	
	private int rptNo;
	private String bCode;
	private String prdCode;
	private int ctRptNo;
	private String rptDetail;
	
	public PrdRpt() {}

	public PrdRpt(int rptNo, String bCode, String prdCode, int ctRptNo, String rptDetail) {
		this.rptNo = rptNo;
		this.bCode = bCode;
		this.prdCode = prdCode;
		this.ctRptNo = ctRptNo;
		this.rptDetail = rptDetail;
	}

	@Override
	public String toString() {
		return "PrdRpt [rptNo=" + rptNo + ", bCode=" + bCode + ", prdCode=" + prdCode + ", ctRptNo=" + ctRptNo
				+ ", rptDetail=" + rptDetail + "]";
	}

	public int getRptNo() {
		return rptNo;
	}

	public void setRptNo(int rptNo) {
		this.rptNo = rptNo;
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

	public int getCtRptNo() {
		return ctRptNo;
	}

	public void setCtRptNo(int ctRptNo) {
		this.ctRptNo = ctRptNo;
	}

	public String getRptDetail() {
		return rptDetail;
	}

	public void setRptDetail(String rptDetail) {
		this.rptDetail = rptDetail;
	}
}

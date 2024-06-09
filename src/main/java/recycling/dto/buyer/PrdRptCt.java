package recycling.dto.buyer;

public class PrdRptCt {
	
	private int ctRptNo;
	private String ctRptName;
	
	public PrdRptCt() {}

	public PrdRptCt(int ctRptNo, String ctRptName) {
		this.ctRptNo = ctRptNo;
		this.ctRptName = ctRptName;
	}

	@Override
	public String toString() {
		return "PrdRptCt [ctRptNo=" + ctRptNo + ", ctRptName=" + ctRptName + "]";
	}

	public int getCtRptNo() {
		return ctRptNo;
	}

	public void setCtRptNo(int ctRptNo) {
		this.ctRptNo = ctRptNo;
	}

	public String getCtRptName() {
		return ctRptName;
	}

	public void setCtRptName(String ctRptName) {
		this.ctRptName = ctRptName;
	}
}

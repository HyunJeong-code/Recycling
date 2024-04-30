package recycling.dto.manager;

public class WashFileCt {
	
	private int ctWflNo;
	private String ctWflName;
	
	public WashFileCt() {}

	public WashFileCt(int ctWflNo, String ctWflName) {
		this.ctWflNo = ctWflNo;
		this.ctWflName = ctWflName;
	}

	@Override
	public String toString() {
		return "WashFileCt [ctWflNo=" + ctWflNo + ", ctWflName=" + ctWflName + "]";
	}

	public int getCtWflNo() {
		return ctWflNo;
	}

	public void setCtWflNo(int ctWflNo) {
		this.ctWflNo = ctWflNo;
	}

	public String getCtWflName() {
		return ctWflName;
	}

	public void setCtWflName(String ctWflName) {
		this.ctWflName = ctWflName;
	}
}

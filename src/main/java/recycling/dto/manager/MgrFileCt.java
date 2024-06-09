package recycling.dto.manager;

public class MgrFileCt {
	
	private int ctMflNo;
	private String ctMflName;
	
	public MgrFileCt() {}

	public MgrFileCt(int ctMflNo, String ctMflName) {
		this.ctMflNo = ctMflNo;
		this.ctMflName = ctMflName;
	}

	@Override
	public String toString() {
		return "MgrFileCt [ctMflNo=" + ctMflNo + ", ctMflName=" + ctMflName + "]";
	}

	public int getCtMflNo() {
		return ctMflNo;
	}

	public void setCtMflNo(int ctMflNo) {
		this.ctMflNo = ctMflNo;
	}

	public String getCtMflName() {
		return ctMflName;
	}

	public void setCtMflName(String ctMflName) {
		this.ctMflName = ctMflName;
	}
}
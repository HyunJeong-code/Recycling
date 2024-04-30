package recycling.dto.seller;

public class PrdFileCt {
	
	private int ctPflNo;
	private String ctPflName;
	
	public PrdFileCt() {}

	public PrdFileCt(int ctPflNo, String ctPflName) {
		this.ctPflNo = ctPflNo;
		this.ctPflName = ctPflName;
	}

	@Override
	public String toString() {
		return "PrdFileCt [ctPflNo=" + ctPflNo + ", ctPflName=" + ctPflName + "]";
	}

	public int getCtPflNo() {
		return ctPflNo;
	}

	public void setCtPflNo(int ctPflNo) {
		this.ctPflNo = ctPflNo;
	}

	public String getCtPflName() {
		return ctPflName;
	}

	public void setCtPflName(String ctPflName) {
		this.ctPflName = ctPflName;
	}
}

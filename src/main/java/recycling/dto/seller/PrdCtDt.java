package recycling.dto.seller;

public class PrdCtDt {
	
	private int ctPdtNo;
	private String ctPdtName;
	
	public PrdCtDt() {}

	public PrdCtDt(int ctPdtNo, String ctPdtName) {
		this.ctPdtNo = ctPdtNo;
		this.ctPdtName = ctPdtName;
	}

	@Override
	public String toString() {
		return "PrdCtDt [ctPdtNo=" + ctPdtNo + ", ctPdtName=" + ctPdtName + "]";
	}

	public int getCtPdtNo() {
		return ctPdtNo;
	}

	public void setCtPdtNo(int ctPdtNo) {
		this.ctPdtNo = ctPdtNo;
	}

	public String getCtPdtName() {
		return ctPdtName;
	}

	public void setCtPdtName(String ctPdtName) {
		this.ctPdtName = ctPdtName;
	}
}

package recycling.dto.seller;

public class ChangeCt {
	
	private int ctChgNo;
	private String ctChgName;
	
	public ChangeCt() {}

	public ChangeCt(int ctChgNo, String ctChgName) {
		this.ctChgNo = ctChgNo;
		this.ctChgName = ctChgName;
	}

	@Override
	public String toString() {
		return "ChangeCt [ctChgNo=" + ctChgNo + ", ctChgName=" + ctChgName + "]";
	}

	public int getCtChgNo() {
		return ctChgNo;
	}

	public void setCtChgNo(int ctChgNo) {
		this.ctChgNo = ctChgNo;
	}

	public String getCtChgName() {
		return ctChgName;
	}

	public void setCtChgName(String ctChgName) {
		this.ctChgName = ctChgName;
	}
}

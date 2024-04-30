package recycling.dto.buyer;

public class RvwCt {
	
	private int ctRvwNo;
	private String ctRvwName;
	
	public RvwCt() {}

	public RvwCt(int ctRvwNo, String ctRvwName) {
		this.ctRvwNo = ctRvwNo;
		this.ctRvwName = ctRvwName;
	}

	@Override
	public String toString() {
		return "RvwCt [ctRvwNo=" + ctRvwNo + ", ctRvwName=" + ctRvwName + "]";
	}

	public int getCtRvwNo() {
		return ctRvwNo;
	}

	public void setCtRvwNo(int ctRvwNo) {
		this.ctRvwNo = ctRvwNo;
	}

	public String getCtRvwName() {
		return ctRvwName;
	}

	public void setCtRvwName(String ctRvwName) {
		this.ctRvwName = ctRvwName;
	}
}

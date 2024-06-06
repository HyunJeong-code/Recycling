package recycling.dto.manager;

public class WashAdCt {
	
	private int ctAdNo;
	private String ctAdName;
	
	public WashAdCt() {}

	public WashAdCt(int ctAdNo, String ctAdName) {
		this.ctAdNo = ctAdNo;
		this.ctAdName = ctAdName;
	}

	@Override
	public String toString() {
		return "WashAdCt [ctAdNo=" + ctAdNo + ", ctAdName=" + ctAdName + "]";
	}

	public int getCtAdNo() {
		return ctAdNo;
	}

	public void setCtAdNo(int ctAdNo) {
		this.ctAdNo = ctAdNo;
	}

	public String getCtAdName() {
		return ctAdName;
	}

	public void setCtAdName(String ctAdName) {
		this.ctAdName = ctAdName;
	}
}
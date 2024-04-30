package recycling.dto.buyer;

public class OtoCt {

	private int ctOtoNo;
	private String ctOtoName;
	
	public OtoCt() {}

	public OtoCt(int ctOtoNo, String ctOtoName) {
		this.ctOtoNo = ctOtoNo;
		this.ctOtoName = ctOtoName;
	}

	@Override
	public String toString() {
		return "OtoCt [ctOtoNo=" + ctOtoNo + ", ctOtoName=" + ctOtoName + "]";
	}

	public int getCtOtoNo() {
		return ctOtoNo;
	}

	public void setCtOtoNo(int ctOtoNo) {
		this.ctOtoNo = ctOtoNo;
	}

	public String getCtOtoName() {
		return ctOtoName;
	}

	public void setCtOtoName(String ctOtoName) {
		this.ctOtoName = ctOtoName;
	}
}

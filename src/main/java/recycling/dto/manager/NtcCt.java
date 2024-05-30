package recycling.dto.manager;

public class NtcCt {
	
	private int ctNtcNo;
	private String ctNtcName;
	
	public NtcCt() {}

	public NtcCt(int ctNtcNo, String ctNtcName) {
		this.ctNtcNo = ctNtcNo;
		this.ctNtcName = ctNtcName;
	}

	@Override
	public String toString() {
		return "NtcCt [ctNtcNo=" + ctNtcNo + ", ctNtcName=" + ctNtcName + "]";
	}

	public int getCtNtcNo() {
		return ctNtcNo;
	}

	public void setCtNtcNo(int ctNtcNo) {
		this.ctNtcNo = ctNtcNo;
	}

	public String getCtNtcName() {
		return ctNtcName;
	}

	public void setCtNtcName(String ctNtcName) {
		this.ctNtcName = ctNtcName;
	}
}
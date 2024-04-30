package recycling.dto.manager;

public class MgrFile {
	
	private int mgrFlNo;
	private int ctMflNo;
	private String mgrCode;
	private String originName;
	private String storedName;
	
	public MgrFile() {}

	public MgrFile(int mgrFlNo, int ctMflNo, String mgrCode, String originName, String storedName) {
		this.mgrFlNo = mgrFlNo;
		this.ctMflNo = ctMflNo;
		this.mgrCode = mgrCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "MgrFile [mgrFlNo=" + mgrFlNo + ", CtMflNo=" + ctMflNo + ", mgrCode=" + mgrCode + ", originName="
				+ originName + ", storedName=" + storedName + "]";
	}

	public int getMgrFlNo() {
		return mgrFlNo;
	}

	public void setMgrFlNo(int mgrFlNo) {
		this.mgrFlNo = mgrFlNo;
	}

	public int getctMflNo() {
		return ctMflNo;
	}

	public void setctMflNo(int ctMflNo) {
		this.ctMflNo = ctMflNo;
	}

	public String getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(String mgrCode) {
		this.mgrCode = mgrCode;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
}

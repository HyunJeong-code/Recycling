package recycling.dto.buyer;

public class CmpFile {
	
	private int cmpFlNo;
	private int cmpNo;
	private String originName;
	private String storedName;
	
	public CmpFile() {}

	public CmpFile(int cmpFlNo, int cmpNo, String originName, String storedName) {
		this.cmpFlNo = cmpFlNo;
		this.cmpNo = cmpNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "CmpFile [cmpFlNo=" + cmpFlNo + ", cmpNo=" + cmpNo + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getCmpFlNo() {
		return cmpFlNo;
	}

	public void setCmpFlNo(int cmpFlNo) {
		this.cmpFlNo = cmpFlNo;
	}

	public int getCmpNo() {
		return cmpNo;
	}

	public void setCmpNo(int cmpNo) {
		this.cmpNo = cmpNo;
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

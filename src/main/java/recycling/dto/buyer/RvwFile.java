package recycling.dto.buyer;

public class RvwFile {
	
	private int rvwFlNo;
	private String rvwCode;
	private String originName;
	private String storedName;
	
	public RvwFile() {}

	public RvwFile(int rvwFlNo, String rvwCode, String originName, String storedName) {
		this.rvwFlNo = rvwFlNo;
		this.rvwCode = rvwCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "RvwFile [rvwFlNo=" + rvwFlNo + ", rvwCode=" + rvwCode + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getRvwFlNo() {
		return rvwFlNo;
	}

	public void setRvwFlNo(int rvwFlNo) {
		this.rvwFlNo = rvwFlNo;
	}

	public String getRvwCode() {
		return rvwCode;
	}

	public void setRvwCode(String rvwCode) {
		this.rvwCode = rvwCode;
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

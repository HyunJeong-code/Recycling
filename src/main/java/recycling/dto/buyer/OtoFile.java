package recycling.dto.buyer;

public class OtoFile {

	private int otoFlNo;
	private String otoCode;
	private String originName;
	private String storedName;
	
	public OtoFile() {}

	public OtoFile(int otoFlNo, String otoCode, String originName, String storedName) {
		this.otoFlNo = otoFlNo;
		this.otoCode = otoCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "OtoFile [otoFlNo=" + otoFlNo + ", otoCode=" + otoCode + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getOtoFlNo() {
		return otoFlNo;
	}

	public void setOtoFlNo(int otoFlNo) {
		this.otoFlNo = otoFlNo;
	}

	public String getOtoCode() {
		return otoCode;
	}

	public void setOtoCode(String otoCode) {
		this.otoCode = otoCode;
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

package recycling.dto.manager;

public class WashFile {
	
	private int wFlNo;
	private int ctWflNo;
	private String wCode;
	private String originName;
	private String storedName;
	
	public WashFile() {}

	public WashFile(int wFlNo, int ctWflNo, String wCode, String originName, String storedName) {
		this.wFlNo = wFlNo;
		this.ctWflNo = ctWflNo;
		this.wCode = wCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "WashFile [wFlNo=" + wFlNo + ", ctWflNo=" + ctWflNo + ", wCode=" + wCode + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}

	public int getwFlNo() {
		return wFlNo;
	}

	public void setwFlNo(int wFlNo) {
		this.wFlNo = wFlNo;
	}

	public int getCtWflNo() {
		return ctWflNo;
	}

	public void setCtWflNo(int ctWflNo) {
		this.ctWflNo = ctWflNo;
	}

	public String getwCode() {
		return wCode;
	}

	public void setwCode(String wCode) {
		this.wCode = wCode;
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

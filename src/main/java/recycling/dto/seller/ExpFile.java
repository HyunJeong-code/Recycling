package recycling.dto.seller;

public class ExpFile {
	
	private int expFlNo;
	private String expCode;
	private int ctPflNo;
	private String originName;
	private String storedName;
	
	public ExpFile() {
	}

	public ExpFile(int expFlNo, String expCode, int ctPflNo, String originName, String storedName) {
		this.expFlNo = expFlNo;
		this.expCode = expCode;
		this.ctPflNo = ctPflNo;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "ExpFile [expFlNo=" + expFlNo + ", expCode=" + expCode + ", ctPflNo=" + ctPflNo + ", originName="
				+ originName + ", storedName=" + storedName + "]";
	}

	public int getExpFlNo() {
		return expFlNo;
	}

	public void setExpFlNo(int expFlNo) {
		this.expFlNo = expFlNo;
	}

	public String getExpCode() {
		return expCode;
	}

	public void setExpCode(String expCode) {
		this.expCode = expCode;
	}

	public int getCtPflNo() {
		return ctPflNo;
	}

	public void setCtPflNo(int ctPflNo) {
		this.ctPflNo = ctPflNo;
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

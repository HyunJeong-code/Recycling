package recycling.dto.seller;

public class PrdFile {
	
	private int prdFlNo;
	private int ctPflNo;
	private String prdCode;
	private String originName;
	private String storedName;
	
	public PrdFile() {}

	public PrdFile(int prdFlNo, int ctPflNo, String prdCode, String originName, String storedName) {
		this.prdFlNo = prdFlNo;
		this.ctPflNo = ctPflNo;
		this.prdCode = prdCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "PrdFile [prdFlNo=" + prdFlNo + ", ctPflNo=" + ctPflNo + ", prdCode=" + prdCode + ", originName="
				+ originName + ", storedName=" + storedName + "]";
	}

	public int getPrdFlNo() {
		return prdFlNo;
	}

	public void setPrdFlNo(int prdFlNo) {
		this.prdFlNo = prdFlNo;
	}

	public int getCtPflNo() {
		return ctPflNo;
	}

	public void setCtPflNo(int ctPflNo) {
		this.ctPflNo = ctPflNo;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
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

package recycling.dto.buyer;

public class QstFile {
	
	private int qstFlNo;
	private String qstCode;
	private String originName;
	private String storedName;
	
	public QstFile() {}

	public QstFile(int qstFlNo, String qstCode, String originName, String storedName) {
		this.qstFlNo = qstFlNo;
		this.qstCode = qstCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "QstFile [qstFlNo=" + qstFlNo + ", qstCode=" + qstCode + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getQstFlNo() {
		return qstFlNo;
	}

	public void setQstFlNo(int qstFlNo) {
		this.qstFlNo = qstFlNo;
	}

	public String getQstCode() {
		return qstCode;
	}

	public void setQstCode(String qstCode) {
		this.qstCode = qstCode;
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

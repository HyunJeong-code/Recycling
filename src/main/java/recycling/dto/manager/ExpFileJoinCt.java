package recycling.dto.manager;

public class ExpFileJoinCt {

	//expfile
	private int expFlNo;
	private String expCode;
	private int ctPflNo;
	private String originName;
	private String storedName;
	
	//prdfilect
	private String ctPflName;
	
	public ExpFileJoinCt() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ExpFileJoinCt [expFlNo=" + expFlNo + ", expCode=" + expCode + ", ctPflNo=" + ctPflNo + ", originName="
				+ originName + ", storedName=" + storedName + ", ctPflName=" + ctPflName + "]";
	}

	public ExpFileJoinCt(int expFlNo, String expCode, int ctPflNo, String originName, String storedName,
			String ctPflName) {
		super();
		this.expFlNo = expFlNo;
		this.expCode = expCode;
		this.ctPflNo = ctPflNo;
		this.originName = originName;
		this.storedName = storedName;
		this.ctPflName = ctPflName;
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

	public String getCtPflName() {
		return ctPflName;
	}

	public void setCtPflName(String ctPflName) {
		this.ctPflName = ctPflName;
	}
	
	
}

package recycling.dto.buyer;

public class BuyerProf {
	
	private int bProfNo;
	private String bCode;
	private String originName;
	private String storedName;
	
	public BuyerProf() {}

	public BuyerProf(int bProfNo, String bCode, String originName, String storedName) {
		this.bProfNo = bProfNo;
		this.bCode = bCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "BuyerProf [bProfNo=" + bProfNo + ", bCode=" + bCode + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getbProfNo() {
		return bProfNo;
	}

	public void setbProfNo(int bProfNo) {
		this.bProfNo = bProfNo;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
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

package recycling.dto.seller;

public class SellerProf {
	
	private int sProfNo;
	private String sCode;
	private String originName;
	private String storedName;
	
	public SellerProf() {}

	public SellerProf(int sProfNo, String sCode, String originName, String storedName) {
		this.sProfNo = sProfNo;
		this.sCode = sCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "SellerProf [sProfNo=" + sProfNo + ", sCode=" + sCode + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}

	public int getsProfNo() {
		return sProfNo;
	}

	public void setsProfNo(int sProfNo) {
		this.sProfNo = sProfNo;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
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

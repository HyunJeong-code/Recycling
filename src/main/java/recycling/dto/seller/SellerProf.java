package recycling.dto.seller;

public class SellerProf {
	
	private int sProfNo;
	private String sCode;
	private String originName;
	private String storedName;
	private String sTier;	//판매자 등급
	private double sRating;	//판매자 평점
	private int totalTransaction;	//총거래횟수
	
	public SellerProf() {}

	public SellerProf(int sProfNo, String sCode, String originName, String storedName, String sTier, double sRating,
			int totalTransaction) {
		super();
		this.sProfNo = sProfNo;
		this.sCode = sCode;
		this.originName = originName;
		this.storedName = storedName;
		this.sTier = sTier;
		this.sRating = sRating;
		this.totalTransaction = totalTransaction;
	}

	@Override
	public String toString() {
		return "SellerProf [sProfNo=" + sProfNo + ", sCode=" + sCode + ", originName=" + originName + ", storedName="
				+ storedName + ", sTier=" + sTier + ", sRating=" + sRating + ", totalTransaction=" + totalTransaction
				+ "]";
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

	public String getsTier() {
		return sTier;
	}

	public void setsTier(String sTier) {
		this.sTier = sTier;
	}

	public double getsRating() {
		return sRating;
	}

	public void setsRating(double sRating) {
		this.sRating = sRating;
	}

	public int getTotalTransaction() {
		return totalTransaction;
	}

	public void setTotalTransaction(int totalTransaction) {
		this.totalTransaction = totalTransaction;
	}


}

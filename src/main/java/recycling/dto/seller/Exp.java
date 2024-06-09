package recycling.dto.seller;

public class Exp {
	
	private String expCode;
	private String sCode;
	private String expName;
	private int expPrice;
	private String expDetail;
	private int expHit;
	private String expDate;
	
	public Exp() {}

	public Exp(String expCode, String sCode, String expName, int expPrice, String expDetail, int expHit,
			String expDate) {
		this.expCode = expCode;
		this.sCode = sCode;
		this.expName = expName;
		this.expPrice = expPrice;
		this.expDetail = expDetail;
		this.expHit = expHit;
		this.expDate = expDate;
	}
	
	@Override
	public String toString() {
		return "Exp [expCode=" + expCode + ", sCode=" + sCode + ", expName=" + expName + ", expPrice=" + expPrice
				+ ", expDetail=" + expDetail + ", expHit=" + expHit + ", expDate=" + expDate + "]";
	}

	public String getExpCode() {
		return expCode;
	}

	public void setExpCode(String expCode) {
		this.expCode = expCode;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getExpName() {
		return expName;
	}

	public void setExpName(String expName) {
		this.expName = expName;
	}

	public int getExpPrice() {
		return expPrice;
	}

	public void setExpPrice(int expPrice) {
		this.expPrice = expPrice;
	}

	public String getExpDetail() {
		return expDetail;
	}

	public void setExpDetail(String expDetail) {
		this.expDetail = expDetail;
	}

	public int getExpHit() {
		return expHit;
	}

	public void setExpHit(int expHit) {
		this.expHit = expHit;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
}

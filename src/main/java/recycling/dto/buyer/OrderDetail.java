package recycling.dto.buyer;

public class OrderDetail {
	
	private String orddtCode;
	private String ordCode;
	private String prdCode;
	private String ordName;
	private int ordPrice;
	private int ordCnt;
	private int ordSum;
	
	public OrderDetail() {}

	public OrderDetail(String orddtCode, String ordCode, String prdCode, String ordName, int ordPrice, int ordCnt) {
		this.orddtCode = orddtCode;
		this.ordCode = ordCode;
		this.prdCode = prdCode;
		this.ordName = ordName;
		this.ordPrice = ordPrice;
		this.ordCnt = ordCnt;
		this.ordSum = (ordPrice * ordCnt);
	}

	@Override
	public String toString() {
		return "OrderDetail [orddtCode=" + orddtCode + ", ordCode=" + ordCode + ", prdCode=" + prdCode + ", ordName="
				+ ordName + ", ordPrice=" + ordPrice + ", ordCnt=" + ordCnt + ", ordSum=" + ordSum + "]";
	}

	public String getOrddtCode() {
		return orddtCode;
	}

	public void setOrddtCode(String orddtCode) {
		this.orddtCode = orddtCode;
	}

	public String getOrdCode() {
		return ordCode;
	}

	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getOrdName() {
		return ordName;
	}

	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}

	public int getOrdPrice() {
		return ordPrice;
	}

	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}

	public int getOrdCnt() {
		return ordCnt;
	}

	public void setOrdCnt(int ordCnt) {
		this.ordCnt = ordCnt;
	}

	public int getOrdSum() {
		return ordSum;
	}

	public void setOrdSum(int ordSum) {
		this.ordSum = ordSum;
	}
}

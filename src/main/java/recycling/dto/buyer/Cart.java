package recycling.dto.buyer;

public class Cart {
	
	private String cCode;
	private String prdCode;
	private String bCode;
	private int cCnt;
	private String cDate;
	
	public Cart() {}

	public Cart(String cCode, String prdCode, String bCode, int cCnt, String cDate) {
		this.cCode = cCode;
		this.prdCode = prdCode;
		this.bCode = bCode;
		this.cCnt = cCnt;
		this.cDate = cDate;
	}

	@Override
	public String toString() {
		return "Cart [cCode=" + cCode + ", prdCode=" + prdCode + ", bCode=" + bCode + ", cCnt=" + cCnt + ", cDate="
				+ cDate + "]";
	}

	public String getcCode() {
		return cCode;
	}

	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public int getcCnt() {
		return cCnt;
	}

	public void setcCnt(int cCnt) {
		this.cCnt = cCnt;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
}

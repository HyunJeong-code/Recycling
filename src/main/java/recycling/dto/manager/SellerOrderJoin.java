package recycling.dto.manager;

public class SellerOrderJoin {
	
	//prd
	private String prdCode;
	private int ctPno;
	private int ctPdtNo;
	private String sCode;
	private String prdName;
	private int price;
	private int prdCnt;
	private int prdFee;

	private String prdDate;
	private int prdHit;
	private String prdOut;

	// order_detail
	private String orddtCode;

	//orders
	private String ordCode;
	private String ordDate;

	//order_stt
	private int sttNo;
	private String sttName;
	
	public SellerOrderJoin() {
	}

	@Override
	public String toString() {
		return "SellerOrderJoin [prdCode=" + prdCode + ", ctPno=" + ctPno + ", ctPdtNo=" + ctPdtNo + ", sCode=" + sCode
				+ ", prdName=" + prdName + ", price=" + price + ", prdCnt=" + prdCnt + ", prdFee=" + prdFee
				+ ", prdDate=" + prdDate + ", prdHit=" + prdHit + ", prdOut=" + prdOut + ", orddtCode=" + orddtCode
				+ ", ordCode=" + ordCode + ", ordDate=" + ordDate + ", sttNo=" + sttNo + ", sttName=" + sttName + "]";
	}

	public SellerOrderJoin(String prdCode, int ctPno, int ctPdtNo, String sCode, String prdName, int price, int prdCnt,
			int prdFee, String prdDate, int prdHit, String prdOut, String orddtCode, String ordCode, String ordDate,
			int sttNo, String sttName) {
		super();
		this.prdCode = prdCode;
		this.ctPno = ctPno;
		this.ctPdtNo = ctPdtNo;
		this.sCode = sCode;
		this.prdName = prdName;
		this.price = price;
		this.prdCnt = prdCnt;
		this.prdFee = prdFee;
		this.prdDate = prdDate;
		this.prdHit = prdHit;
		this.prdOut = prdOut;
		this.orddtCode = orddtCode;
		this.ordCode = ordCode;
		this.ordDate = ordDate;
		this.sttNo = sttNo;
		this.sttName = sttName;
	}

	public String getPrdCode() {
		return prdCode;
	}

	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}

	public int getCtPno() {
		return ctPno;
	}

	public void setCtPno(int ctPno) {
		this.ctPno = ctPno;
	}

	public int getCtPdtNo() {
		return ctPdtNo;
	}

	public void setCtPdtNo(int ctPdtNo) {
		this.ctPdtNo = ctPdtNo;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getPrdName() {
		return prdName;
	}

	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPrdCnt() {
		return prdCnt;
	}

	public void setPrdCnt(int prdCnt) {
		this.prdCnt = prdCnt;
	}

	public int getPrdFee() {
		return prdFee;
	}

	public void setPrdFee(int prdFee) {
		this.prdFee = prdFee;
	}

	public String getPrdDate() {
		return prdDate;
	}

	public void setPrdDate(String prdDate) {
		this.prdDate = prdDate;
	}

	public int getPrdHit() {
		return prdHit;
	}

	public void setPrdHit(int prdHit) {
		this.prdHit = prdHit;
	}

	public String getPrdOut() {
		return prdOut;
	}

	public void setPrdOut(String prdOut) {
		this.prdOut = prdOut;
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

	public String getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}

	public int getSttNo() {
		return sttNo;
	}

	public void setSttNo(int sttNo) {
		this.sttNo = sttNo;
	}

	public String getSttName() {
		return sttName;
	}

	public void setSttName(String sttName) {
		this.sttName = sttName;
	}
}

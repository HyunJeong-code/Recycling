package recycling.dto.buyer;

public class PrdImg {
   private String prdCode;
   private int ctPno;
   private int ctPdtNo;
   private String sCode;
   private String prdName;
   private int price;
   private int prdCnt;
   private int prdFee;
   private String prdDetail;
   private String prdDate;
   private int prdHit;
   private String prdOut;
   private int prdFlNo;
   private int ctPelNo;
   private String storedName;
   
   public PrdImg() {}

	public PrdImg(String prdCode, int ctPno, int ctPdtNo, String sCode, String prdName, int price, int prdCnt, int prdFee,
			String prdDetail, String prdDate, int prdHit, String prdOut, int prdFlNo, int ctPelNo, String storedName) {
		super();
		this.prdCode = prdCode;
		this.ctPno = ctPno;
		this.ctPdtNo = ctPdtNo;
		this.sCode = sCode;
		this.prdName = prdName;
		this.price = price;
		this.prdCnt = prdCnt;
		this.prdFee = prdFee;
		this.prdDetail = prdDetail;
		this.prdDate = prdDate;
		this.prdHit = prdHit;
		this.prdOut = prdOut;
		this.prdFlNo = prdFlNo;
		this.ctPelNo = ctPelNo;
		this.storedName = storedName;
	}
	
	@Override
	public String toString() {
		return "PrdImg [prdCode=" + prdCode + ", ctPno=" + ctPno + ", ctPdtNo=" + ctPdtNo + ", sCode=" + sCode
				+ ", prdName=" + prdName + ", price=" + price + ", prdCnt=" + prdCnt + ", prdFee=" + prdFee + ", prdDetail="
				+ prdDetail + ", prdDate=" + prdDate + ", prdHit=" + prdHit + ", prdOut=" + prdOut + ", prdFlNo=" + prdFlNo
				+ ", ctPelNo=" + ctPelNo + ", storedName=" + storedName + "]";
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
	
	public String getPrdDetail() {
		return prdDetail;
	}
	
	public void setPrdDetail(String prdDetail) {
		this.prdDetail = prdDetail;
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
	
	public int getPrdFlNo() {
		return prdFlNo;
	}
	
	public void setPrdFlNo(int prdFlNo) {
		this.prdFlNo = prdFlNo;
	}
	
	public int getCtPelNo() {
		return ctPelNo;
	}
	
	public void setCtPelNo(int ctPelNo) {
		this.ctPelNo = ctPelNo;
	}
	
	public String getStoredName() {
		return storedName;
	}
	
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
}

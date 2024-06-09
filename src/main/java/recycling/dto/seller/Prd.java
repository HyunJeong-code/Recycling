package recycling.dto.seller;

public class Prd {
   
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
   
   public Prd() {}

   public Prd(String prdCode, int ctPno, int ctPdtNo, String sCode, String prdName, int price, int prdCnt, int prdFee,
         String prdDetail, String prdDate, int prdHit, String prdOut) {
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
   }

   @Override
   public String toString() {
      return "Prd [prdCode=" + prdCode + ", ctPno=" + ctPno + ", ctPdtNo=" + ctPdtNo + ", sCode=" + sCode
            + ", prdName=" + prdName + ", price=" + price + ", prdCnt=" + prdCnt + ", prdFee=" + prdFee
            + ", prdDetail=" + prdDetail + ", prdDate=" + prdDate + ", prdHit=" + prdHit + ", prdOut=" + prdOut
            + "]";
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
}

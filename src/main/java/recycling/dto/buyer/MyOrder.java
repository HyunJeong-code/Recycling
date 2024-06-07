package recycling.dto.buyer;

public class MyOrder {
	
	private String orddtCode;
	private String ordCode;
	private String prdCode;
	private String ordName;
	private String sendName;
	private String sendPhone;
	private String ordPostcode;
	private String ordAddr;
	private String ordDetail;
	private String ordMemo;
	private int ordPrice;
	private int ordCnt;
	private int ordSum;
	private int sttNo;
	private String ordDate;
	private String shipName;
	private String shipNo;
	
	public MyOrder() {}

	public MyOrder(String orddtCode, String ordCode, String prdCode, String ordName, String sendName, String sendPhone,
			String ordPostcode, String ordAddr, String ordDetail, String ordMemo, int ordPrice, int ordCnt, int ordSum,
			int sttNo, String ordDate, String shipName, String shipNo) {
		super();
		this.orddtCode = orddtCode;
		this.ordCode = ordCode;
		this.prdCode = prdCode;
		this.ordName = ordName;
		this.sendName = sendName;
		this.sendPhone = sendPhone;
		this.ordPostcode = ordPostcode;
		this.ordAddr = ordAddr;
		this.ordDetail = ordDetail;
		this.ordMemo = ordMemo;
		this.ordPrice = ordPrice;
		this.ordCnt = ordCnt;
		this.ordSum = ordSum;
		this.sttNo = sttNo;
		this.ordDate = ordDate;
		this.shipName = shipName;
		this.shipNo = shipNo;
	}

	@Override
	public String toString() {
		return "MyOrder [orddtCode=" + orddtCode + ", ordCode=" + ordCode + ", prdCode=" + prdCode + ", ordName="
				+ ordName + ", sendName=" + sendName + ", sendPhone=" + sendPhone + ", ordPostcode=" + ordPostcode
				+ ", ordAddr=" + ordAddr + ", ordDetail=" + ordDetail + ", ordMemo=" + ordMemo + ", ordPrice="
				+ ordPrice + ", ordCnt=" + ordCnt + ", ordSum=" + ordSum + ", sttNo=" + sttNo + ", ordDate=" + ordDate
				+ ", shipName=" + shipName + ", shipNo=" + shipNo + "]";
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

	public String getSendName() {
		return sendName;
	}

	public void setSendName(String sendName) {
		this.sendName = sendName;
	}

	public String getSendPhone() {
		return sendPhone;
	}

	public void setSendPhone(String sendPhone) {
		this.sendPhone = sendPhone;
	}

	public String getOrdPostcode() {
		return ordPostcode;
	}

	public void setOrdPostcode(String ordPostcode) {
		this.ordPostcode = ordPostcode;
	}

	public String getOrdAddr() {
		return ordAddr;
	}

	public void setOrdAddr(String ordAddr) {
		this.ordAddr = ordAddr;
	}

	public String getOrdDetail() {
		return ordDetail;
	}

	public void setOrdDetail(String ordDetail) {
		this.ordDetail = ordDetail;
	}

	public String getOrdMemo() {
		return ordMemo;
	}

	public void setOrdMemo(String ordMemo) {
		this.ordMemo = ordMemo;
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

	public int getSttNo() {
		return sttNo;
	}

	public void setSttNo(int sttNo) {
		this.sttNo = sttNo;
	}

	public String getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getShipNo() {
		return shipNo;
	}

	public void setShipNo(String shipNo) {
		this.shipNo = shipNo;
	}
}
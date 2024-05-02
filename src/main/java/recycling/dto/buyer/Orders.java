package recycling.dto.buyer;

public class Orders {
	
	private String ordCode;
	private String bCode;
	private String ordName;
	private String ordPhone;
	private String sendName;
	private String sendPhone;
	private String ordPostcode;
	private String ordAddr;
	private String ordDetail;
	private String ordMemo;
	private String ordDate;
	private String ordPay;
	private int ordSum; // ordFee와 상세주문들 총 금액의 합
	private int ordFee;
	private int sttNo;

	public Orders(String ordCode, String bCode, String ordName, String ordPhone, String sendName, String sendPhone,
			String ordPostcode, String ordAddr, String ordDetail, String ordMemo, String ordDate, String ordPay,
			int ordSum, int ordFee, int sttNo) {
		super();
		this.ordCode = ordCode;
		this.bCode = bCode;
		this.ordName = ordName;
		this.ordPhone = ordPhone;
		this.sendName = sendName;
		this.sendPhone = sendPhone;
		this.ordPostcode = ordPostcode;
		this.ordAddr = ordAddr;
		this.ordDetail = ordDetail;
		this.ordMemo = ordMemo;
		this.ordDate = ordDate;
		this.ordPay = ordPay;
		this.ordSum = ordSum;
		this.ordFee = ordFee;
		this.sttNo = sttNo;
	}

	@Override
	public String toString() {
		return "Orders [ordCode=" + ordCode + ", bCode=" + bCode + ", ordName=" + ordName + ", ordPhone=" + ordPhone
				+ ", sendName=" + sendName + ", sendPhone=" + sendPhone + ", ordPostcode=" + ordPostcode + ", ordAddr="
				+ ordAddr + ", ordDetail=" + ordDetail + ", ordMemo=" + ordMemo + ", ordDate=" + ordDate + ", ordPay="
				+ ordPay + ", ordSum=" + ordSum + ", ordFee=" + ordFee + ", sttNo=" + sttNo + "]";
	}

	public String getOrdCode() {
		return ordCode;
	}

	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getOrdName() {
		return ordName;
	}

	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}

	public String getOrdPhone() {
		return ordPhone;
	}

	public void setOrdPhone(String ordPhone) {
		this.ordPhone = ordPhone;
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

	public String getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}

	public String getOrdPay() {
		return ordPay;
	}

	public void setOrdPay(String ordPay) {
		this.ordPay = ordPay;
	}

	public int getOrdSum() {
		return ordSum;
	}

	public void setOrdSum(int ordSum) {
		this.ordSum = ordSum;
	}

	public int getOrdFee() {
		return ordFee;
	}

	public void setOrdFee(int ordFee) {
		this.ordFee = ordFee;
	}

	public int getSttNo() {
		return sttNo;
	}

	public void setSttNo(int sttNo) {
		this.sttNo = sttNo;
	}
}

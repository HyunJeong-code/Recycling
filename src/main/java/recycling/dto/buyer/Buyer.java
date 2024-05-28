package recycling.dto.buyer;

public class Buyer {
	
	private String bCode;
	private String bCtCode;
	private int rankNo;
	private String bId;
	private String bPw;
	private String bName;
	private String bPhone;
	private String bEmail;
	private String bEntDate;
	private String adSms;
	private String adEmail;
	private String bOut;
	private String bOutDate;
	
	public Buyer() {}

	public Buyer(String bCode, String bCtCode, int rankNo, String bId, String bPw, String bName, String bPhone,
			String bEmail, String bEntDate, String adSms, String adEmail, String bOut, String bOutDate) {
		this.bCode = bCode;
		this.bCtCode = bCtCode;
		this.rankNo = rankNo;
		this.bId = bId;
		this.bPw = bPw;
		this.bName = bName;
		this.bPhone = bPhone;
		this.bEmail = bEmail;
		this.bEntDate = bEntDate;
		this.adSms = adSms;
		this.adEmail = adEmail;
		this.bOut = bOut;
		this.bOutDate = bOutDate;
	}

	@Override
	public String toString() {
		return "Buyer [bCode=" + bCode + ", bCtCode=" + bCtCode + ", rankNo=" + rankNo + ", bId=" + bId + ", bPw="
				+ bPw + ", bName=" + bName + ", bPhone=" + bPhone + ", bEmail=" + bEmail + ", bEntDate=" + bEntDate
				+ ", adSms=" + adSms + ", adEmail=" + adEmail + ", bOut=" + bOut + ", bOutDate=" + bOutDate + "]";
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getbCtCode() {
		return bCtCode;
	}

	public void setbCtCode(String bCtCode) {
		this.bCtCode = bCtCode;
	}

	public int getRankNo() {
		return rankNo;
	}

	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public String getbPw() {
		return bPw;
	}

	public void setbPw(String bPw) {
		this.bPw = bPw;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbPhone() {
		return bPhone;
	}

	public void setbPhone(String bPhone) {
		this.bPhone = bPhone;
	}

	public String getbEmail() {
		return bEmail;
	}

	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}

	public String getbEntDate() {
		return bEntDate;
	}

	public void setbEntDate(String bEntDate) {
		this.bEntDate = bEntDate;
	}

	public String getAdSms() {
		return adSms;
	}

	public void setAdSms(String adSms) {
		this.adSms = adSms;
	}

	public String getAdEmail() {
		return adEmail;
	}

	public void setAdEmail(String adEmail) {
		this.adEmail = adEmail;
	}

	public String getbOut() {
		return bOut;
	}

	public void setbOut(String bOut) {
		this.bOut = bOut;
	}

	public String getbOutDate() {
		return bOutDate;
	}

	public void setbOutDate(String bOutDate) {
		this.bOutDate = bOutDate;
	}
}
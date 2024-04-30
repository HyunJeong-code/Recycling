package recycling.dto.manager;

public class WashAd {
	
	private String adCode;
	private int ctAdNo;
	private String wCode;
	private String mgrCode;
	private String adDetail;
	private String adDate;
	private int adHit;
	
	public WashAd() {}

	public WashAd(String adCode, int ctAdNo, String wCode, String mgrCode, String adDetail, String adDate, int adHit) {
		this.adCode = adCode;
		this.ctAdNo = ctAdNo;
		this.wCode = wCode;
		this.mgrCode = mgrCode;
		this.adDetail = adDetail;
		this.adDate = adDate;
		this.adHit = adHit;
	}

	@Override
	public String toString() {
		return "WashAd [adCode=" + adCode + ", ctAdNo=" + ctAdNo + ", wCode=" + wCode + ", mgrCode=" + mgrCode
				+ ", adDetail=" + adDetail + ", adDate=" + adDate + ", adHit=" + adHit + "]";
	}

	public String getAdCode() {
		return adCode;
	}

	public void setAdCode(String adCode) {
		this.adCode = adCode;
	}

	public int getCtAdNo() {
		return ctAdNo;
	}

	public void setCtAdNo(int ctAdNo) {
		this.ctAdNo = ctAdNo;
	}

	public String getwCode() {
		return wCode;
	}

	public void setwCode(String wCode) {
		this.wCode = wCode;
	}

	public String getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(String mgrCode) {
		this.mgrCode = mgrCode;
	}

	public String getAdDetail() {
		return adDetail;
	}

	public void setAdDetail(String adDetail) {
		this.adDetail = adDetail;
	}

	public String getAdDate() {
		return adDate;
	}

	public void setAdDate(String adDate) {
		this.adDate = adDate;
	}

	public int getAdHit() {
		return adHit;
	}

	public void setAdHit(int adHit) {
		this.adHit = adHit;
	}
}

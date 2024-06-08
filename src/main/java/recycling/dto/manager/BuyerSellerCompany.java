package recycling.dto.manager;

import java.util.Date;

public class BuyerSellerCompany {

	private String bCode;
    private String bCtCode;
    private int rankNo;
    private String bId;
    private String bPw;
    private String bName;
    private String bPhone;
    private String bEmail;
    private Date bEntdate;
    private String adSms;
    private String adEmail;
    private String bOut;
    private Date bOutDate;
    private String sCode;
    private String sAccName;
    private String sAccBank;
    private String sAccNo;
    private String sPostcode;
    private String sAddr;
    private String sDetail;
    private Date sEntdate;
    private String sChk;
    private String sOut;
    private Date sOutDate;
    private String cmpNo;
    private String cmpName;
    private String cmpCeo;
    private String cmpNum;
    private String cmpPostcode;
    private String cmpAddr;
    private String cmpDetail;
    
    public BuyerSellerCompany() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BuyerSellerCompanyDTO [bCode=" + bCode + ", bCtCode=" + bCtCode + ", rankNo=" + rankNo + ", bId=" + bId
				+ ", bPw=" + bPw + ", bName=" + bName + ", bPhone=" + bPhone + ", bEmail=" + bEmail + ", bEntdate="
				+ bEntdate + ", adSms=" + adSms + ", adEmail=" + adEmail + ", bOut=" + bOut + ", bOutDate=" + bOutDate
				+ ", sCode=" + sCode + ", sAccName=" + sAccName + ", sAccBank=" + sAccBank + ", sAccNo=" + sAccNo
				+ ", sPostcode=" + sPostcode + ", sAddr=" + sAddr + ", sDetail=" + sDetail + ", sEntdate=" + sEntdate
				+ ", sChk=" + sChk + ", sOut=" + sOut + ", sOutDate=" + sOutDate + ", cmpNo=" + cmpNo + ", cmpName="
				+ cmpName + ", cmpCeo=" + cmpCeo + ", cmpNum=" + cmpNum + ", cmpPostcode=" + cmpPostcode + ", cmpAddr="
				+ cmpAddr + ", cmpDetail=" + cmpDetail + "]";
	}

	public BuyerSellerCompany(String bCode, String bCtCode, int rankNo, String bId, String bPw, String bName,
			String bPhone, String bEmail, Date bEntdate, String adSms, String adEmail, String bOut, Date bOutDate,
			String sCode, String sAccName, String sAccBank, String sAccNo, String sPostcode, String sAddr,
			String sDetail, Date sEntdate, String sChk, String sOut, Date sOutDate, String cmpNo, String cmpName,
			String cmpCeo, String cmpNum, String cmpPostcode, String cmpAddr, String cmpDetail) {
		super();
		this.bCode = bCode;
		this.bCtCode = bCtCode;
		this.rankNo = rankNo;
		this.bId = bId;
		this.bPw = bPw;
		this.bName = bName;
		this.bPhone = bPhone;
		this.bEmail = bEmail;
		this.bEntdate = bEntdate;
		this.adSms = adSms;
		this.adEmail = adEmail;
		this.bOut = bOut;
		this.bOutDate = bOutDate;
		this.sCode = sCode;
		this.sAccName = sAccName;
		this.sAccBank = sAccBank;
		this.sAccNo = sAccNo;
		this.sPostcode = sPostcode;
		this.sAddr = sAddr;
		this.sDetail = sDetail;
		this.sEntdate = sEntdate;
		this.sChk = sChk;
		this.sOut = sOut;
		this.sOutDate = sOutDate;
		this.cmpNo = cmpNo;
		this.cmpName = cmpName;
		this.cmpCeo = cmpCeo;
		this.cmpNum = cmpNum;
		this.cmpPostcode = cmpPostcode;
		this.cmpAddr = cmpAddr;
		this.cmpDetail = cmpDetail;
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

	public Date getbEntdate() {
		return bEntdate;
	}

	public void setbEntdate(Date bEntdate) {
		this.bEntdate = bEntdate;
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

	public Date getbOutDate() {
		return bOutDate;
	}

	public void setbOutDate(Date bOutDate) {
		this.bOutDate = bOutDate;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public String getsAccName() {
		return sAccName;
	}

	public void setsAccName(String sAccName) {
		this.sAccName = sAccName;
	}

	public String getsAccBank() {
		return sAccBank;
	}

	public void setsAccBank(String sAccBank) {
		this.sAccBank = sAccBank;
	}

	public String getsAccNo() {
		return sAccNo;
	}

	public void setsAccNo(String sAccNo) {
		this.sAccNo = sAccNo;
	}

	public String getsPostcode() {
		return sPostcode;
	}

	public void setsPostcode(String sPostcode) {
		this.sPostcode = sPostcode;
	}

	public String getsAddr() {
		return sAddr;
	}

	public void setsAddr(String sAddr) {
		this.sAddr = sAddr;
	}

	public String getsDetail() {
		return sDetail;
	}

	public void setsDetail(String sDetail) {
		this.sDetail = sDetail;
	}

	public Date getsEntdate() {
		return sEntdate;
	}

	public void setsEntdate(Date sEntdate) {
		this.sEntdate = sEntdate;
	}

	public String getsChk() {
		return sChk;
	}

	public void setsChk(String sChk) {
		this.sChk = sChk;
	}

	public String getsOut() {
		return sOut;
	}

	public void setsOut(String sOut) {
		this.sOut = sOut;
	}

	public Date getsOutDate() {
		return sOutDate;
	}

	public void setsOutDate(Date sOutDate) {
		this.sOutDate = sOutDate;
	}

	public String getCmpNo() {
		return cmpNo;
	}

	public void setCmpNo(String cmpNo) {
		this.cmpNo = cmpNo;
	}

	public String getCmpName() {
		return cmpName;
	}

	public void setCmpName(String cmpName) {
		this.cmpName = cmpName;
	}

	public String getCmpCeo() {
		return cmpCeo;
	}

	public void setCmpCeo(String cmpCeo) {
		this.cmpCeo = cmpCeo;
	}

	public String getCmpNum() {
		return cmpNum;
	}

	public void setCmpNum(String cmpNum) {
		this.cmpNum = cmpNum;
	}

	public String getCmpPostcode() {
		return cmpPostcode;
	}

	public void setCmpPostcode(String cmpPostcode) {
		this.cmpPostcode = cmpPostcode;
	}

	public String getCmpAddr() {
		return cmpAddr;
	}

	public void setCmpAddr(String cmpAddr) {
		this.cmpAddr = cmpAddr;
	}

	public String getCmpDetail() {
		return cmpDetail;
	}

	public void setCmpDetail(String cmpDetail) {
		this.cmpDetail = cmpDetail;
	}
    
    
}

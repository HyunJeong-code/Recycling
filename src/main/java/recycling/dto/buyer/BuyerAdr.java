package recycling.dto.buyer;

public class BuyerAdr {
	
	private String adrCode;
	private String bCode;
	private String adrName;
	private String adrPhone;
	private String adrPostcode;
	private String adrAddr;
	private String adrDetail;
	private String adrChk;
	
	public BuyerAdr() {}

	public BuyerAdr(String adrCode, String bCode, String adrName, String adrPhone, String adrPostcode, String adrAddr,
			String adrDetail, String adrChk) {
		this.adrCode = adrCode;
		this.bCode = bCode;
		this.adrName = adrName;
		this.adrPhone = adrPhone;
		this.adrPostcode = adrPostcode;
		this.adrAddr = adrAddr;
		this.adrDetail = adrDetail;
		this.adrChk = adrChk;
	}

	@Override
	public String toString() {
		return "BuyerAdr [adrCode=" + adrCode + ", bCode=" + bCode + ", adrName=" + adrName + ", adrPhone=" + adrPhone
				+ ", adrPostcode=" + adrPostcode + ", adrAddr=" + adrAddr + ", adrDetail=" + adrDetail + ", adrChk="
				+ adrChk + "]";
	}

	public String getAdrCode() {
		return adrCode;
	}

	public void setAdrCode(String adrCode) {
		this.adrCode = adrCode;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getAdrName() {
		return adrName;
	}

	public void setAdrName(String adrName) {
		this.adrName = adrName;
	}

	public String getAdrPhone() {
		return adrPhone;
	}

	public void setAdrPhone(String adrPhone) {
		this.adrPhone = adrPhone;
	}

	public String getAdrPostcode() {
		return adrPostcode;
	}

	public void setAdrPostcode(String adrPostcode) {
		this.adrPostcode = adrPostcode;
	}

	public String getAdrAddr() {
		return adrAddr;
	}

	public void setAdrAddr(String adrAddr) {
		this.adrAddr = adrAddr;
	}

	public String getAdrDetail() {
		return adrDetail;
	}

	public void setAdrDetail(String adrDetail) {
		this.adrDetail = adrDetail;
	}

	public String getAdrChk() {
		return adrChk;
	}

	public void setAdrChk(String adrChk) {
		this.adrChk = adrChk;
	}
}

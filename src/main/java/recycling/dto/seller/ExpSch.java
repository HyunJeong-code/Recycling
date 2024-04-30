package recycling.dto.seller;

public class ExpSch {
	
	private int schNo;
	private String expCode;
	private String schDate;
	private String schTime;
	private int schCnt;
	
	public ExpSch() {}

	public ExpSch(int schNo, String expCode, String schDate, String schTime, int schCnt) {
		this.schNo = schNo;
		this.expCode = expCode;
		this.schDate = schDate;
		this.schTime = schTime;
		this.schCnt = schCnt;
	}

	@Override
	public String toString() {
		return "ExpSch [schNo=" + schNo + ", expCode=" + expCode + ", schDate=" + schDate + ", schTime=" + schTime
				+ ", schCnt=" + schCnt + "]";
	}

	public int getSchNo() {
		return schNo;
	}

	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}

	public String getExpCode() {
		return expCode;
	}

	public void setExpCode(String expCode) {
		this.expCode = expCode;
	}

	public String getSchDate() {
		return schDate;
	}

	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}

	public String getSchTime() {
		return schTime;
	}

	public void setSchTime(String schTime) {
		this.schTime = schTime;
	}

	public int getSchCnt() {
		return schCnt;
	}

	public void setSchCnt(int schCnt) {
		this.schCnt = schCnt;
	}
}

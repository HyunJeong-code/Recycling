package recycling.dto.manager;

public class FaqCt {
	
	private int ctFaqNo;
	private String ctFaqName;
	
	public FaqCt() {}

	public FaqCt(int ctFaqNo, String ctFaqName) {
		this.ctFaqNo = ctFaqNo;
		this.ctFaqName = ctFaqName;
	}

	@Override
	public String toString() {
		return "FaqCt [ctFaqNo=" + ctFaqNo + ", ctFaqName=" + ctFaqName + "]";
	}

	public int getCtFaqNo() {
		return ctFaqNo;
	}

	public void setCtFaqNo(int ctFaqNo) {
		this.ctFaqNo = ctFaqNo;
	}

	public String getCtFaqName() {
		return ctFaqName;
	}

	public void setCtFaqName(String ctFaqName) {
		this.ctFaqName = ctFaqName;
	}
}

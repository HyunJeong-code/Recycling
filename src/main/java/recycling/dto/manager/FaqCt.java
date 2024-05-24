package recycling.dto.manager;

public class FaqCt {
	
	private int ctFaqno;
	private String ctFaqname;
	
	public FaqCt() {}
	public FaqCt(int ctFaqno, String ctFaqname) {
		super();
		this.ctFaqno = ctFaqno;
		this.ctFaqname = ctFaqname;
	}
	@Override
	public String toString() {
		return "FaqCt [ctFaqno=" + ctFaqno + ", ctFaqname=" + ctFaqname + "]";
	}
	public int getCtFaqno() {
		return ctFaqno;
	}
	public void setCtFaqno(int ctFaqno) {
		this.ctFaqno = ctFaqno;
	}
	public String getCtFaqname() {
		return ctFaqname;
	}
	public void setCtFaqname(String ctFaqname) {
		this.ctFaqname = ctFaqname;
	}
	
	
	
//	private int ctFaqNo;
//	private String ctFaqName;
//	
//	public FaqCt() {}
//
//	public FaqCt(int ctFaqNo, String ctFaqName) {
//		this.ctFaqNo = ctFaqNo;
//		this.ctFaqName = ctFaqName;
//	}
//
//	@Override
//	public String toString() {
//		return "FaqCt [ctFaqNo=" + ctFaqNo + ", ctFaqName=" + ctFaqName + "]";
//	}
//
//	public int getCtFaqNo() {
//		return ctFaqNo;
//	}
//
//	public void setCtFaqNo(int ctFaqNo) {
//		this.ctFaqNo = ctFaqNo;
//	}
//
//	public String getCtFaqName() {
//		return ctFaqName;
//	}
//
//	public void setCtFaqName(String ctFaqName) {
//		this.ctFaqName = ctFaqName;
//	}
}

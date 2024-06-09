package recycling.dto.seller;

public class PrdCt {
	
	private int ctPno;
	private int ctPname;
	
	public PrdCt() {}

	public PrdCt(int ctPno, int ctPname) {
		this.ctPno = ctPno;
		this.ctPname = ctPname;
	}

	@Override
	public String toString() {
		return "PrdCt [ctPno=" + ctPno + ", ctPname=" + ctPname + "]";
	}

	public int getCtPno() {
		return ctPno;
	}

	public void setCtPno(int ctPno) {
		this.ctPno = ctPno;
	}

	public int getCtPname() {
		return ctPname;
	}

	public void setCtPname(int ctPname) {
		this.ctPname = ctPname;
	}
}

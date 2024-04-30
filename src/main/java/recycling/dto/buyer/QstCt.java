package recycling.dto.buyer;

public class QstCt {
	
	private int ctQstNo;
	private String ctQstName;
	
	public QstCt() {}

	public QstCt(int ctQstNo, String ctQstName) {
		this.ctQstNo = ctQstNo;
		this.ctQstName = ctQstName;
	}

	@Override
	public String toString() {
		return "QstCt [ctQstNo=" + ctQstNo + ", ctQstName=" + ctQstName + "]";
	}

	public int getCtQstNo() {
		return ctQstNo;
	}

	public void setCtQstNo(int ctQstNo) {
		this.ctQstNo = ctQstNo;
	}

	public String getCtQstName() {
		return ctQstName;
	}

	public void setCtQstName(String ctQstName) {
		this.ctQstName = ctQstName;
	}
}

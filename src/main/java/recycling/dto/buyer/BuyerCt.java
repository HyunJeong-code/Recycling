package recycling.dto.buyer;

public class BuyerCt {
	
	private String ctBcode;
	private String ctBname;
	
	public BuyerCt() {}

	public BuyerCt(String ctBcode, String ctBname) {
		this.ctBcode = ctBcode;
		this.ctBname = ctBname;
	}

	@Override
	public String toString() {
		return "BuyerCt [ctBcode=" + ctBcode + ", ctBname=" + ctBname + "]";
	}

	public String getCtBcode() {
		return ctBcode;
	}

	public void setCtBcode(String ctBcode) {
		this.ctBcode = ctBcode;
	}

	public String getCtBname() {
		return ctBname;
	}

	public void setCtBname(String ctBname) {
		this.ctBname = ctBname;
	}
}

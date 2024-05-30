package recycling.dto.seller;

public class OrderStt {
	
	private int sttNo;
	private String sttName;
	
	public OrderStt() {}

	public OrderStt(int sttNo, String sttName) {
		this.sttNo = sttNo;
		this.sttName = sttName;
	}

	@Override
	public String toString() {
		return "OrderStt [sttNo=" + sttNo + ", sttName=" + sttName + "]";
	}

	public int getSttNo() {
		return sttNo;
	}

	public void setSttNo(int sttNo) {
		this.sttNo = sttNo;
	}

	public String getSttName() {
		return sttName;
	}

	public void setSttName(String sttName) {
		this.sttName = sttName;
	}
}

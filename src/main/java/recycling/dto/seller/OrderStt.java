package recycling.dto.seller;

public class OrderStt {
	
	private int sttNo;
	private int sttName;
	
	public OrderStt() {}

	public OrderStt(int sttNo, int sttName) {
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

	public int getSttName() {
		return sttName;
	}

	public void setSttName(int sttName) {
		this.sttName = sttName;
	}
}

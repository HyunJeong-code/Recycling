package recycling.dto.seller;

public class Ship {

	private String shipCode;
	private String ordCode;
	private String shipName;
	private int shipNo;
	private String shipDate;
	
	public Ship() {}

	public Ship(String shipCode, String ordCode, String shipName, int shipNo, String shipDate) {
		this.shipCode = shipCode;
		this.ordCode = ordCode;
		this.shipName = shipName;
		this.shipNo = shipNo;
		this.shipDate = shipDate;
	}

	@Override
	public String toString() {
		return "Ship [shipCode=" + shipCode + ", ordCode=" + ordCode + ", shipName=" + shipName + ", shipNo=" + shipNo
				+ ", shipDate=" + shipDate + "]";
	}

	public String getShipCode() {
		return shipCode;
	}

	public void setShipCode(String shipCode) {
		this.shipCode = shipCode;
	}

	public String getOrdCode() {
		return ordCode;
	}

	public void setOrdCode(String ordCode) {
		this.ordCode = ordCode;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public int getShipNo() {
		return shipNo;
	}

	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}

	public String getShipDate() {
		return shipDate;
	}

	public void setShipDate(String shipDate) {
		this.shipDate = shipDate;
	}
}

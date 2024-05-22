package recycling.dto.seller;

public class AllPrd {
	
	private String code;
	private String lCtg; // 대분류(재활용품, 새활용, 체험)
	private String sCtg; // 소분류(상품 분류, 체험은 '-'로 사용)
	private String name;
	private String price;
	private String entDate;
	private String stt;
	
	public AllPrd() {}

	public AllPrd(String code, String lCtg, String sCtg, String name, String price, String entDate, String stt) {
		this.code = code;
		this.lCtg = lCtg;
		this.sCtg = sCtg;
		this.name = name;
		this.price = price;
		this.entDate = entDate;
		this.stt = stt;
	}

	@Override
	public String toString() {
		return "AllPrd [code=" + code + ", lCtg=" + lCtg + ", sCtg=" + sCtg + ", name=" + name + ", price=" + price
				+ ", entDate=" + entDate + ", stt=" + stt + "]";
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getlCtg() {
		return lCtg;
	}

	public void setlCtg(String lCtg) {
		this.lCtg = lCtg;
	}

	public String getsCtg() {
		return sCtg;
	}

	public void setsCtg(String sCtg) {
		this.sCtg = sCtg;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getEntDate() {
		return entDate;
	}

	public void setEntDate(String entDate) {
		this.entDate = entDate;
	}

	public String getStt() {
		return stt;
	}

	public void setStt(String stt) {
		this.stt = stt;
	}
}

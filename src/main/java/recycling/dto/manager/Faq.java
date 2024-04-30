package recycling.dto.manager;

public class Faq {
	
	private int faqNo;
	private int ctFaqNo;
	private String faqTitle;
	private String faqAns;
	
	public Faq() {}

	public Faq(int faqNo, int ctFaqNo, String faqTitle, String faqAns) {
		this.faqNo = faqNo;
		this.ctFaqNo = ctFaqNo;
		this.faqTitle = faqTitle;
		this.faqAns = faqAns;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", ctFaqNo=" + ctFaqNo + ", faqTitle=" + faqTitle + ", faqAns=" + faqAns + "]";
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public int getCtFaqNo() {
		return ctFaqNo;
	}

	public void setCtFaqNo(int ctFaqNo) {
		this.ctFaqNo = ctFaqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqAns() {
		return faqAns;
	}

	public void setFaqAns(String faqAns) {
		this.faqAns = faqAns;
	}
}

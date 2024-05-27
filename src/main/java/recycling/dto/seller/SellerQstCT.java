package recycling.dto.seller;

public class SellerQstCT {
	
	private int CTqstno; // 판매자 문의 분류코드
    private String CTqstName; // 문의 분류 이름 (상품 문의, 결제 문의, 배송문의, 기타 로 분류)
    
    public SellerQstCT() {
	}

	@Override
	public String toString() {
		return "SellerQstCT [CTqstno=" + CTqstno + ", CTqstName=" + CTqstName + "]";
	}

	public SellerQstCT(int cTqstno, String cTqstName) {
		super();
		CTqstno = cTqstno;
		CTqstName = cTqstName;
	}

	public int getCTqstno() {
		return CTqstno;
	}

	public void setCTqstno(int cTqstno) {
		CTqstno = cTqstno;
	}

	public String getCTqstName() {
		return CTqstName;
	}

	public void setCTqstName(String cTqstName) {
		CTqstName = cTqstName;
	}

}

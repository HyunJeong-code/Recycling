package recycling.dto.seller;

public class SellerQstFile {

	private int qstFileNo; // 판매자 문의 첨부 파일 번호 (시퀸스 사용, 단 문의글 삭제 시 같이 삭제)
    private String qstCode; // 판매자 문의코드
    private String originName; // 원래이름
    private String storedName; // 저장이름
    
    public SellerQstFile() {
	}

	@Override
	public String toString() {
		return "SellerQstFile [qstFileNo=" + qstFileNo + ", qstCode=" + qstCode + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}

	public SellerQstFile(int qstFileNo, String qstCode, String originName, String storedName) {
		super();
		this.qstFileNo = qstFileNo;
		this.qstCode = qstCode;
		this.originName = originName;
		this.storedName = storedName;
	}

	public int getQstFileNo() {
		return qstFileNo;
	}

	public void setQstFileNo(int qstFileNo) {
		this.qstFileNo = qstFileNo;
	}

	public String getQstCode() {
		return qstCode;
	}

	public void setQstCode(String qstCode) {
		this.qstCode = qstCode;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
    
	
}

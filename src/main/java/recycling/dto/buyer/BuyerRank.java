package recycling.dto.buyer;

public class BuyerRank {
	
	private int rankNo;
	private String rankName;
	
	public BuyerRank() {}

	public BuyerRank(int rankNo, String rankName) {
		this.rankNo = rankNo;
		this.rankName = rankName;
	}

	@Override
	public String toString() {
		return "BuyerRank [rankNo=" + rankNo + ", rankName=" + rankName + "]";
	}

	public int getRankNo() {
		return rankNo;
	}

	public void setRankNo(int rankNo) {
		this.rankNo = rankNo;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
}

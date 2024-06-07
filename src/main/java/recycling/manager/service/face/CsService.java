package recycling.manager.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.BuyerRank;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Manager;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 구매 CS팀 관련 처리
public interface CsService {

	/**
	 * 문의 목록
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Oto> list(PagingAndCtg upPaging);
	
	/**
	 * 문의 페이징
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllotoList(PagingAndCtg upPaging);

	/**
	 * 구매자 페이징
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntAllbuyerList(PagingAndCtg upPaging);

	/**
	 * 구매자 목록
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Buyer> buyerList(PagingAndCtg upPaging);

	/**
	 * 구매자 상세
	 * 
	 * @param buyer
	 * @return
	 */
	public Buyer buyerDetail(Buyer buyer);
	
	/**
	 * 구매자 주소 조회
	 * 
	 * @param buyerAdr
	 * @return
	 */
	public BuyerAdr buyerAdrDetail(BuyerAdr buyerAdr);
	
	/**
	 * 구매자 프로필 조회
	 * 
	 * @param buyerProf
	 * @return
	 */
	public BuyerProf buyerProfDetail(BuyerProf buyerProf);

	/**
	 * 구매자 등급 조회
	 * 
	 * @param buyerRank
	 * @return
	 */
	public BuyerRank buyerRankDetail(BuyerRank buyerRank);

	/**
	 * 구매자 수정
	 * buyerUpdate
	 * 
	 * @param buyer
	 * @return
	 */
//	public Buyer getBuyer(String bCode);
	
	/**
	 * 구매자 수정
	 * buyerUpdateForm
	 * 
	 * @param buyer
	 */
//	public void buyerUpdate(Buyer buyer);

	/**
	 * 구매자 삭제
	 * 
	 * @param bCode
	 * @return 
	 */
	public void buyerDel(Buyer buyer);

	/**
	 * 문의글 상세조회
	 * 
	 * @param otoCode
	 * @return
	 */
	public Oto ansForm(String otoCode);

	/**
	 * 문의 답변 작성
	 * 
	 * @param mgrCode
	 * @param ansCode
	 * @param ansContent
	 * @param otoCode 
	 * @return
	 */
	public void ansFormInsert(String mgrCode, String ansCode, String ansContent, String otoCode);

	/**
	 * 문의글 답글 삭제
	 * 
	 * @param otoCode
	 */
	public void otoDelAns(String otoCode);
	
	/**
	 * 문의글 파일 삭제
	 * 
	 * @param otoCode
	 */
	public void otoDelOtoFile(String otoCode);
	
	/** 
	 * 문의글 삭재
	 * 
	 * @param otoCode
	 */
	public void otoDelOto(String otoCode);

	/**
	 * 답변 리스트
	 * 
	 * @param otoCode
	 * @return
	 */
	public List<Ans> viewCom(String otoCode);

	public boolean chkNull(List<Ans> comments);

	/**
	 * 파일 보기
	 * 
	 * @param otoCode
	 * @return
	 */
	public List<OtoFile> getOtoFiles(String otoCode);

	public BuyerProf buyerFileUpdate(BuyerProf buyerProf);

	public Buyer csUpdateView(Buyer buyer);

	public void csUpdate(Buyer buyer);

	public BuyerProf updateProFileGet(MultipartFile buyerFileUpdate, Buyer buyer);

	public void updateProfileProc(BuyerProf buyerProf);

	public Buyer getBuyer1(String bCode);

	public BuyerAdr buyerAdrUpdate(BuyerAdr buyerAdr);

	public void csUpdateAdr(BuyerAdr buyerAdr);

}
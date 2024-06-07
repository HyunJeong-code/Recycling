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
	 * 구매자 프로필 사진 업데이트
	 * 
	 * @param buyerProf
	 * @return
	 */
	public BuyerProf buyerFileUpdate(BuyerProf buyerProf);

	/**
	 * 구매자 업데이트 정보 조회
	 * 
	 * @param buyer
	 * @return
	 */
	public Buyer csUpdateView(Buyer buyer);

	/**
	 * 구매자 업데이트
	 * 
	 * @param buyer
	 */
	public void csUpdate(Buyer buyer);

	/**
	 * 구매자 프로필 사진
	 * 
	 * @param buyerFileUpdate
	 * @param buyer
	 * @return
	 */
	public BuyerProf updateProFileGet(MultipartFile buyerFileUpdate, Buyer buyer);

	/**
	 * 구매자 프로필 사진 업데이트
	 * 
	 * @param buyerProf
	 */
	public void updateProfileProc(BuyerProf buyerProf);

	/**
	 * 구매자 주소 업데이트 조회
	 * 
	 * @param buyerAdr
	 * @return
	 */
	public BuyerAdr buyerAdrUpdate(BuyerAdr buyerAdr);

	/**
	 * 구매자 주소 업데이트
	 * 
	 * @param buyerAdr
	 */
	public void csUpdateAdr(BuyerAdr buyerAdr);

	/**
	 * 구매자 삭제
	 * 
	 * @param bCode
	 * @return 
	 */
	public void buyerDel(Buyer buyer);
	
	/**
	 * 구매자 리스트 삭제 도우미
	 * 
	 * @param bCode
	 * @return
	 */
	public Buyer getBuyer(String bCode);

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


}
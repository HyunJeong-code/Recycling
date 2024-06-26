package recycling.buyer.dao.face;

import java.util.List;
import java.util.Map;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.BuyerTest;
import recycling.dto.buyer.Buyers;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.CmpFile;
import recycling.dto.seller.Exp;
import recycling.dto.seller.Prd;
import recycling.util.PagingAndCtg;

// 메인페이지, 로그인/회원가입 관련 DB 처리

public interface BuyDao {

	/**
	 * ID를 통해서 DB에서 사용자 정보를 가져옴
	 * 
	 * @param username - ID
	 * @return 로그인에 필요한 정보
	 */
	public BuyerLogin selectById(String username);
	
	/**
	 * 구매자 기본정보 회원가입 처리
	 * 
	 * @param buyer - 회원가입 기본 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertBuyer(Buyer buyer);
	
	/**
	 * 로그인 처리(임시) -> 시큐리티 완성되면 삭제 예정
	 * 
	 * @param buyer - 로그인 정보가 들어있는 DTO
	 * @return - null : 실패, else : 성공
	 */
	public BuyerLogin selectBybIdbPw(Buyer buyer);

	/**
	 * 아이디 찾기
	 * 
	 * @param buyer - 아이디 찾을 회원 정보
	 * @return 아이디 반환
	 */
	public String selectByBuyerId(Buyer buyer);
	
	/**
	 * 비밀번호 찾기
	 * 
	 * @param buyer - 비밀번호를 찾을 회원 정보
	 * @return true : 회원 정보 존재, false : 회원정보 존재 X
	 */
	public Buyer selectByBuyerPw(Buyer buyer);
	
	/**
	 * 비밀번호 찾기 후 변경
	 * 
	 * @param buyer - 회원 코드와 변경할 비밀번호
	 * @return 0 : 실패, 1 : 성공
	 */
	public int updatePw(Buyer buyer);

	/**
	 * 프로필 사진 삽입
	 * 
	 * @param prof - 프로필 사진 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertProf(BuyerProf prof);
	
	/**
	 * 구매자 주소 정보 삽입
	 * @param buyerAdr - 구매자 주소 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertAdr(BuyerAdr buyerAdr);
	
	/**
	 * 기업 구매자 정보 삽입
	 * 
	 * @param cmp - 기업 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertCmp(Cmp cmp);
	
	/**
	 * 기업 구매자 서류 삽입
	 * 
	 * @param file - 서류 파일 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertCmpFile(CmpFile file);
	
	/**
	 * 헤더 공지
	 * 
	 * @return map형태로 번호와 제목
	 */
	public List<Map<String, Object>> selectNtc();

	/**
	 * 중복된 아이디 찾기
	 * 
	 * @param bId - 아이디
	 * @return 중복된 아이디 개수
	 */
	public int selectCntById(String bId);
	
	/**
	 * 메인페이지 재활용품 정보
	 * 
	 *  @return 재활용품 정보와 썸넹리 정보
	 */
	public List<Map<String, Object>> selectRcyHit();
	
	/**
	 * 메인페이지 새활용 정보
	 * 
	 *  @return 새활용 정보와 썸넹리 정보
	 */
	public List<Map<String, Object>> selectUpcyHit();
	
	/**
	 * 메인페이지 체험단 정보
	 * 
	 *  @return 체험단 정보와 썸넹리 정보
	 */
	public List<Map<String, Object>> selectExpHit();
	
	/**
	 * 메인페이지 재활용품 정보
	 * 
	 *  @return 재활용품 정보와 썸넹리 정보
	 */
	public List<Map<String, Object>> selectRcyNew();
	
	/**
	 * 메인페이지 새활용 정보
	 * 
	 *  @return 새활용 정보와 썸넹리 정보
	 */
	public List<Map<String, Object>> selectUpcyNew();
	
	/**
	 * 메인페이지 체험단 정보
	 * 
	 *  @return 체험단 정보와 썸넹리 정보
	 */
	public List<Map<String, Object>> selectExpNew();

	/**
	 * 상품 전체 페이지 수
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntPrd(PagingAndCtg upPaging);
	
	/**
	 * 체험 전체 페이지 수
	 * 
	 * @param upPaging
	 * @return
	 */
	public int selectCntExp(PagingAndCtg unPaging);
	
	/**
	 * 상품 전체 리스트
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Prd> selectPrd(PagingAndCtg upPaging);
	
	/**
	 * 체험 전체 리스트
	 * 
	 * @param upPaging
	 * @return
	 */
	public List<Exp> selectExp(PagingAndCtg unPaging);
}
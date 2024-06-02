package recycling.buyer.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.BuyerProf;
import recycling.dto.buyer.Cmp;
import recycling.dto.buyer.CmpFile;

// 메인페이지, 로그인/회원가입

public interface BuyService {
	
	/**
	 * 구매자 기본정보 회원가입 처리
	 * 
	 * @param buyer - 회원가입 기본 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertBuyer(Buyer buyer);
	
	/**
	 * 
	 * @param buyer - 구매자 회원 정보
	 * @param sPhone - 핸드폰 번호 시작 
	 * @param inPhone - 핸드폰 번호 시작 직접 입력
	 * @param mPhone - 핸드폰 번호 중간
	 * @param lPhone - 핸드폰 번호 마지막
	 * @param bEmail2 - 이메일 주소
	 * @param inEmail - 이메일 주소 직접 입력
	 * @return 구매자 정보
	 */
	public Buyer buyerProc(Buyer buyer, String sPhone, String inPhone, String mPhone, String lPhone, String bEmail2,
			String inEmail);
	
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
	 * 구매자 프로필 사진 정보 처리
	 * 
	 * @param buyer - 구매자 정보
	 * @param buyerProf - 구매자 프로필 정보
	 * @return null : 처리 실패 
	 */
	public BuyerProf fileSave(Buyer buyer, MultipartFile buyerProf);
	
	/**
	 * 프로필 사진 삽입
	 * 
	 * @param prof - 프로필 사진 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertProf(BuyerProf prof);
	
	/**
	 * 구매자 주소 정보 처리
	 * 
	 * @param buyer - 구매자 정보
	 * @param buyerAdr - 구매자 주소 정보
	 * @return 구매자 주소 정보
	 */
	public BuyerAdr AdrProc(Buyer buyer, BuyerAdr buyerAdr);
	
	/**
	 * 구매자 주소 정보 삽입
	 * @param buyerAdr - 구매자 주소 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertAdr(BuyerAdr buyerAdr);
	
	/**
	 * 기업 구매자 정보 처리
	 * 
	 * @param buyer - 구매자 기본 정보
	 * @param cmp - 기업 정보
	 * @return 기업 정보
	 */
	public Cmp cmpProc(Buyer buyer, Cmp cmp);
	
	/**
	 * 기업 구매자 정보 삽입
	 * 
	 * @param cmp - 기업 정보
	 * @return 0 : 실패, 1 : 성공
	 */
	public int insertCmp(Cmp cmp);
	
	/**
	 * 기업 구매자 서류 정보 처리
	 * @param cmp - 기업 정보
	 * @param cmpFile - 서류 파일 정보
	 * @return null : 실패
	 */
	public CmpFile cmpFileSave(Cmp cmp, MultipartFile cmpFile);
	
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


}
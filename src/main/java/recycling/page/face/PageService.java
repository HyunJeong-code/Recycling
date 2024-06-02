package recycling.page.face;

import recycling.util.PagingAndCtg;

public interface PageService {
	
	/**
	 * 구매자 정보를 이용한 상단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @param getbCode - 구매자 코드
	 * @return
	 */
	public PagingAndCtg upPageBuyer(int curPage, String sCtg, String search, String getbCode);

	/**
	 * 구매자 정보를 이용한 하단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @param getbCode - 구매자 코드
	 * @return
	 */
	public PagingAndCtg unPageBuyer(int curPage, String sCtg, String search, String getbCode);
	
	/**
	 * 판매자 정보를 이용한 상단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @param getbCode - 구매자 코드
	 * @return
	 */
	public PagingAndCtg upPageSeller(int curPage, String sCtg, String search, String getsCode);
	
	/**
	 * 판매자 정보를 이용한 하단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @param getbCode - 구매자 코드
	 * @return
	 */
	public PagingAndCtg unPageSeller(int curPage, String sCtg, String search, String getsCode);
	
	/**
	 * 관리자 정보를 이용한 상단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @param getbCode - 구매자 코드
	 * @return
	 */
	public PagingAndCtg upPageMgr(int curPage, String sCtg, String search, String getmgrCode);
	
	/**
	 * 관리자 정보를 이용한 하단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @param getbCode - 구매자 코드
	 * @return
	 */
	public PagingAndCtg unPageMgr(int curPage, String sCtg, String search, String getmgrCode);
	
	/**
	 * 사용자 정보 없이 상단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @return
	 */
	public PagingAndCtg upPageAll(int curPage, String sCtg, String search);
	
	/**
	 * 사용자 정보 없이 하단 게시판 페이징
	 * 
	 * @param curPage - 현재 페이지
	 * @param sCtg - 상/하단
	 * @param search - 검색어
	 * @return
	 */
	public PagingAndCtg unPageAll(int curPage, String sCtg, String search);
}

package recycling.page.impl;

import org.springframework.stereotype.Service;

import recycling.util.PagingAndCtg;

@Service
public class PageServiceImpl implements recycling.page.face.PageService {
	
	@Override
	public PagingAndCtg upPageBuyer(int curPage, String sCtg, String search, String getbCode) {
		
		PagingAndCtg upPaging = new PagingAndCtg();
		
		if(sCtg.equals("UP")) {
			upPaging.setCurPage(curPage);
			upPaging.setSearch(search);
			upPaging.setUser(getbCode);
			
		} else if(sCtg.equals("UN")){
			upPaging.setCurPage(0);
			upPaging.setSearch("");
			upPaging.setUser(getbCode);
			
		} else {
			upPaging.setCurPage(0);
			upPaging.setSearch("");
			upPaging.setUser(getbCode);
		}
		return upPaging;
	}
	
	@Override
	public PagingAndCtg unPageBuyer(int curPage, String sCtg, String search, String getbCode) {
		PagingAndCtg unPaging = new PagingAndCtg();
		
		if(sCtg.equals("UP")) {
			unPaging.setCurPage(curPage);
			unPaging.setSearch(search);
			unPaging.setUser(getbCode);
			
		} else if(sCtg.equals("UN")){
			
			unPaging.setCurPage(0);
			unPaging.setSearch("");
			unPaging.setUser(getbCode);
		} else {
			unPaging.setCurPage(0);
			unPaging.setSearch("");
			unPaging.setUser(getbCode);
		}
		
		return unPaging;
	}
	
	@Override
	public PagingAndCtg upPageSeller(int curPage, String sCtg, String search, String getsCode) {
		PagingAndCtg upPaging = new PagingAndCtg();
		
		if(sCtg.equals("UP")) {
			upPaging.setCurPage(curPage);
			upPaging.setSearch(search);
			upPaging.setUser(getsCode);
			
		} else if(sCtg.equals("UN")){
			upPaging.setCurPage(0);
			upPaging.setSearch("");
			upPaging.setUser(getsCode);
			
		} else {
			upPaging.setCurPage(0);
			upPaging.setSearch("");
			upPaging.setUser(getsCode);
		}
		return upPaging;	
	}
	
	@Override
	public PagingAndCtg unPageSeller(int curPage, String sCtg, String search, String getsCode) {
		PagingAndCtg unPaging = new PagingAndCtg();
		
		if(sCtg.equals("UP")) {
			unPaging.setCurPage(curPage);
			unPaging.setSearch(search);
			unPaging.setUser(getsCode);
			
		} else if(sCtg.equals("UN")){
			unPaging.setCurPage(0);
			unPaging.setSearch("");
			unPaging.setUser(getsCode);
			
		} else {
			unPaging.setCurPage(0);
			unPaging.setSearch("");
			unPaging.setUser(getsCode);
		}
		
		return unPaging;
	}
	
	@Override
	public PagingAndCtg upPageMgr(int curPage, String sCtg, String search, String getmgrCode) {
		PagingAndCtg upPaging = new PagingAndCtg();
		
		if(sCtg.equals("UP")) {
			upPaging.setCurPage(curPage);
			upPaging.setSearch(search);
			upPaging.setUser(getmgrCode);
			
		} else if(sCtg.equals("UN")){
			
			upPaging.setCurPage(0);
			upPaging.setSearch("");
			upPaging.setUser(getmgrCode);
		} else {
			upPaging.setCurPage(0);
			upPaging.setSearch("");
			upPaging.setUser(getmgrCode);
		}
		return upPaging;
	}
	
	@Override
	public PagingAndCtg unPageMgr(int curPage, String sCtg, String search, String getmgrCode) {
		PagingAndCtg unPaging = new PagingAndCtg();
		
		if(sCtg.equals("UP")) {
			unPaging.setCurPage(curPage);
			unPaging.setSearch(search);
			unPaging.setUser(getmgrCode);
			
		} else if(sCtg.equals("UN")){
			
			unPaging.setCurPage(0);
			unPaging.setSearch("");
			unPaging.setUser(getmgrCode);
		} else {
			unPaging.setCurPage(0);
			unPaging.setSearch("");
			unPaging.setUser(getmgrCode);
		}
		
		return unPaging;
	}
}

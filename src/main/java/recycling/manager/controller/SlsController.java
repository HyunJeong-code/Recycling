package recycling.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.manager.ManagerLogin;
import recycling.dto.manager.ResSchCnt;
import recycling.dto.manager.SellerOrderJoin;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;
import recycling.dto.seller.Seller;
import recycling.manager.service.face.MgrService;
import recycling.manager.service.face.SlsService;
import recycling.seller.service.face.SellingService;
import recycling.util.PagingAndCtg;

@Controller
@RequestMapping("/manager/sls")
public class SlsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private SlsService slsService;
	@Autowired HttpSession session;
	@Autowired private recycling.page.face.PageService pageService;
	@Autowired private SellingService sellingService;
	@Autowired private MgrService mgrService;
	
	// 문의글 메인 페이지
	@RequestMapping("/main")
	public void main(
			Authentication authentication
			, Model model
			, @RequestParam(defaultValue = "0") int curPage
			, @RequestParam(defaultValue = "") String search
			, @RequestParam(defaultValue = "") String sCtg
			) {

		//매니저 권한 부여
		ManagerLogin managerLogin = (ManagerLogin) authentication.getPrincipal();
		
		//페이지 수 계산
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageMgr(curPage, sCtg, search, managerLogin.getMgrCode());
		
		int upPage = slsService.upPageSlsMain(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        
        
		// 판매자 목록 조회
		List<Seller> main = slsService.main(upPaging);

		model.addAttribute("upPaging", upPaging);
		model.addAttribute("main", main);
		
	}
	
	@GetMapping("/sellerdetail")
	public void sellerDetail() {
		logger.info("/manager/sls/sellerdetail [GET]");
		
		
	}
	
	@GetMapping("/sellerpridetail")
	public void sellerPriDetail(String sCode, Model model) {
		logger.info("/manager/sls/sellerpridetail [GET]");
		
		logger.info("detail sCode : {}", sCode);
		
		String bCode = slsService.selectBysCode(sCode);
		logger.info("bCode : {}", bCode);
		
		int rptCnt = slsService.selectCntRpt(sCode);
		int ordCnt = slsService.selectCntOrd(sCode);
		logger.info("rpt : {}, ord : {}", rptCnt, ordCnt);
		
		Map<String, Object> seller = slsService.selectPriSeller(bCode);
		model.addAttribute("seller", seller);
		model.addAttribute("rptCnt", rptCnt);
		model.addAttribute("ordCnt", ordCnt);
		logger.info("P : {}", seller);
		
	}
	
	@GetMapping("/sellercmpdetail")
	public void sellerCmpDetail(String sCode, Model model) {
		logger.info("/manager/sls/sellerCmpdetail [GET]");
		
		logger.info("detail sCode : {}", sCode);
		
		String bCode = slsService.selectBysCode(sCode);
		logger.info("bCode : {}", bCode);
		
		int rptCnt = slsService.selectCntRpt(sCode);
		int ordCnt = slsService.selectCntOrd(sCode);
		logger.info("rpt : {}, ord : {}", rptCnt, ordCnt);
		
		Map<String, Object> seller = null;
		
		seller = slsService.selectCmpSeller(bCode);
		model.addAttribute("seller", seller);
		model.addAttribute("rptCnt", rptCnt);
		model.addAttribute("ordCnt", ordCnt);
		logger.info("C : {}", seller);
	}
	
	@PostMapping("/sellerpridetail")
	public String sellerPriDetailProc(
			Model model,
			Seller seller
			) {
		
		model.addAttribute("msg", "판매자 정보 수정이 완료되었습니다.");
		model.addAttribute("url", "history.back()");
		
		return "/layout/alert";
	}
	
	@PostMapping("/sellercmpdetail")
	public String sellerCmpDetailProc(
			Model model,
			Seller seller
			) {
		
		model.addAttribute("msg", "판매자 정보 수정이 완료되었습니다.");
		model.addAttribute("url", "history.back()");
		
		return "/layout/alert";
	}
	
	@PostMapping("/sellerout")
	@ResponseBody
	public int sellerOut(
			String sCode
			) {
		logger.info("/manager/sls/sellerout [GET]");
		
		logger.info("sCode : {}", sCode);
		
		int res = slsService.updateSelOut(sCode);
		
		return res;
	}	
	
	@GetMapping("/rptseller")
	public void rptSeller() {
		logger.info("/manager/sls/rptseller [GET]");
	}
	
	@GetMapping("/sellerchklist")
	public void sellerChkList(
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg,
			Model model
			) {
		logger.info("/manager/sls/sellerchklist [GET]");
		
		// 페이징 - 전체 조회 글 개수
		PagingAndCtg paging = new PagingAndCtg();
		paging.setSearch(search);
		int page = slsService.selectCntSeller(paging);
		
		// 페이징 - 페이징 처리
		paging = new PagingAndCtg(page, curPage, search);
		
		// 판매자 신청 전체 조회
		List<Map<String, Object>> sellerList = slsService.selectBysChk(paging);
		logger.info("{}", sellerList);
		
		model.addAttribute("listSize", sellerList.size());
		model.addAttribute("sellerList", sellerList);
		model.addAttribute("upPaging", paging);
		model.addAttribute("upUrl", "/manager/sls/sellerchklist");
	}
	
	@GetMapping("/sellerchk")
	public String sellerChk(
			String selChk,
			String sCode,
			Model model
		) {
		logger.info("/manager/sls/sellerchk [GET]");
		
		Seller seller = new Seller();
		seller.setsCode(sCode);
		seller.setsChk(selChk);
		
		int res = 0;
		if(selChk.equals("Y")) {
			res = slsService.updateSelChk(seller);
			model.addAttribute("msg", sCode + "판매자 전환 수락에 성공했습니다.");
			model.addAttribute("url", "/manager/sls/sellerchklist");
			return "/layout/alert";
		} else {
			res = slsService.updateSelChk(seller);
			model.addAttribute("msg", sCode + "판매자 전환 수락에 거절했습니다.");
			model.addAttribute("url", "/manager/sls/sellerchklist");
			
			return "/layout/alert";
		}
	}
	
	@GetMapping("/sellinglist")
   public void sellinglist(
         Authentication authentication
         , Model model
         , Seller seller
         , @RequestParam(defaultValue = "0") int curPage
         , @RequestParam(defaultValue = "") String search
         , @RequestParam(defaultValue = "") String sCtg
         , String sCode
         ) {
      logger.info("/manager/sls/seller [GET]");
      logger.info("/manager/sls/seller [sCode] : {}",sCode);
      
        // 문의글 페이지 수 계산
        PagingAndCtg upPaging = new PagingAndCtg();
        PagingAndCtg unPaging = new PagingAndCtg();
         
        upPaging = pageService.upPageSeller(curPage, sCtg, search, sCode);
        unPaging = pageService.unPageSeller(curPage, sCtg, search, sCode);
        
      //판매자 조회
      Map<String, Object> selList = slsService.sellerAllSeller(seller);
      model.addAttribute("selList", selList);
      
      
      //상단페이징[상품 조회]
      int upPage = slsService.selectCntAllPrdList(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        upPaging.setUser(sCode);
  		
		//상품 조회[상단]
		List<SellerOrderJoin> prdList = slsService.selectAllPrdList(upPaging);
		model.addAttribute("prdList", prdList);
		
		//하단페이징[판매 조회]
  		int unPage = slsService.selectCntAllSellList(unPaging);
  		unPaging = new PagingAndCtg(unPage, unPaging.getCurPage(), unPaging.getSearch());
         
  		logger.info("unPaging : {}", unPaging);
  		unPaging.setUser(sCode);
		
		//판매 조회[하단]
		List<MyOrder> olist = slsService.selectAllSellList(unPaging);
		model.addAttribute("olist", olist);
		
		//삭제된 상품을 제외한 상품 리스트
		List<SellerOrderJoin> nplist = new ArrayList<SellerOrderJoin>();
		
		for(SellerOrderJoin prd : prdList) {
			String prdOut = prd.getPrdOut();
			
			logger.info("{}",prdOut);
			
			if("N".equals(prdOut)) {
				nplist.add(prd);
			}
		}
		
		
		model.addAttribute("plist", nplist);
		model.addAttribute("olist", olist);
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/manager/sls/sellinglist?sCode=" + sCode + "&");
		model.addAttribute("unPaging", unPaging);
		model.addAttribute("unUrl", "/manager/sls/sellinglist?sCode=" + sCode + "&");
		
	}
	
	//상품 세부사항
	@GetMapping("/prddetail")
	public void prdDetail(
			String prdCode
			, Model model) {
		
		Prd prd = slsService.selectDetailPrd(prdCode);
		logger.info("prdDetail prd :{}", prd);
				
		model.addAttribute("prd", prd);
	}
	
	//리사이클링 상품수정
	@RequestMapping("/reprdupdate")
	public String reprdUpdate(
			Prd prd
			,Model model) {
		
		int res = slsService.slsPrdUpdate(prd);
		logger.info("upcyUpdate : {}",prd);
		
		model.addAttribute("msg", "상품이 수정되었습니다.");
		model.addAttribute("url", "/manager/sls/sellinglist?sCode=" + prd.getsCode());
		return "/layout/alert";
	}
	//업사이클링 상품수정
	@RequestMapping("/upprdupdate")
	public String upprdUpdate(Prd prd,Model model) {
		
		int res = slsService.slsPrdUpdate(prd);
		logger.info("upcyUpdate : {}",prd);
		
		model.addAttribute("msg", "상품이 수정되었습니다.");
		model.addAttribute("url", "/manager/sls/sellinglist?sCode=" + prd.getsCode());
		return "/layout/alert";
	}
	
	//상품삭제
	@RequestMapping("/prddel")
	public String prdDel(@RequestParam(value = "arr[]") List<String> list) {
		logger.info("{}",list);
		
		
		for(String prdCode : list) {
			int deleteRes = sellingService.deletePrd(prdCode);
			logger.info("1111111 : {}",prdCode);
		}
		
		return "jsonView";
	}
	
	//주문 상세정보
	@GetMapping("/orderdetail")
	public void orderDetail(
			String orddtCode
			, Model model
			){
		
		MyOrder myOrder = slsService.orderdetailPrd(orddtCode);
		
		model.addAttribute("order", myOrder);
		
		model.addAttribute("msg", "주문정보가 수정되었습니다.");
		model.addAttribute("url", "/manager/sls/sellinglist");
		
	}
	
	//주문 정보 변경
	@PostMapping("/orderupdate")
	public String orderUpdate(MyOrder myOrder, Model model) {
		logger.info("{}", myOrder);
		
		int res = sellingService.updateMyOrder(myOrder);
		
		model.addAttribute("msg", "주문정보가 수정되었습니다.");
		model.addAttribute("url", "/manager/sls/sellinglist");
		return "/layout/alert";
	}
	
	//	주문 상태 변경
	@GetMapping("/changeorder")
    public String changeOrder(@RequestParam(value = "arr[]") List<String> list, int sttNo, Model model) {
		logger.info("list: {}",list);
		logger.info("sttNo: {}",sttNo);
		
		//환불
		if(sttNo == 980) {
			//토큰 발급
			String token = sellingService.getToken();
			
			
			String successRes = "";
			String failRes = "";
			//반복 취소
			for(String orddtCode : list) {
				
				//OrderDetail 조회
				OrderDetail order = sellingService.selectByorddtCode(orddtCode); 
				logger.info("order: {}",order);
				
				//주문 취소(환불)
				int res = sellingService.cencelpay(order, token);
				
				if(res == 1) {
					OrderDetail ordd = new OrderDetail();
					ordd.setOrddtCode(orddtCode);
					ordd.setSttNo(sttNo);
					int updateRes = sellingService.updateOrderDetail(ordd);
					if(successRes != "") {
						successRes += ", ";					
					}
					successRes += orddtCode;
		        	
				} else {
					if(failRes != "") {
						failRes += ", ";					
					}
					failRes += orddtCode;
				}
			}
			
			if(successRes != "") {
				successRes += "환불 완료";
			}
			
			if(failRes != "") {
				failRes += "환불 실패";					
			}
			
			model.addAttribute("Msg", successRes + failRes);
		
		} else {
			for(String orddtCode : list) {
				OrderDetail ordd = new OrderDetail();
				ordd.setOrddtCode(orddtCode);
				ordd.setSttNo(sttNo);
				int updateRes = sellingService.updateOrderDetail(ordd);
			}
			model.addAttribute("Msg", "변경");
		}
        return "jsonView";
    }
	
	//송장등록
	@PostMapping("/prdShipform")
	public String shipForm(@RequestBody List<MyOrder> list) {
		logger.info("list: {}",list);
		
		for(MyOrder myOrder : list) {
			int res = sellingService.insertShip(myOrder);
			
			logger.info("myOrder: {}",myOrder);			
		}
		
	    return "jsonView";	
	}
	
	//송장삭제
	@GetMapping("/delship")
	public String delShip(String orddtCode, Model model) {
		int res = sellingService.deleteShip(orddtCode);
		
//		model.addAttribute("msg", "송장이 삭제되었습니다.");
//		model.addAttribute("url", "/manager/sls/sellinglist");
		return "jsonView";
	}
		
	//체험단 전체조회[explist]
		@GetMapping("/explist")
		public String expList(
				Authentication authentication
				, Model model
				, @RequestParam(defaultValue = "0") int curPage
				, @RequestParam(defaultValue = "") String search
				, @RequestParam(defaultValue = "") String sCtg
				) {
			
			//매니저 권한 부여
			ManagerLogin managerLogin = (ManagerLogin) authentication.getPrincipal();
					
			//페이지 수 계산
			PagingAndCtg upPaging = new PagingAndCtg();
			upPaging = pageService.upPageMgr(curPage, sCtg, search, managerLogin.getMgrCode());
			
			int upPage = slsService.selectCntAllExp(upPaging);
	        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
		
			//전체 Exp 조회기능
			List<Exp> list = slsService.selectAllExp(upPaging);
			
			
			//JSP로 보내기
			model.addAttribute("explist", list);
			
			model.addAttribute("upPaging", upPaging);
			model.addAttribute("upUrl", "/manager/sls/explist"); //jsp 페이징
			
			return "/manager/sls/explist";
		}
	
	//세부조회
	@GetMapping("/expdetail")
	public void expDetail(
			Authentication authentication
			,@RequestParam("expCode") String expCode
			, ExpFile expFile
			, Model model
			, @RequestParam(defaultValue = "0") int curPage
			, @RequestParam(defaultValue = "") String search
			, @RequestParam(defaultValue = "") String sCtg
			) {
		ManagerLogin managerLogin = (ManagerLogin) authentication.getPrincipal();

		//페이징
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageMgr(curPage, sCtg, search, managerLogin.getMgrCode());
		int upPage = slsService.selectCntAllExpSch(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        
		//상세조회
		Exp view = slsService.selectDetailExp(expCode);
		model.addAttribute("view", view);

		//예약 스케쥴 조회기능
		List<ExpSch> schList = slsService.selectAllSch(expCode);
		model.addAttribute("expSchList", schList);

		//예약된인원 조회
		List<ResSchCnt> resCnt = slsService.selectByResCnt(expCode);
		model.addAttribute("resCnt", resCnt);

		//프로필 조회
		ExpFile profileimage = slsService.expProImage(expFile);
		model.addAttribute("profileimage", profileimage);
	
		//파일 조회
		List <ExpFile> fileimage = slsService.expImage(expFile);
		model.addAttribute("fileImage", fileimage);
        
        model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/manager/sls/expdetail?expCode=" + expCode);
		
}
	
	//판매자 정보조회
	@GetMapping("/sellerselect")
	public void sellerSelect(
			Seller seller
			, Model model
			) {
		logger.info("seller:{}", seller);
		List<Map<String, Object>> selList = slsService.sellerSelect(seller.getbCode());
		model.addAttribute("selList", selList);
		logger.info("selList:{}", selList);
		
	}
	
	//체험단 등록창
	@GetMapping("/expform")
	private void expform() {		
	}
	
	///체험단 등록
	@PostMapping("/expform")
	public String expformProc(
			Exp exp
			, @RequestParam("schTime") List<String> schTime
			, ExpSch expSch
			, @RequestParam("profile") MultipartFile profile
			, @RequestParam("file") List<MultipartFile> file
			, Model model
			) {
		
		slsService.insert(exp, schTime, expSch, profile, file);
		
		
		model.addAttribute("msg", "체험일이 등록되었습니다.");
		model.addAttribute("url", "/manager/sls/explist");
		
		return "/layout/alert";

	}
	
	//체험단 수정창
	@GetMapping("/expupdate")
	public String expUpdate(
				Exp exp
				, Model model
				, ExpFile expFile
			) {
		//수정창 조회
		Exp update = slsService.expUpdateView(exp);
		model.addAttribute("update", update);
		
		//수정창 파일조회
		ExpFile profile = slsService.expUpdateProfile(expFile);
		model.addAttribute("profile",profile);
		logger.info("expFile:{}",profile);
		
		List<ExpFile> file = slsService.expUpdateFile(expFile);
		model.addAttribute("expFileList",file);
		logger.info("file:{}",file);
		
		return "/manager/sls/expupdate";
	}
		
	@PostMapping("/expupdate")
	public String updateProc(
			Exp exp
			, Model model
			, ExpFile expFile
			, String expCode
			, @RequestParam("expfileUpdate") MultipartFile expfileUpdate
			, @RequestParam("file") List<MultipartFile> expMultiFileUpdate
			, @RequestParam("fileId") List<Integer> fileId
			){
		//수정창 exp 내용 바꾸기
		slsService.expUpdateProc(exp);
		logger.info("controller: expMultiFileUpdate{}",expMultiFileUpdate);
		logger.info("controller: fileId{}",fileId);
		
		//expfile 프로필 업데이트
		if(expfileUpdate != null && !expfileUpdate.isEmpty()) {
		
			ExpFile expfile = new ExpFile();
			expfile = slsService.updateFile(expfileUpdate, exp);
			expfile.setExpFlNo(expFile.getExpFlNo());
			expfile.setExpCode(expCode);
			
			//파일 업데이트
			slsService.expUpdatefileProc(expfile);
			logger.info("파일을 수정합니다. : {}",expfile);
		}else {
			logger.info("프로필파일이 존재합니다.");
		}
		
	      List<MultipartFile> tempFiles = new ArrayList<MultipartFile>();
	      for(MultipartFile m : expMultiFileUpdate) {
	         if(m != null && !m.isEmpty() && m.getSize()> 0) {
	            tempFiles.add(m);
	         }
	      }
		
	      logger.info("tempFiles: {}", tempFiles);
	      
	      HashMap<String, String> map = new HashMap<String,String>();
	      String expFlNo = "";
	      for(int i = 0; i < fileId.size(); i++) {
	         if(i != 0) {
	            expFlNo += ",";
	         }
	         expFlNo += fileId.get(i);
	      }
	      map.put("expCode", expCode);
	      map.put("expFlNo", expFlNo);
	      
	      logger.info("map: {}",map);
	      
	      if(tempFiles != null && !tempFiles.isEmpty()) {
	         
	         PrdFile prdFile = new PrdFile();
	         prdFile.setPrdCode(expCode);
	         prdFile.setCtPflNo(610);
	         
	         
	         //파일 삭제
	          slsService.deleteDetailFile(map);
	         for(MultipartFile detailFile : tempFiles) {
	            logger.info("detailFile: {}", detailFile);
	            int detailRes = slsService.updateDetailFile(expCode, detailFile);
	         }
	      }
		
		
		logger.info("{}",expMultiFileUpdate);
		//expfile 파일 업데이트
		if(expMultiFileUpdate != null && !expMultiFileUpdate.isEmpty()) {
			slsService.updateMutiFile(expMultiFileUpdate, exp);
			logger.info("파일이 업데이트 되었습니다");
			logger.info("expMultiFileUpdate : {}",expMultiFileUpdate);
		}else {
			logger.info("파일이 존재합니다.");
		}
		
		model.addAttribute("msg", "체험정보가 변경되었습니다.");
		model.addAttribute("url", "redirect:/manager/sls/expdetail?expCode=" + exp.getExpCode());
		
		return "/layout/alert";
	}
	
	// 체험단삭제
	@PostMapping("/explistdel")	
	public String empListDelete(@RequestParam("chBox[]") List<String> chBox) {
		logger.info("controller: empListDelete [POST]");
		
	    int result = 0;
	    
	    for(int i = 0; i < chBox.size(); i++) {
	        String expCode = chBox.get(i);
	        logger.info("Deleting files associated with exp code: {}", expCode);
	        
	        // 체험 리뷰에 대한 삭제
	        result += slsService.expReviewListDel(expCode);
	        
	        // 체험 예약에 대한 파일 삭제
	        result += slsService.expFileListDel(expCode);
	        
	        // 체험 일정 삭제
	        result += slsService.expSchListDel(expCode);
	        
	        // 체험 예약 삭제[무조건 마지막]
	        result += slsService.expListDel(expCode);
	    }
	    
	    logger.info("데이터 확인 chBox : {}", chBox);
		
		return "redirect:./explist";
	}
	
	// 체험단 예약관리
	@GetMapping("/expresdetail")	
	public void expResDetail(
			Model model
			, String expCode
			, int schNo
			) {
		
		//체험단 조회
		Exp expView = slsService.expResDetail(expCode);
		model.addAttribute("exp", expView);
		
		//체험예약 조회
		ExpSch expSch = slsService.selectExpSchbySchNo(schNo);
		model.addAttribute("expSch", expSch);
		
		//체험단 예약인원조회
		List<ExpRes> resList = slsService.expResDetailRes(schNo);
		model.addAttribute("resList", resList);
		
	}
	
	// 체험단 예약 확정,취소 변경
	@PostMapping("/expresupdate")
	public String expresupdate(@RequestParam("chBox[]") List<String> chBox, @RequestParam String actionType) {
		
		slsService.expResUpdate(chBox, actionType);
		
		return "jsonView";
	}
	

	// 체험단 예약인원 예약변경창
	@GetMapping("/changeexpres")
	public String changeExpRes(
			ResSchCnt resSchCnt
			, Model model
			) {
		ResSchCnt expResUpdate = slsService.changeExpRes(resSchCnt);
		model.addAttribute("update", expResUpdate);
		logger.info("controller: expResUpdate {}", expResUpdate);

		List<ExpSch> expSch = slsService.changeExpSch();
		model.addAttribute("expSch", expSch);
		
		
		return "/manager/sls/changeexpres";
	}
	
	// 체험단 예약인원 예약변경하기
	@PostMapping("/changeexpres")
	public String changeExpResProc(
			ResSchCnt resSchCnt
			, ExpRes expRes
			){
		logger.info("resSchCnt : {}",resSchCnt);
		logger.info("resSchCnt : {}",expRes);
		
		
		slsService.changeExpResProc(resSchCnt);
		
		
		return "redirect:/manager/sls/expresdetail?expCode="+ resSchCnt.getExpCode() +"&schNo="+ resSchCnt.getSchNo();
	}
	
	// 체험단 시간 날짜 별 인원 변경
	@PostMapping("/cntchangeupdate")
	public String cntChangeUpdate(
			 ExpSch expSch
			, Model model
			) {

		//예약인원 조회
		int resCnt = slsService.getTotalResCnt(expSch);
		logger.info("expSch : {}", resCnt);

		//변경인원
		int total = expSch.getSchCnt();
		
		//예약인원보다 변경할 인원이 적을시 에러
		if(resCnt <= total) {
			//총인원 변경
			slsService.cntChangeUpdate(expSch);
			logger.info("expSch : {}", expSch);
			
			model.addAttribute("success", true);
		}else {
			model.addAttribute("success", false);
		}
		
		return "jsonView";
	}
	
	// 예약관리 삭제
	@PostMapping("/expresdetaillistdel")	
	public String expResDetailListDel(@RequestParam("chBox[]") List<String> chBox) {
		logger.info("controller: expResDetaiLlistDel [POST]");
		
		slsService.expResDetailListDel(chBox);
		logger.info("데이터 확인 chBox : {}", chBox);
		
		return "redirect:./explist";
	}
	
	//expdetail 페이지 리스트 삭제
	@PostMapping("/expdetaillistdel")	
	public String expDetailListDel(@RequestParam("chBox[]") List<String> chBox, Model model) {
	    
	       int res = slsService.expDetailListDel(chBox);
	       
	       model.addAttribute("res", res);
	       
	        return "jsonView";
	
	}
	
}

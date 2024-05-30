package recycling.manager.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.ws.rs.POST;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import recycling.dto.seller.Seller;
import recycling.manager.service.face.SlsService;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.ExpRes;
import recycling.dto.manager.ResSchCnt;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Seller;
import recycling.manager.service.face.SlsService;

@Controller
@RequestMapping("/manager/sls")
public class SlsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SlsService slsService;
	@Autowired 
	HttpSession session;
	
	// 문의글 메인 페이지
	@RequestMapping("/main")
	public void main(@RequestParam(defaultValue = "0") int curPage, @RequestParam(defaultValue = "") String search,
			String category, Paging pagingParam, Model model) {

		Paging paging = new Paging();

		// 페이징 계산
		paging = slsService.getPaging(pagingParam);
//		logger.info("{}", paging);

		// 판매자 목록 조회
		List<Seller> main = slsService.main(paging);
//		logger.info("controller list: {}", list);
		
		model.addAttribute("paging", paging);
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
		
//		return "/manager/sls/sellerdetail";
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
		int page = slsService.selectCntSeller();
		
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
		
		logger.info("sCode, selChk : {}, {}", sCode, selChk);
		Seller seller = new Seller();
		seller.setsCode(sCode);
		seller.setsChk(selChk);
		
		int res = 0;
		if(selChk.equals("Y")) {
			res = slsService.updateSelChk(seller);
			model.addAttribute("msg", sCode + "판매자 전환 수락에 성공했습니다.");
			model.addAttribute("url", "/seller/sls/sellerchklist");
			return "/layout/alert";
		} else {
			res = slsService.updateSelChk(seller);
			model.addAttribute("msg", sCode + "판매자 전환 수락에 거절했습니다.");
			model.addAttribute("url", "/seller/sls/sellerchklist");
			
			return "/layout/alert";
		}
		
	}
	
	//체험단 전체조회
	@GetMapping("/explist")
	public String expList(
			Model model
			) {
		logger.info("controller explist :[Get]");
		
		//전체 Exp 조회기능
		List<Exp> list = slsService.selectAll();
		model.addAttribute("explist", list);
		
		return "/manager/sls/explist";
	}
	
	//세부조회
	@GetMapping("/expdetail")
	public void expDetail(
				@RequestParam("expCode") String expCode
				, ExpFile expFile
				, Model model
				) {
		
			//expCode번호와 동일한 expfile 가져오기
			ExpFile fileimage = slsService.image(expFile);
			model.addAttribute("fileimage", fileimage);
			logger.info("expDetail fileimage:{}", fileimage );
			
	        
			//상세조회
			Exp view = slsService.selectDetail(expCode);
			model.addAttribute("view", view);
			logger.info("expDetail view:{}", view );
	
			//전체 예약 조회기능
			List<ExpSch> schList = slsService.selectSchAll(expCode);
			model.addAttribute("expSchList", schList);
			logger.info("expDetail expSchList:{}", schList );
			
			//예약 인원 조회
			List<ResSchCnt> resCnt =slsService.selectByResCnt(expCode);
			model.addAttribute("resCnt", resCnt);
			logger.info("expDetail resCnt:{}", resCnt );
			
	}
	
	//판매자 정보조회
	@GetMapping("/sellerselect")
	public void sellerSelect(
			Seller seller
			, Model model
			) {
		
		List<Map<String, Object>> selList = slsService.sellerSelect(seller.getbCode());
		model.addAttribute("selList", selList);
		logger.info("selList:{}", selList);
		
	}
	
	//체험단 등록창
	@GetMapping("/expform")
	private void expform() {		
	}
	
	//체험단 등록
	@PostMapping("/expform")
	public String expformProc(
//			Authentication authentication
			Exp exp
			, @RequestParam("schTime") List<String> schTime
			, ExpSch expSch
			, @RequestParam("file") MultipartFile file
			) {
		
//		ManagerLogin mgrLogin = (ManagerLogin) authentication.getPrincipal();
//		logger.info("mgr : {}", mgrLogin);
		
		
		//test데이터
//		exp.setsCode("SEL0000001");
		slsService.insert(exp, schTime, expSch, file);
		
		
		return "redirect:./explist";

	}
	
	//체험단 수정창
	@GetMapping("/expupdate")
	public String expUpdate(
				Exp exp
				, Model model
			) {
		
		Exp update = slsService.expUpdateView(exp);
		model.addAttribute("update", update);
		
		//exp정보
		logger.info("controller: update{}",update );
		return "/manager/sls/expupdate";
	}
	
	//체험단 수정하기
	@PostMapping("/expupdate")
	public String updateProc(
			Exp exp
			){
		logger.info("controller: updateProc[Post]");
		
		slsService.expUpdateProc(exp);
		logger.info("exp : {}",exp);
		
		return "redirect:/manager/sls/expdetail?expCode=" + exp.getExpCode();
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

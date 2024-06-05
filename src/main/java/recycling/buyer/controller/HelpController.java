package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recycling.buyer.service.face.HelpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoCt;
import recycling.dto.buyer.OtoFile;
import recycling.dto.manager.Ans;
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.page.face.PageService;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 메뉴 - 고객센터

@Controller
@RequestMapping("/buyer/help")
public class HelpController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private HelpService helpService;
	@Autowired private PageService pageService;
	
	@GetMapping("/main")
	public void main(
	        @RequestParam(defaultValue = "0") int curPage,
	        @RequestParam(defaultValue = "0") String search,
	        @RequestParam(defaultValue = "UP") String sCtg,
	        Model model,
	        @RequestParam(defaultValue = "0") int ctFaqno
	        ) {
		
		logger.info("search : {}", search);
		logger.info("sCtg : {}", sCtg);
		
	    PagingAndCtg upPaging = new PagingAndCtg();
	    upPaging = pageService.upPageAll(curPage, sCtg, search);
	    logger.info("paging : {}", upPaging);

	    // 전체 또는 특정 분류의 자주 묻는 질문 개수 조회
	    int upPage;
	    List<Faq> list = new ArrayList<>();

	    if (search.equals("0")) {
//	    	//자주 묻는 질문 전체 리스트 조회
	    	logger.info("전체");
	        upPage = helpService.selectCntAllFaq(upPaging);
	        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), "0");
	        
	        list = helpService.selectAllFaq(upPaging);
	    } else {
	    	//자주 묻는 질문 분류별 리스트 조회
	    	logger.info("분류");
	        Map<String, Object> params = new HashMap<>();
	        params.put("search", search); // search에 ctFaqNo를 사용
	        params.put("upPaging", upPaging);
	        logger.info("params : {} ", params);
	        upPage = helpService.selectCntFaqByCt(params);
	        
	        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), search);
	        logger.info("**paging : {}", upPaging);
	        list = helpService.selectFaqByCt(upPaging);
	    }
	    

	    logger.info("upPaging : {}", upPaging);
	    logger.info("search : {}", search);
	    logger.info("list : {}", list);
	    
	    if (list == null) {
	        logger.info("list is null");
	    } else if (list.isEmpty()) {
	        logger.info("list is empty");
	    } else {
	        logger.info("list size : {}", list.size());
	        for (Faq faq : list) {
	            logger.info("Faq: {}", faq);
	        }
	    }

	    // 자주 묻는 질문 분류 리스트
	    List<FaqCt> faqCtlist = helpService.selectAllCtFaq();

	    model.addAttribute("upPaging", upPaging);
	    model.addAttribute("list", list);
	    model.addAttribute("faqCtlist", faqCtlist);
	    model.addAttribute("ctFaqno", ctFaqno);
	    model.addAttribute("upUrl", "/buyer/help/main");
	}

	
	@GetMapping("/noticelist")
	public void noticeList(
			@RequestParam(name = "ct_ntcno", defaultValue = "buyers") String ctNtcNo,
			Model model,
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "") String search,
			Authentication authentication
			) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		boolean isSeller = false;
		
		if (buyerLogin != null) {
            Buyer buyer = helpService.getBuyerDetail(buyerLogin.getbId());
            isSeller = helpService.chkSeller(buyer.getbCode());
        }
		
		List<Notice> noticeList;

        // 판매자일 경우에만 공지사항 분류 선택 가능하도록 설정
		
		if (isSeller && "sellers".equals(ctNtcNo)) {
            noticeList = helpService.selectNoticeSeller();
        } else {
            noticeList = helpService.selectNoticeBuyer();
        }
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("isSeller", isSeller);
        model.addAttribute("ctNtcNo", ctNtcNo);
	}
	
	@GetMapping("/noticedetail")
	public void noticeDetail(
			Model model,
			String ntcCode
			) {
		
		Notice notice = helpService.selectByNotice(ntcCode);
		
		model.addAttribute("notice", notice);
	}
	
	
	@GetMapping("/otolist")
	public void otoList(
			Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg
			) {
		
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageAll(curPage, sCtg, search);
									
		int upPage = helpService.selectCntAllOtoList(upPaging);
		upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
		
		logger.info("upPaging : {}", upPaging);
		
		List<Map<String, Object>> list;
		
	    list = helpService.selectAllOto(upPaging);
		
		List<OtoCt> ctlist = helpService.selectAllOtoCt();
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("list", list);
		model.addAttribute("ctlist", ctlist);
		model.addAttribute("upUrl", "/buyer/help/otolist");
	}
	
	@GetMapping("/otoform")
	public String otoForm(
			Model model,
			Oto oto,
			Authentication authentication
			) {
		logger.info("otoform [GET]");
		
		List<OtoCt> oct = helpService.getAllOct();
		
		if (authentication == null || !(authentication.getPrincipal() instanceof BuyerLogin)) {
		    model.addAttribute("msg", "로그인 후 이용해주세요");
		    model.addAttribute("url", "/buyer/login");
		    return "/layout/alert";
		}
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin: {}", buyerLogin);
		
		Buyer buyer = helpService.getBuyerDetail(buyerLogin.getbId());
		oto.setbCode(buyer.getbCode());
		oto.setOtoName(buyer.getbName());
		oto.setOtoEmail(buyer.getbEmail());	
		model.addAttribute("buyer", buyer);
		
		model.addAttribute("oto", oto);
		model.addAttribute("oct", oct);
		
		return "/buyer/help/otoform";
	}
	
	@PostMapping("/otoform")
	public String otoFormProc(
			Authentication authentication,
			Model model,
			Oto oto,
			@RequestParam("ct_otono") String ctOtoNo, // 선택된 분류 값을 받음
			@RequestParam("detail") List<MultipartFile> detail // 여러 파일 업로드 필드
			) {
		
		//회원 로그인 세션 정보
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		Buyer buyer = helpService.getBuyerDetail(buyerLogin.getbId());
		
		oto.setCtOtoNo(Integer.parseInt(ctOtoNo));
		
		oto.setbCode(buyer.getbCode());
		oto.setOtoName(buyer.getbName());
		oto.setOtoEmail(buyer.getbEmail());
		
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("oto", oto);
		
		//파일 저장
		int res = helpService.insertOto(oto);
		
	    if (res > 0 && detail != null && !detail.isEmpty()) {
	        List<OtoFile> otoFiles = new ArrayList<>();
	        for (MultipartFile mult : detail) {
	            OtoFile otoFile = helpService.saveFile(mult, oto);
	            if (otoFile != null) {
	                otoFiles.add(otoFile);
	            }
	        }

	        int resDetail = 0;
	        for (OtoFile otoFile : otoFiles) {
	            resDetail += helpService.insertOtoFiles(otoFile);
	        }
	        
	        if (resDetail == otoFiles.size()) {
	            // 파일 저장 성공
	        	logger.info("파일 저장 성공");
	        } else {
	            // 파일 저장 실패
	        	logger.info("파일 저장 실패");
	        }
	    } else {
	        // 파일이 없거나 등록 실패 안내
	    	logger.info("등록 실패");
	    }
		
		return "redirect:/buyer/help/otolist";
	}
	
	@GetMapping("/otodetail")
	public void otoDetail(
			Model model,
			String otoCode
			) {
		//문의 내용
		Oto oto = helpService.selectByOtoCode(otoCode);
		List<OtoCt> oct = helpService.getAllOct();
		List<OtoFile> otoFiles = helpService.getOtoFiles(otoCode);
		
		//답변 내용
		Ans ans = helpService.selectAnsByOtoCode(otoCode);
		
		model.addAttribute("oto", oto);
		model.addAttribute("oct",oct);
		model.addAttribute("otoFiles",otoFiles);
		model.addAttribute("ans",ans);
		
		
	}
}

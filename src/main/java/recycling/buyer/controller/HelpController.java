package recycling.buyer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import recycling.dto.manager.Faq;
import recycling.dto.manager.FaqCt;
import recycling.dto.manager.Notice;
import recycling.util.Paging;

// 메뉴 - 고객센터

@Controller
@RequestMapping("/buyer/help")
public class HelpController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private HelpService helpService;
	
	@GetMapping("/main")
	public void main(
			@RequestParam(defaultValue = "0") int curPage,
			Model model,
			HttpSession session,
			Buyer buyer
			) {
		
		Paging paging = helpService.getPaging(curPage);
		List<Faq> list = helpService.selectAllFaq(paging);
		List<FaqCt> faqCtlist = helpService.selectAllCtFaq(paging);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("faqCtlist", faqCtlist);
		
	}
	
	@GetMapping("/noticelist")
	public void noticeList(
			@RequestParam(name = "ct_ntcno", defaultValue = "buyers") String ctNtcNo,
			Model model,
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "") String search,
			HttpSession session
			) {
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		boolean isSeller = false;
		
		if (buyerLogin != null) {
            Buyer buyer = helpService.getBuyerDetail(buyerLogin.getbId());
            isSeller = helpService.chkSeller(buyer.getbCode());
        }
		
//		Paging paging = helpService.getSearchPaging(curPage, search);
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
//        model.addAttribute("paging", paging);
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
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "0") int ct_otono
			) {
		
		Paging paging = helpService.getPaging(curPage);
		
		List<Oto> list;
		
		if (ct_otono == 0) {
	        list = helpService.selectAllOto();
	    } else {
	        // ct_otono 값에 해당하는 분류의 게시글만 가져오도록 함
	        list = helpService.selectByCtOto(Integer.toString(ct_otono));
	    }
		
		List<OtoCt> ctlist = helpService.selectAllOtoCt();
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("ctlist", ctlist);
	}
	
	@GetMapping("/otoform")
	public String otoForm(
			Model model,
			Oto oto,
			HttpSession session
			) {
		logger.info("otoform [GET]");
		
		List<OtoCt> oct = helpService.getAllOct();
		
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
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
			HttpSession session,
			Model model,
			Oto oto,
			@RequestParam("ct_otono") String ctOtoNo, // 선택된 분류 값을 받음
			@RequestParam("detail") List<MultipartFile> detail // 여러 파일 업로드 필드
			, @RequestParam("visibility") String visibility,
            @RequestParam(value = "password", required = false) String password
			) {
		
		//회원 로그인 세션 정보
		BuyerLogin buyerLogin = (BuyerLogin) session.getAttribute("buyers");

		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		Buyer buyer = helpService.getBuyerDetail(buyerLogin.getbId());
		
		oto.setCtOtoNo(Integer.parseInt(ctOtoNo));
		boolean isPrivate = "private".equals(visibility);
		
		oto.setbCode(buyer.getbCode());
		oto.setOtoName(buyer.getbName());
		oto.setOtoEmail(buyer.getbEmail());
		
		//1:1문의 비공개시 비밀번호 입력
//		oto.setVisibility(isPrivate ? "private" : "public");
//		if (isPrivate) {
//	        if (password == null || !password.equals(buyer.getbPw())) {
//	            model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
//	            return "redirect:/buyer/help/otoform";
//	        }
//	    }
		
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
		Oto oto = helpService.selectByOtoCode(otoCode);
		List<OtoCt> oct = helpService.getAllOct();
		List<OtoFile> otoFiles = helpService.getOtoFiles(otoCode);
		
		model.addAttribute("oto", oto);
		model.addAttribute("oct",oct);
		model.addAttribute("otoFiles",otoFiles);
		
	}
}

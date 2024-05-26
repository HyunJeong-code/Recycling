package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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

import recycling.buyer.service.face.ExpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Seller;
import recycling.util.Paging;

// 메뉴 - 체험단

@Controller
@RequestMapping("/buyer/exp")
public class ExpController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ExpService expService;
	
	
	@RequestMapping("/main")
	public void main(
			Model model,
			String expCode,
			@RequestParam(defaultValue = "0")int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "all") String category
			
			) {
		Paging paging = expService.getSearchPaging(curPage, search);
		logger.info("{}", paging);
		
		List<Exp> list;
        if ("recent".equals(category)) {
            list = expService.selectRecentExp(paging);
        } else if ("popular".equals(category)) {
            list = expService.selectPopularExp(paging);
        } else {
            list = expService.selectAllExp(paging);
        }
        
        Map<String, ExpFile> main = new HashMap<>();
        for (Exp exp : list) {
            List<ExpFile> expFiles = expService.selectByExpFile(exp.getExpCode());
            for (ExpFile file : expFiles) {
                if (file.getCtPflNo() == 600) { // 썸네일 파일 번호
                	main.put(exp.getExpCode(), file);
                    break;
                }
            }
        }

        // 상단 새체험, 인기체험
        List<Exp> topPopList = expService.selectTopPopExp();
        List<Exp> topRecList = expService.selectTopRecExp();
        

        model.addAttribute("paging", paging);
        model.addAttribute("list", list);
        model.addAttribute("topPopList", topPopList);
        model.addAttribute("search", search);
        model.addAttribute("category", category);
        model.addAttribute("topRecList", topRecList);
        model.addAttribute("main", main);
	}
	
	@GetMapping("/expdetail")
	public void expDetail(
			String expCode,
			Model model,
			String sCode,
			String bCode
			) {
		
		Exp exp = expService.selectByExpCode(expCode);
		
		//첨부파일 main=썸네일, detail=상세이미지
		List<ExpFile> expFiles = expService.selectByExpFile(expCode);
		
		ExpFile main = null;
		List<ExpFile> detail = new ArrayList<>();
		
		for (ExpFile file : expFiles) {
	        if (file.getCtPflNo() == 600) {
	        	main = file;
	        } else if (file.getCtPflNo() == 610) {
	        	detail.add(file);
	        }
	    }
		
		//판매자 상세정보
		sCode = exp.getsCode();
		Seller seller = expService.getSellerInfo(sCode);
		
		bCode = seller.getbCode();
		Buyer buyer = expService.getBuyerInfo(bCode);
		
		String selType = "";
		if("P".equals(buyer.getbCtCode())) {
			selType = "개인";
		} else if ("C".equals(buyer.getbCtCode())) {
			selType = "기업";
		}
		
		model.addAttribute("exp", exp);
		model.addAttribute("expFiles", expFiles);
		model.addAttribute("seller", seller);
		model.addAttribute("buyer", buyer);
		model.addAttribute("selType", selType);
		model.addAttribute("main", main);
		model.addAttribute("detail", detail);
		
	}
	
	@GetMapping("/exprvwlist")
	public void expRvwList() {
		
	}
	
	@GetMapping("/exprvwdetail")
	public void expRvwDetail() {
		
	}
	
	//여기부터 시작
	@GetMapping("/expresform")
	public void expResForm(
			String expCode,
			Authentication authentication,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		
		Buyer buyer = expService.getBuyerDetail(buyerLogin.getbId());
		
        List<ExpSch> expSchList = expService.getExpSchList(expCode);
        
        
		model.addAttribute("buyer", buyer);
        model.addAttribute("expSchList", expSchList);
	}
	
	@PostMapping("/expresform")
	public String expResFormProc(
			Authentication authentication,
			@RequestParam("schTime") List<String> schTime,
			Buyer buyer,
			int schNo,
			Exp exp,
			int resCnt,
			String resDate,
			Model model
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		if(buyerLogin == null) {
			
			model.addAttribute("error", "로그인 해주세요.");
			
			return "redirect:/buyer/login";
			
		}
		
		buyer = expService.getBuyerDetail(buyerLogin.getbId());
		
		ExpSch expSch = expService.getExpSch(schNo);
        if (expSch.getSchCnt() < resCnt) {
            model.addAttribute("error", "예약 가능한 인원수를 초과했습니다.");
            return "buyer/exp/expresform";
        }
		
        ExpRes expRes = new ExpRes();
        expRes.setbCode(buyer.getbCode());
        expRes.setSchNo(expSch.getSchNo());
        expRes.setResName(buyer.getbName());
        expRes.setResPhone(buyer.getbPhone());
        expRes.setResEmail(buyer.getbEmail());
        expRes.setResExpName(exp.getExpName());
//        expRes.setResCnt(resCnt);
//        expRes.setResDate(resDate);
        
        expService.insertExpRes(expRes);
        expService.updateExpSchCnt(schNo, expSch.getSchCnt() - resCnt);
		
		model.addAttribute("buyer", buyer);
		
		
		return "redirect:/buyer/exp/expdetail";
	}
}

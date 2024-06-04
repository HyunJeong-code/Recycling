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

import recycling.buyer.service.face.ExpService;
import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Seller;
import recycling.page.face.PageService;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 메뉴 - 체험단

@Controller
@RequestMapping("/buyer/exp")
public class ExpController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ExpService expService;
	@Autowired private PageService pageService;
	
	@RequestMapping("/main")
	public void main(
			Model model,
			String expCode,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg,
			@RequestParam(defaultValue = "all") String category
			
			) {
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageAll(curPage, sCtg, search);
									
		int upPage = expService.selectCntAllExpList(upPaging);
		upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
		
		logger.info("upPaging : {}", upPaging);
		
		
		List<Exp> list;
        if ("recent".equals(category)) {
            list = expService.selectRecentExp(upPaging);
        } else if ("popular".equals(category)) {
            list = expService.selectPopularExp(upPaging);
        } else {
            list = expService.selectAllExp(upPaging);
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
        

        model.addAttribute("upPaging", upPaging);
        model.addAttribute("list", list);
        model.addAttribute("topPopList", topPopList);
        model.addAttribute("category", category);
        model.addAttribute("topRecList", topRecList);
        model.addAttribute("main", main);
        model.addAttribute("upUrl", "/buyer/exp/main");
	}
	
	@GetMapping("/expdetail")
	public void expDetail(
			String expCode,
			Model model,
			String sCode,
			String bCode,
			Authentication authentication,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg
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
		
		//체험단 후기
		
//		PagingAndCtg upPaging = new PagingAndCtg();
//		upPaging = pageService.upPageAll(curPage, sCtg, search);
//		
//		upPaging.setSearch(search);
//		
//		int upPage = expService.selectCntRvwList(upPaging, expCode);
//		upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
//		
//		logger.info("upPaging : {}", upPaging);
//		
////		List<Map<String, Object>> expReviews = expService.selectRvwByExp(expCode, upPaging);
//		
//		Map<String, Object> params = new HashMap<>();
//	    params.put("expCode", expCode);
//	    params.put("search", search);
//	    
//		List<Map<String, Object>> expReviews = expService.selectRvwByExp(params);
//		logger.info("RVW : {}", expReviews);
//		logger.info("RVW : {}", expReviews.size());
		
		//체험단 후기
		List<Map<String, Object>> expReviews = expService.selectRvwByExp(expCode);
		logger.info("RVW : {}", expReviews);
		logger.info("RVW : {}", expReviews.size());
		
		
		boolean isLoggedIn = authentication != null && authentication.isAuthenticated();
	    Buyer loggedInUser = null;
	    if (isLoggedIn) {
	        BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	        loggedInUser = expService.getBuyerDetail(buyerLogin.getbId());
	    }
		
		model.addAttribute("exp", exp);
		model.addAttribute("expFiles", expFiles);
		model.addAttribute("seller", seller);
		model.addAttribute("buyer", buyer);
		model.addAttribute("selType", selType);
		model.addAttribute("main", main);
		model.addAttribute("detail", detail);
		model.addAttribute("expReviews", expReviews);
		model.addAttribute("expReviewsSize", expReviews.size());
		model.addAttribute("isLoggedIn", isLoggedIn);
	    model.addAttribute("loggedInUser", loggedInUser);
	    model.addAttribute("buyerProf", buyerProf);
//	    model.addAttribute("upPaging", upPaging);
//	    model.addAttribute("upUrl", "/buyer/exp/expdetail?expCode=" + expCode);
	}
	
	@PostMapping("/expdetail")
	public String expDetailRvw(
	        @RequestParam String expCode,
	        @RequestParam int rvwGrade,
	        @RequestParam String rvwContent,
	        Authentication authentication,
	        Model model
	        ) {
	    
	    // 로그인 여부 확인
	    if (authentication == null || !authentication.isAuthenticated()) {
	        model.addAttribute("msg", "로그인 후 이용해주세요.");
	        model.addAttribute("url", "/buyer/login");
	        return "/layout/alert";
	    }
	    
	    // 후기 작성 가능한 조건 확인
	    BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	    String bCode = buyerLogin.getbCode();
	    logger.info("bCode: {}", bCode);
	    
	    Map<String, Object> params = new HashMap<>();
	    params.put("bCode", bCode);
	    params.put("expCode", expCode);
	    List<ExpRes> resChk = expService.selectByBuyerChk(params);
	    
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    
	    boolean canReview = false;
	    for (ExpRes res : resChk) {
	    	try {
	    		Date resDate = dateFormat.parse(res.getResDate());
	        if (resDate.before(new Date())) {
	            canReview = true;
	            break;
	        }
	    } catch (ParseException e) {
	    	e.printStackTrace();
		}
	    }
	    
	    if (!canReview) {
	        model.addAttribute("msg", "체험이 완료된 후에 후기를 작성할 수 있습니다.");
	        model.addAttribute("url", "/buyer/exp/expdetail?expCode=" + expCode);
	        return "/layout/alert";
	    }
	    
	    // 후기 저장
	    ExpReview expReview = new ExpReview();
	    expReview.setbCode(bCode);
	    expReview.setExpCode(expCode);
	    expReview.setRvwGrade(rvwGrade);
	    expReview.setRvwContent(rvwContent);
	    
	    logger.info("expReview: {}", expReview);
	    
	    expService.insertExpReview(expReview);
	    
	    model.addAttribute("msg", "후기가 성공적으로 등록되었습니다.");
	    model.addAttribute("url", "/buyer/exp/expdetail?expCode=" + expCode);
	    return "/layout/alert";
	}
	
	@GetMapping("/expresform")
	public String expResForm(
	        String expCode,
	        Authentication authentication,
	        Model model
	        ) {
	    // 구매자 로그인 세션 정보
	    BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

	    if (buyerLogin == null) {
	        model.addAttribute("msg", "로그인 후 이용해주세요.");
	        model.addAttribute("url", "/buyer/login");
	        return "/layout/alert";
	    }
	    Buyer buyer = expService.getBuyerDetail(buyerLogin.getbId());

	    // 체험 일정 리스트
	    List<ExpSch> expSchList = expService.getExpSchList(expCode);
	    logger.info("expSchList: {}", expSchList);

	    // 체험단 체험비
	    Exp exp = expService.selectByExpCode(expCode);
	    int resPrice = exp.getExpPrice();

	    model.addAttribute("buyer", buyer);
	    model.addAttribute("expSchList", expSchList);
	    model.addAttribute("resPrice", resPrice);
	    model.addAttribute("exp", exp);

	    return "/buyer/exp/expresform";
	}
	
	@GetMapping("/pay")
	public void pay(
			Authentication authentication,
			Model model,
			Buyer buyer,
			HttpSession session
			) {
		
	}
	
	
	//체험단 작성폼
	@GetMapping("/expresform")
	public void expResForm(
			String expCode,
			Authentication authentication,
			Model model
			) {
		//구매자 로그인 세션 정보
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		Buyer buyer = expService.getBuyerDetail(buyerLogin.getbId());
		
		//체험 일정 리스트
        List<ExpSch> expSchList = expService.getExpSchList(expCode);
        logger.info("expSchList: {}", expSchList);
        
        //체험단 체험비
        Exp exp = expService.selectByExpCode(expCode);
        int resPrice = exp.getExpPrice();
        
		model.addAttribute("buyer", buyer);
        model.addAttribute("expSchList", expSchList);
        model.addAttribute("resPrice", resPrice);
	}
	
	//체험단 작성폼
	@PostMapping("/expresform")
	public String expResFormProc(
	        Authentication authentication,
	        Buyer buyer,
	        int schNo,
	        int resCnt,
	        String resDate,
	        String resTime,
	        Model model
	        ) {
		
	    //구매자 로그인 세션 정보
	    BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	    logger.info("buyerLogin : {}", buyerLogin);
	    
	    if (buyerLogin == null) {
	        model.addAttribute("error", "로그인 해주세요.");
	        return "redirect:/buyer/login";
	    }
	    
	    buyer = expService.getBuyerDetail(buyerLogin.getbId());
	    
	    //체험 일정번호 일치하는 인원수
	    ExpSch expSch = expService.getExpSch(schNo);
	    
	    if (expSch.getSchCnt() < resCnt) {
	        model.addAttribute("error", "예약 가능한 인원수를 초과했습니다.");
	        return "buyer/exp/expresform";
	    }
	    
	    //체험 예약 시 총 가격
	    Exp exp = expService.selectByExpCode(expSch.getExpCode());
	    int resPrice = exp.getExpPrice();
	    int resSum = resCnt * resPrice;
	    
	    //체험예약
	    ExpRes expRes = new ExpRes();
	    expRes.setbCode(buyer.getbCode());
	    expRes.setSchNo(expSch.getSchNo());
	    expRes.setResName(buyer.getbName());
	    expRes.setResPhone(buyer.getbPhone());
	    expRes.setResEmail(buyer.getbEmail());
	    expRes.setResExpName(exp.getExpName());
	    expRes.setResCnt(resCnt);
	    expRes.setResPrice(resPrice);
	    expRes.setResSum(resSum);
	    expRes.setResDate(expSch.getSchDate());
	    expRes.setResTime(expSch.getSchTime());
	    
	    String res_pay = "Card";
	    String res_cnf = "N";
	    String res_cnl = "N";
	    String res_dt = "Test data for reservation 1";
	    
	    expRes.setResPay(res_pay);
	    expRes.setResCnf(res_cnf);
	    expRes.setResCnl(res_cnl);
	    expRes.setResDt(res_dt);
	    
	    logger.info("expRes : {}", expRes);
	    
	    //db삽입, 인원수 update
	    expService.insertExpRes(expRes);
	    expService.updateExpSchCnt(schNo, resCnt);
	    
	    model.addAttribute("expRes", expRes);
	    model.addAttribute("buyer", buyer);
	    model.addAttribute("exp", exp);
	    model.addAttribute("resSum", resSum);
	    model.addAttribute("resPrice", resPrice); // resPrice를 모델에 추가

	    return "redirect:/buyer/exp/main";
	}

}

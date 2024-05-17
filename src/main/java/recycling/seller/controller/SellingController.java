package recycling.seller.controller;

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

import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.Prd;
import recycling.seller.service.face.SellingService;
import recycling.util.Paging;

// 상품-판매 관리

@Controller
@RequestMapping("/seller/selling")
public class SellingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingService sellingService;
	@Autowired HttpSession session;
	
	@GetMapping("/rcylist")
	public void rcyList(Model model) {
		//테스트용 세션***********************************************테스트
		session.setAttribute("sCode", "SEL0000003");
		
		String sCode = (String)session.getAttribute("sCode");
		
		//로그인 되어있는 아이디의 재활용 판매 상품 조회
		List<Prd> plist = sellingService.selectAllrcyPrd(sCode);
		
		//주문 리스트
		List<MyOrder> olist = new ArrayList<MyOrder>();
		
		//조회된 상품의 주문 리스트 조회
		for(Prd prd : plist) {
			String prdCode = prd.getPrdCode();
			
			List<MyOrder> list = sellingService.selectAllMyOrder(prdCode);
			
			for(MyOrder mo : list) {
				olist.add(mo);
			}
		}
		
		//삭제된 상품을 제외한 상품 리스트
		List<Prd> nplist = new ArrayList<Prd>();
		
		for(Prd prd : plist) {
			String prdOut = prd.getPrdOut();
			
			logger.info("{}",prdOut);
			
			if("N".equals(prdOut)) {
				nplist.add(prd);
			}
		}
		
		logger.info("{}",nplist);
		
		model.addAttribute("plist", nplist);
		model.addAttribute("olist", olist);
	}
	
	@GetMapping("/upcylist")
	public void upcyList(Model model) {
		//테스트용 세션***********************************************테스트
		session.setAttribute("sCode", "SEL0000003");
		
		String sCode = (String)session.getAttribute("sCode");
		
		//로그인 되어있는 아이디의 재활용 판매 상품 조회
		List<Prd> plist = sellingService.selectAllupcyPrd(sCode);
		
		//주문 리스트
		List<MyOrder> olist = new ArrayList<MyOrder>();
		
		//조회된 상품의 주문 리스트 조회
		for(Prd prd : plist) {
			String prdCode = prd.getPrdCode();
			
			List<MyOrder> list = sellingService.selectAllMyOrder(prdCode);
			
			for(MyOrder mo : list) {
				olist.add(mo);
			}
		}
		
		//삭제된 상품을 제외한 상품 리스트
		List<Prd> nplist = new ArrayList<Prd>();
		
		for(Prd prd : plist) {
			String prdOut = prd.getPrdOut();
			
			logger.info("{}",prdOut);
			
			if("N".equals(prdOut)) {
				nplist.add(prd);
			}
		}
		
		logger.info("{}",nplist);
		
		model.addAttribute("plist", nplist);
		model.addAttribute("olist", olist);
	}
	
	@GetMapping("/upcydetail")
	public void upcyDetail(String prdCode, Model model) {
		Prd prd = sellingService.selectByprdCode(prdCode);
		
		model.addAttribute("prd", prd);
	}
	
	@GetMapping("/rcydetail")
	public void rcyDetail(String prdCode, Model model) {
		Prd prd = sellingService.selectByprdCode(prdCode);
		
		model.addAttribute("prd", prd);
	}
	
	@RequestMapping("/cydel")
	public String upcyDel(@RequestParam(value = "arr[]") List<String> list) {
		logger.info("{}",list);
		
		
		for(String prdCode : list) {
			int deleteRes = sellingService.deletePrd(prdCode);  
		}
		
		return "jsonView";
	}
	
	@RequestMapping("/cyupdate")
	public String upcyUpdate(Prd prd) {
		logger.info("{}", prd);
		
		int res = sellingService.updatePrd(prd);
		
		return "redirect:/seller/selling/upcylist";
	}
	
	@GetMapping("/explist")
	public void expList(
			Model model,
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "") String search,
			HttpSession session
			) {
		logger.info("/explist [GET]");
		
//		String sellerId = (String) session.getAttribute("sCode");

//		if(sellerId == null) { //로그인 상태가 아니라면 로그인화면으로
			
//			return "redirect:/buyer/login";
			
//		} else { //로그인한 회원의 list만 띄우기
			
//			paging = sellingService.getSearchPaging(curPage, search);
//			List<Exp> list = sellingService.selectMyExpList(paging, sellerId);
//			model.addAttribute("paging", paging);
//			model.addAttribute("list", list);
//		}
		Paging paging = sellingService.getSearchPaging(curPage, search);
		List<Exp> list = sellingService.selectMyExpList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
//		return "/seller/selling/explist";
		
	}
	
	@GetMapping("/expdetail")
	public void expDetail(
			Model model,
			String expCode,
			ExpFile expFile
			) {
		
		Exp exp = sellingService.selectByExp(expCode);
		model.addAttribute("exp", exp);
	}
	
	
	@GetMapping("/expresdetail")
	public void expResDetail(
			Model model,
			@RequestParam(defaultValue = "0") int curPage,
			String expCode
			
			) {
		
		Exp exp = sellingService.selectByExp(expCode);
		Paging paging = sellingService.getPaging(curPage);
		List<ExpRes> resList = sellingService.selectResList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("exp", exp);
		model.addAttribute("resList", resList);

		
	}
}

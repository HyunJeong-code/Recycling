package recycling.seller.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.Prd;
import recycling.seller.service.face.SellingService;
import recycling.util.Paging;
import recycling.util.Range;

// 상품-판매 관리

@Controller
@RequestMapping("/seller/selling")
public class SellingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingService sellingService;
	
	@GetMapping("/rcylist")
	public void rcyList(Authentication authentication, Model model) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String sCode = buyerLogin.getsCode();
		
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
	public void upcyList(Authentication authentication, Model model) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String sCode = buyerLogin.getsCode();
		
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
		
		//내림차순 정렬
		Collections.sort(olist, new Range());
		
		logger.info("olist: {}",olist);
		logger.info("nplist: {}",nplist);
		
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
	
	@GetMapping("/updatestt")
    public String updateStt(@RequestParam(value = "arr[]") List<String> list, int sttNo, Model model) {
		logger.info("list: {}",list);
		logger.info("sttNo: {}",sttNo);
		
		if(sttNo == 980 || sttNo == 960) {
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
	
	@PostMapping("/shipform")
	public String shipForm(@RequestBody List<MyOrder> list) {
		logger.info("list: {}",list);
		
		for(MyOrder myOrder : list) {
			int res = sellingService.insertShip(myOrder);
			
			logger.info("myOrder: {}",myOrder);			
		}
		
	    return "jsonView";	
	}
	
	@PostMapping("/shipdel")
	public String shipDel(@RequestParam(value = "arr[]") List<String> list) {
		
		for(String orddtCode : list) {
			logger.info("{}",orddtCode);
			int deleteRes = sellingService.deleteShip(orddtCode);  
		}
		
	    return "jsonView"; 
	}
	
	@GetMapping("/upcyorderdetail")
	public void upcyOrderDetail(String orddtCode, Model model) {
		
		MyOrder myOrder = sellingService.selectMyOrderByOrddtCode(orddtCode);
		
		model.addAttribute("order", myOrder);
	}
	
	@PostMapping("/upcyorderupdate")
	public String upcyOrderUpdate(MyOrder myOrder) {
		logger.info("{}", myOrder);
		
		int res = sellingService.updateMyOrder(myOrder);
		
		return "redirect:upcylist";
	}
	
	@GetMapping("/delship")
	public String delShip(String orddtCode) {
		int res = sellingService.deleteShip(orddtCode);
		
		return "redirect:upcylist";
	}
	

	@GetMapping("/main")
	public void main(HttpSession session, Model model) {
		logger.info("/seller/selling/main [GET]");
		
		BuyerLogin seller = (BuyerLogin) session.getAttribute("buyers");
		logger.info("seller : {}", seller);
		
//		List<AllPrd> allPrd = sellingService.selectAllPrd(seller);
	}
	
	@GetMapping("/explist")
	public void expList(
			Model model,
			@RequestParam(defaultValue = "0")int curPage, 
			@RequestParam(defaultValue = "") String search,
			HttpSession session,
			Exp exp
			) {
		logger.info("/explist [GET]");
		
//		BuyerLogin seller = (BuyerLogin) session.getAttribute("buyers"); 
//		exp.setsCode(seller.getsCode());
//		if(seller == null) { //로그인 상태가 아니라면 로그인화면으로
			
//			return "redirect:/buyer/login";
			
//		} else { //로그인한 회원의 list만 띄우기
			
//			paging = sellingService.getSearchPaging(curPage, search);
//			List<Exp> list = sellingService.selectMyExpList(paging, seller);
//			model.addAttribute("paging", paging);
//			model.addAttribute("list", list);
//		}
		Paging paging = sellingService.getSearchPaging(curPage, search);
		List<Exp> list = sellingService.selectMyExpList(paging);
		
		model.addAttribute("paging", paging);
		model.addAttribute("search", search);
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
			@RequestParam String expCode
			
			) {
		
		Exp exp = sellingService.selectByExp(expCode);
//		Paging paging = sellingService.getPaging(curPage);
//		List<ExpRes> resList = sellingService.selectResList(expCode, paging);
		List<ExpRes> resList = sellingService.selectResList(expCode);
		
//		model.addAttribute("paging", paging);
		model.addAttribute("exp", exp);
		model.addAttribute("resList", resList);

		
	}
}
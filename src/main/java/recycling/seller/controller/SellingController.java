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
import recycling.dto.manager.ResSchCnt;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.page.face.PageService;
import recycling.seller.service.face.SellingService;
import recycling.util.Paging;
import recycling.util.PagingAndCtg;

// 상품-판매 관리

@Controller
@RequestMapping("/seller/selling")
public class SellingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingService sellingService;
	@Autowired private PageService pageService;
	
	
	@GetMapping("/rcylist")
	public void rcyList(Authentication authentication, Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
        
        // 문의글 페이지 수 계산
  		PagingAndCtg upPaging = new PagingAndCtg();
  		PagingAndCtg unPaging = new PagingAndCtg();
         
        upPaging = pageService.upPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
        unPaging = pageService.unPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
         
        int upPage = sellingService.selectCntAllrcyPrd(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
         
  		logger.info("upPaging : {}", upPaging);
  		upPaging.setUser(buyerLogin.getsCode());
  		
  		
  		int unPage = sellingService.selectCntAllrcyMyOrder(unPaging);
  		unPaging = new PagingAndCtg(unPage, unPaging.getCurPage(), unPaging.getSearch());
         
  		logger.info("unPaging : {}", unPaging);
  		unPaging.setUser(buyerLogin.getsCode());
		
		
		//로그인 되어있는 아이디의 재활용 판매 상품 조회
		List<Prd> plist = sellingService.selectAllrcyPrd(upPaging);
		
		//주문 리스트
		List<MyOrder> olist = sellingService.selectAllrcyMyOrder(unPaging);
		
		//조회된 상품의 주문 리스트 조회
//		for(Prd prd : plist) {
//			String prdCode = prd.getPrdCode();
//			
//			List<MyOrder> list = sellingService.selectAllMyOrder(prdCode);
//			
//			for(MyOrder mo : list) {
//				olist.add(mo);
//			}
//		}
		
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
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/seller/selling/rcylist");
		model.addAttribute("unPaging", unPaging);
		model.addAttribute("unUrl", "/seller/selling/rcylist");
	}
	
	@GetMapping("/upcylist")
	public void upcyList(Authentication authentication, Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);

        // 문의글 페이지 수 계산
 		PagingAndCtg upPaging = new PagingAndCtg();
 		PagingAndCtg unPaging = new PagingAndCtg();
        
        upPaging = pageService.upPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
        unPaging = pageService.unPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
        
        int upPage = sellingService.selectCntAllupcyPrd(upPaging);
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        
 		logger.info("upPaging : {}", upPaging);
 		upPaging.setUser(buyerLogin.getsCode());
 		
 		
 		int unPage = sellingService.selectCntAllMyOrder(unPaging);
 		unPaging = new PagingAndCtg(unPage, unPaging.getCurPage(), unPaging.getSearch());
        
 		logger.info("unPaging : {}", unPaging);
 		unPaging.setUser(buyerLogin.getsCode());
 		
		
		//로그인 되어있는 아이디의 재활용 판매 상품 조회
		List<Prd> plist = sellingService.selectAllupcyPrd(upPaging);
		
		logger.info("{}",upPaging);
		
		//주문 리스트
		List<MyOrder> olist = sellingService.selectAllupcyMyOrder(unPaging);
		
		//삭제된 상품을 제외한 상품 리스트
		List<Prd> nplist = new ArrayList<Prd>();
		
		for(Prd prd : plist) {
			String prdOut = prd.getPrdOut();
			
			logger.info("{}",prdOut);
			
			if("N".equals(prdOut)) {
				nplist.add(prd);
			}
		}
		
		logger.info("olist: {}",olist);
		logger.info("nplist: {}",nplist);
		
		model.addAttribute("plist", nplist);
		model.addAttribute("olist", olist);
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/seller/selling/upcylist");
		model.addAttribute("unPaging", unPaging);
		model.addAttribute("unUrl", "/seller/selling/upcylist");
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
	public String upcyOrderUpdate(MyOrder myOrder, Model model) {
		logger.info("{}", myOrder);
		
		int res = sellingService.updateMyOrder(myOrder);
		
		model.addAttribute("msg", "주문정보가 수정되었습니다.");
		model.addAttribute("url", "/seller/selling/upcylist");
		return "/layout/alert";
	}
	
	@GetMapping("/delship")
	public String delShip(String orddtCode, Model model) {
		int res = sellingService.deleteShip(orddtCode);
		
		
		model.addAttribute("msg", "송장이 삭제되었습니다.");
		model.addAttribute("url", "/seller/selling/upcylist");
		return "/layout/alert";
	}
	

	@GetMapping("/main")
	public void main(HttpSession session, Model model) {
		logger.info("/seller/selling/main [GET]");
		
		BuyerLogin seller = (BuyerLogin) session.getAttribute("buyers");
		logger.info("seller : {}", seller);
		
//		List<AllPrd> allPrd = sellingService.selectAllPrd(seller);
	}
	
	//판매자 체험 조회
	@GetMapping("/explist")
	public void expList(
			Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg,
			HttpSession session,
			Authentication authentication,
			Exp exp
			) {
		logger.info("/explist [GET]");
		
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		//페이지 수 계산
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
		
		int upPage = sellingService.selectCntAllexpList(upPaging);
		upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
		
		logger.info("upPaging : {}", upPaging);
 		upPaging.setUser(buyerLogin.getsCode());
		
		List<Exp> list = sellingService.selectMyExpList(upPaging);
		
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("list", list);
		model.addAttribute("upUrl", "/seller/selling/explist");
		
	}
	
	//체험단 상세조회
	@GetMapping("/expdetail")
	public void expDetail(
			Authentication authentication,
			Model model,
			String expCode,
			ExpFile expFile, 
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "") String sCtg
			) {
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("buyerLogin : {}", buyerLogin);
		
		//페이징
		PagingAndCtg upPaging = new PagingAndCtg();
		upPaging = pageService.upPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
		int upPage = sellingService.selectCntAllExpSch(upPaging);
		upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());

		//상세 보기
		Exp exp = sellingService.selectByExp(expCode);
		model.addAttribute("exp", exp);
		
		//예약 스케쥴 조회기능
		List<ExpSch> schList = sellingService.selectAllSch(expCode);
		model.addAttribute("expSchList", schList);
		logger.info("schList: {}", schList);
		
		//예약된 인원 조회
		List<ResSchCnt> resCnt = sellingService.selectByResCnt(expCode);
		model.addAttribute("resCnt", resCnt);
		
		//첨부파일 main=썸네일, detail=상세이미지
		List<ExpFile> expFiles = sellingService.selectByExpFile(expCode);
		
		ExpFile main = null;
		List<ExpFile> detail = new ArrayList<>();
		
		for (ExpFile file : expFiles) {
	        if (file.getCtPflNo() == 600) {
	        	main = file;
	        } else if (file.getCtPflNo() == 610) {
	        	detail.add(file);
	        }
	    }
		
		model.addAttribute("expFiles", expFiles);
		model.addAttribute("main", main);
		model.addAttribute("detail", detail);
		model.addAttribute("upPaging", upPaging);
		model.addAttribute("upUrl", "/seller/selling/expdetail?expCode=" + expCode);
	}
	
	
	@GetMapping("/expresdetail")
	public void expResDetail(
			Model model,
			@RequestParam(defaultValue = "0") int curPage,
			@RequestParam String expCode
			
			) {
		
		Exp exp = sellingService.selectByExp(expCode);
		
		model.addAttribute("exp", exp);

		
	}
}
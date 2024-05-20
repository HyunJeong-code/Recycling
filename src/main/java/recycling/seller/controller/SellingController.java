package recycling.seller.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.buyer.service.face.BuyerService;
import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
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
	@Autowired private BuyerService buyerService;
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
	
	@GetMapping("/paycencel")
    public String payCencel(String orddtCode, Model model) {
		logger.info("ordCode: {}",orddtCode);
		
		//Orders orders = buyerService.selectByordCode(ordCode);
		
		//OrderDetail 조회
		OrderDetail order = sellingService.selectByorddtCode(orddtCode); 
		logger.info("order: {}",order);
		
		String token = Token();
		logger.info("token: {}",token);
		
        // IAMPORT API에 전달할 요청 본문 생성
        String requestBody = "{\"imp_uid\":\"" + order.getOrdCode() + "\",\"amount\":\"" + order.getOrdSum() + "\"}";
        
        // IAMPORT API에 전달할 URL 생성
        String url = "https://api.iamport.kr/payments/cancel";
        
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Content-Type", "application/json")
                .header("Authorization", "Bearer " + token) // 헤더에 인증 토큰 포함
                .method("POST", HttpRequest.BodyPublishers.ofString(requestBody))
                .build();
        
        try {
            HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
            logger.info("response : {}", response.body());
            
            // 응답 코드에 따라 처리
            if (response.statusCode() == 200) {
                // 처리 성공
            	model.addAttribute("cencelMsg", "취소 완료");
            } else {
                // 처리 실패
                logger.error("Failed to cancel payment: {}", response.body());
                model.addAttribute("cencelMsg", "취소 실패");
            }
        } catch (IOException | InterruptedException e) {
            logger.error("Exception occurred while cancelling payment: {}", e.getMessage());
            model.addAttribute("cencelMsg", "취소 실패");
        }
        
        return "jsonView";
    }
	
	//포트원 토큰 생성
    public String Token() {
	    
	   String imp_key = "3714420222233344";
	   
	   String imp_secret = "E8fCoFWtHDhFcM8MyXthV9Cvy7xGCelukkrB5GBXonp9E89exs6FavH3O2nysesbcd05cHl3SSyfeuq6";
	    
       String param = "";
       param += "imp_key:" +imp_key;
       param += ",imp_secret:" +imp_secret;
       logger.debug("param : {}", param);
       HttpRequest request = HttpRequest.newBuilder()
              .uri(URI.create("https://api.iamport.kr/users/getToken"))
              .header("Content-Type", "application/json")
              .method("POST", HttpRequest.BodyPublishers.ofString("{\"imp_key\":\"3714420222233344\",\"imp_secret\":\"E8fCoFWtHDhFcM8MyXthV9Cvy7xGCelukkrB5GBXonp9E89exs6FavH3O2nysesbcd05cHl3SSyfeuq6\"}")).build();
          HttpResponse<String> response = null;
          try {
             response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
             logger.debug("response.body()response.body():{}" ,response.body()); 

               // JSON 파싱
               JSONObject jsonResponse = (JSONObject) new JSONParser().parse(response.body());
               if ((long) jsonResponse.get("code") == 0) {
                   JSONObject responseBody = (JSONObject) jsonResponse.get("response");
                   return (String) responseBody.get("access_token");
               } else {
                   logger.error("Failed to get access token: {}", jsonResponse.get("message"));
               }
           } catch (Exception e) {
               e.printStackTrace();
           }
           return null;
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

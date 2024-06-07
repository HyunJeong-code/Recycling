package recycling.buyer.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.fasterxml.jackson.databind.ObjectMapper;

import recycling.buyer.service.face.BuyerService;
import recycling.buyer.service.face.RecyclingService;

import recycling.buyer.service.face.UpcyclingService;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.Rcy;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;

import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;
import recycling.dto.seller.Seller;

// 메뉴 - 재활용품
@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private RecyclingService recyclingService;
    @Autowired private BuyerService buyerService;
    @Autowired private UpcyclingService upcyclingService;
	

	@GetMapping("/main")
	public String rcyMain(Model model) {
		logger.info("/buyer/recycling/main [GET]");
		
		//상품 정보 로드
		List<Prd> list = recyclingService.selectPrdList();
		List<Prd> latestList = recyclingService.selectLatestList();
		List<Prd> hitList = recyclingService.selectHitList();
		
		//상품 썸네일 파일명 로드
	    List<String> prdImageThumNames = new ArrayList<>();
	    List<String> latestPrdImageThumNames = new ArrayList<>();
	    List<String> hitPrdImageThumNames = new ArrayList<>();
	    
	    // 각각의 상품에 대한 썸네일 파일명을 매퍼를 통해 가져옴
	    for (Prd prd : list) {
	        List<String> prdImageThumList = recyclingService.selectPrdImageThum(prd.getPrdCode());
	        if (!prdImageThumList.isEmpty()) {
	            prdImageThumNames.add(prdImageThumList.get(0));
	        } else {
	            prdImageThumNames.add("error_400px.png"); // 기본 에러 이미지
	        }
	    }
	    for (Prd prd : latestList) {
	        List<String> latestPrdImageThumList = recyclingService.selectLatestPrdImageThum(prd.getPrdCode());
	        if (!latestPrdImageThumList.isEmpty()) {
	            latestPrdImageThumNames.add(latestPrdImageThumList.get(0));
	        } else {
	            latestPrdImageThumNames.add("error_400px.png"); // 기본 에러 이미지
	        }
	    }
	    for (Prd prd : hitList) {
	        List<String> hitPrdImageThumList = recyclingService.selectHitPrdImageThum(prd.getPrdCode());
	        if (!hitPrdImageThumList.isEmpty()) {
	            hitPrdImageThumNames.add(hitPrdImageThumList.get(0));
	        } else {
	            hitPrdImageThumNames.add("error_400px.png"); // 기본 에러 이미지
	        }
	    }
		
		
		model.addAttribute("list", list);
		model.addAttribute("latestList", latestList);
		model.addAttribute("hitList", hitList);
		
		model.addAttribute("prdImageThumNames", prdImageThumNames);
		model.addAttribute("latestPrdImageThumNames", latestPrdImageThumNames);
		model.addAttribute("hitPrdImageThumNames", hitPrdImageThumNames);
		
		
		model.addAttribute("list", list);

		return "buyer/recycling/main";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/findseller", method = RequestMethod.GET)
	public String findSeller(String sCode, String sAddr, Model model, HttpSession session) {

		ObjectMapper objectMapper = new ObjectMapper();

		// 판매자 찾기
		List<Seller> location = this.recyclingService.findSeller();

		List<Map<String, Object>> gpsList = new ArrayList<>();

		try {
			for (Seller seller : location) {
				Map<String, Object> sellerMap = objectMapper.convertValue(seller, Map.class);
				List<Prd> prdList = recyclingService.findRcyBySellerCode(seller.getsCode());
				if (!prdList.isEmpty()) {
					sellerMap.put("prdCode", prdList.get(0).getPrdCode());
				} else {
					sellerMap.put("prdCode", ""); // 혹시 관련된 재활용품 코드가 없을 경우 빈 문자열로 설정
				}
				gpsList.add(sellerMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("gpsList", gpsList);
		model.addAttribute("location", location);

		return "buyer/recycling/findseller";

	}

	@GetMapping("/rcydetail")
	public String rcyDetail(@RequestParam("prdcode") String prdCode, Model model, Authentication authentication) {
		logger.info("/rcydetail [GET] - prdCode: {}", prdCode);

		if (authentication != null && authentication.isAuthenticated()) {
			// 세션이 존재하면 로그인 정보를 출력
			BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
			logger.info("상세페이지 조회 - 로그인 되어 있음, BuyerLogin 정보: {}", buyerLogin);
		} else {
			// 세션이 존재하지 않으면 비로그인 상태임을 안내
			logger.info("상세페이지 조회 - 비로그인 상태입니다.");
		}

		Prd prd = recyclingService.view(prdCode);

		if (prd == null) {
			return "buyer/recycling/noneprd";
		}

		Seller seller = recyclingService.selectSeller(prd.getsCode());
		Buyer buyer = recyclingService.selectBuyerByBCode(seller.getbCode());
		int shipCnt = recyclingService.selectShipCnt(prd.getsCode());
		
		//상품 썸네일 파일명 로드
	    

	    List<String> prdImageThumNames = recyclingService.selectPrdImageThum(prdCode);
	    if (!prdImageThumNames.isEmpty()) {
	    	prdImageThumNames.add(prdImageThumNames.get(0));
	    } else {
	    	prdImageThumNames.add("error_400px.png"); // 기본 에러 이미지
	    }
	    
	    List<String> prdImageDetailNames = recyclingService.selectPrdImageDetail(prdCode);
	    if (!prdImageDetailNames.isEmpty()) {
	    	prdImageDetailNames.add(prdImageDetailNames.get(0));
	    } else {
	    	prdImageDetailNames.add("error_400px.png"); // 기본 에러 이미지
	    }
	    

		model.addAttribute("prd", prd);
		model.addAttribute("prdImageThumNames", prdImageThumNames);
		model.addAttribute("prdImageDetailNames", prdImageDetailNames);
		model.addAttribute("seller", seller);

		List<Map<String, Object>> qna = recyclingService.selectQnaList(prdCode);

		if (qna == null || qna.isEmpty()) {
			model.addAttribute("qnaMessage", "QnA가 존재하지 않습니다.");
		} else {
			model.addAttribute("qna", qna);
			model.addAttribute("qnaSize", qna.size());
		}

		model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);
		model.addAttribute("buyer", buyer);
		model.addAttribute("shipCnt", shipCnt);
		

		return "buyer/recycling/rcydetail";
	}

	@GetMapping("/rcycmt")
	public String sellerQST(@RequestParam("qstCode") String qstCode, Model model) {
		logger.info("/buyer/recycling/rcycmt [GET]");

		// 판매자 문의 조회 등의 기능 수행
		return "buyer/recycling/rcycmt";
	}
	
	
	
	@PostMapping("/writeProc")
	public String writeReview(
	        Authentication authentication,
	        Model model,
	        Rcy rcy,
	        @RequestParam("prdcode") String prdCode // 상품 코드를 직접 전달받음
	        ) {
	    logger.info("/buyer/recycling/writeReviewProc [POST]");

	    // 세션에서 로그인 정보 가져오기
	    BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

	    // 로그인 확인
	    if(buyerLogin == null) {
	                
	        model.addAttribute("error", "로그인 해주세요.");
	        return "redirect:/buyer/login";
	    }
	    
	    Buyer buyer = recyclingService.selectBuyerDetail(buyerLogin.getbId());
	    

	    rcy.setbCode(buyer.getbCode());
	    
	    // PRD_CODE 설정
	    rcy.setPrdCode(prdCode);
	    //날짜 초기화 및 설정
	    
	    int res = recyclingService.insertRcy(rcy);

	    // 상품 상세 페이지로 리다이렉트
	    return "redirect:/buyer/recycling/rcydetail?prdcode=" + prdCode;
	}


	
	@GetMapping("/pay")
	public String pay(Authentication authentication, Model model, String prdCode) {
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
	    logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
		//아이디 상세 가져오기
		Buyer buyer = buyerService.getBuyerDetail(buyerLogin.getbId());
		
		//상품 정보 가져오기
		CartOrder prd = upcyclingService.selectCartOrder(prdCode);
		
		//상품 수량 확인 후 알림 메시지
		logger.info("{}",prd);
		if(prd.getcCnt() == 0) {
			model.addAttribute("msg", "해당 상품이 품절되었습니다.");
			model.addAttribute("url", "/buyer/recycling/main");
			return "/layout/alert";
		}
		
		model.addAttribute("buyer", buyer);
		model.addAttribute("prd", prd);
		
		return "/buyer/recycling/pay";
	}
	
	@PostMapping("/pay")
	public String payProc( 
	 			 Authentication authentication
	 			 ,OrderDetail orderDetail
				 ,Orders order
				 , Model model
	 		 ) {
		logger.info("order: {}", order);
		logger.info("orderDetail: {}", orderDetail);
		
	 	BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
        logger.info("buyerLogin : {}", buyerLogin);
		
		String bCode = buyerLogin.getbCode();
		
		order.setbCode(bCode);
		
		logger.info("order: {}", order);
		
		//주문 INSERT
		int res = buyerService.insertOrder(order);
		 
		//cartOrder 객체로 prd 수량 차감
		CartOrder cart = new CartOrder();
		 
		cart.setcCnt(orderDetail.getOrdCnt());
		cart.setPrdCode(orderDetail.getPrdCode());
		 
		//수량 차감
		int updateRes = buyerService.updatePrdCnt(cart);
		
		//prdCode
		String prdCode = orderDetail.getPrdCode();
		 
		//상품 정보 가져오기
		Prd prd = upcyclingService.selectPrd(prdCode);
		
		//상품 상세 데이터 삽입
		orderDetail.setOrdCode(order.getOrdCode());
		orderDetail.setPrdCode(prd.getPrdCode());
		orderDetail.setOrdName(prd.getPrdName());
		orderDetail.setOrdPrice(prd.getPrice());
		orderDetail.setOrdSum(orderDetail.getOrdCnt() * prd.getPrice());
		orderDetail.setSttNo(900);
		 
		//상품 상세 INSERT
		int ordRes = buyerService.insertOrderDetail(orderDetail);
        
		model.addAttribute("order", order);
		
		return "jsonView";
	}
	
	@GetMapping("/payinfo")
	public void payInfo(String ordCode, Model model) {
		logger.info("{}",ordCode);
		
		Orders order = buyerService.selectByordCode(ordCode);
		
		model.addAttribute("order", order);
	}
	
}

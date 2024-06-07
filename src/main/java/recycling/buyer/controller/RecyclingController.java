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
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import recycling.buyer.service.face.BuyerService;
import recycling.buyer.service.face.RecyclingService;

import recycling.buyer.service.face.UpcyclingService;

import recycling.dto.buyer.Buyer;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.CartOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.buyer.Orders;
import recycling.dto.buyer.Oto;
import recycling.dto.buyer.OtoFile;

import recycling.dto.seller.Prd;
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
		
		List<Prd> list = recyclingService.getPrdList();
		
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
//		SellerProf sellerProf = recyclingService.getSellerProf(prd.getsCode());

		model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);
//		model.addAttribute("sellerProf", sellerProf);

		List<Map<String, Object>> qna = recyclingService.selectQnaList(prdCode);

		if (qna == null || qna.isEmpty()) {
			model.addAttribute("qnaMessage", "QnA가 존재하지 않습니다.");
		} else {
			model.addAttribute("qna", qna);
			model.addAttribute("qnaSize", qna.size());
		}

		model.addAttribute("prd", prd);
		model.addAttribute("seller", seller);

		return "buyer/recycling/rcydetail";
	}

	@GetMapping("/rcycmt")
	public String sellerQST(@RequestParam("qstCode") String qstCode, Model model) {
		logger.info("/buyer/recycling/rcycmt [GET]");

		// 판매자 문의 조회 등의 기능 수행
		return "buyer/recycling/rcycmt";
	}

	@GetMapping("/write")
	public String writeReviewForm(@RequestParam("prdCode") String prdCode, Authentication authentication, Model model) {
		logger.info("/buyer/recycling/write [GET]");

		// 로그인 확인
		if (authentication == null || !authentication.isAuthenticated()) {
			// 비로그인 상태인 경우 로그인 페이지로 리다이렉트
			return "redirect:/buyer/login";
		}

		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		Buyer buyer = recyclingService.selectBuyerDetail(buyerLogin.getbId());
		model.addAttribute("buyer", buyer);

		// 후기 작성 폼으로 이동
		return "buyer/recycling/writeReview";
	}

	@PostMapping("/writeProc")
	public String writeReview(Authentication authentication, Model model, Oto oto,
			@RequestParam("prdcode") String prdCode) {
		logger.info("/buyer/recycling/writeReviewProc [POST]");

		// 세션에서 로그인 정보 가져오기
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();

		// 로그인 확인
		if (buyerLogin == null) {

			model.addAttribute("error", "로그인 해주세요.");
			return "redirect:/buyer/login";
		}

		Buyer buyer = recyclingService.selectBuyerDetail(buyerLogin.getbId());

		oto.setCtOtoNo(200);
		oto.setbCode(buyer.getbCode());
		oto.setOtoName(buyer.getbName());
		oto.setOtoEmail(buyer.getbEmail());

		int res = recyclingService.insertOto(oto);

		// 상품 상세 페이지로 리다이렉트
		return "redirect:/buyer/recycling/rcydetail?prdcode=" + prdCode;
	}

//	@PostMapping("/delete")
//	public String deleteSellerQST(@RequestParam("qstCode") String qstCode, RedirectAttributes redirectAttributes) {
//		logger.info("/buyer/recycling/delete [POST] - qstCode: {}", qstCode);
//		
//		int result = recyclingService.deleteSellerQST(qstCode);
//		redirectAttributes.addAttribute("qstCode", qstCode);
//		
//		return "redirect:/buyer/recycling/rcycmt";
//	}

	@PostMapping("/rcycmt/writeAnswer")
	public String writeSellerAnswer(RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/rcycmt/writeAnswer [POST]");

//        int result = recyclingService.insertSellerAnswer(sellerAns);
//        redirectAttributes.addAttribute("qstCode", sellerAns.getQstCode());
//        
		return "redirect:/buyer/recycling/rcycmt";
	}

	@PostMapping("/rcycmt/editAnswer")
	public String editSellerAnswer(RedirectAttributes redirectAttributes) {
		logger.info("/buyer/recycling/rcycmt/editAnswer [POST]");

//        int result = recyclingService.updateSellerAnswer(sellerAns);
//        redirectAttributes.addAttribute("qstCode", sellerAns.getQstCode());

		return "redirect:/buyer/recycling/rcycmt";
	}

//	@PostMapping("/rcycmt/deleteAnswer")
//    public String deleteSellerAnswer(@RequestParam("qnaCode") String qnaCode, @RequestParam("qstCode") String qstCode, RedirectAttributes redirectAttributes) {
//        logger.info("/buyer/recycling/rcycmt/deleteAnswer [POST] - qnaCode: {}", qnaCode);
//        
//        int result = recyclingService.deleteSellerAnswer(qnaCode);
//        redirectAttributes.addAttribute("qstCode", qstCode);
//        
//        return "redirect:/buyer/recycling/rcycmt";
//    }
	
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

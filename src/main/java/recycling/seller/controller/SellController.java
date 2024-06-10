package recycling.seller.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import recycling.dto.buyer.BuyerAdr;
import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Seller;
import recycling.page.face.PageService;
import recycling.seller.service.face.SellService;
import recycling.util.PagingAndCtg;

// 판매자 메인 페이지 + 판매자 전환

@Controller
@RequestMapping("/seller")
public class SellController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellService sellService;
	@Autowired private PageService pageService;
	
	@GetMapping("/seller")
	public String seller(
			Authentication authentication,
			Model model
			) {
		logger.info("/seller/seller [GET]");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("{}", auth.getAuthorities());
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("seller : {}", buyerLogin);
		
		if(auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_BUYER"))) {
			if(buyerLogin.getsCode() == null) {
				logger.info("신청 필요");
				return "redirect:/seller/sellerinfo";
			} else {
				if(buyerLogin.getsChk() == null) {
					logger.info("이미 신청");
					model.addAttribute("msg", "담당자가 검토 중입니다. 추가 서류 요청이 있을 수 있으니, 문자/메일 확인을 수시로 부탁드립니다.");
					model.addAttribute("url", "/buyer/main");
					return "/layout/alert";
				} else {
					if(buyerLogin.getsChk().equals("Y")) {
						if(buyerLogin.getsOut().equals("Y")) {
							logger.info("판매자 탈퇴");
							model.addAttribute("msg", "탈퇴한 판매자 입니다. 재가입은 고객센터에 문의 부탁드립니다.");
							model.addAttribute("url", "/buyer/main");
							return "/layout/alert";
						} else {
							return "redirect:/seller/main";
						}
					} else {
						logger.info("판매자 거절");
						model.addAttribute("msg", "판매자 신청이 거절되었습니다. \n 정보 보충 후 재신청 바랍니다. \n 자세한 사유는 판매관리팀 번호로 문의 바랍니다. \n 000-0000-0000 으로 연락바랍니다. \n 해당 메시지는 1번만 노출되고 노출되지 않습니다.");
						model.addAttribute("url", "/buyer/main");
						int res = sellService.deleteSeller(buyerLogin);
						return "/layout/alert";
					}
				}
				
			}
		}	
//		model.addAttribute("msg", "잘못된 접근입니다. 판매자 승인된 구매자 로그인 정보가 필요합니다.");
//		model.addAttribute("url", "/buyer/main");
//		
//		return "/layout/alert";
		
		return "redirect:/seller/main";
		
	}
	
	@GetMapping("/main")
	public String main(
			   Authentication authentication,
			   @RequestParam(defaultValue = "0") int curPage,
			   @RequestParam(defaultValue = "") String search,
			   @RequestParam(defaultValue = "") String sCtg,
			   Model model
			) {
		logger.info("/seller/main [GET]");
		
		logger.info("search : {}", search);
  
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("seller : {}", buyerLogin);
		
		int prdCnt = sellService.selectPrdCnt(buyerLogin);
		int payCnt = sellService.selectPayCnt(buyerLogin);
		int shipCnt = sellService.selectShipCnt(buyerLogin);
		  
		model.addAttribute("prdCnt", prdCnt);
		model.addAttribute("payCnt", payCnt);
		model.addAttribute("shipCnt", shipCnt);
  
		// 문의글 페이지 수 계산
		PagingAndCtg upPaging = new PagingAndCtg();
		PagingAndCtg unPaging = new PagingAndCtg();
			
		upPaging = pageService.upPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
		unPaging = pageService.unPageSeller(curPage, sCtg, search, buyerLogin.getsCode());
		
		logger.info("up : {}", upPaging);
		logger.info("un : {}", unPaging);
		
		int upPage = sellService.selectCntAllOrd(upPaging);
        int unPage = sellService.selectCntAllQna(unPaging);
        
        upPaging = new PagingAndCtg(upPage, upPaging.getCurPage(), upPaging.getSearch());
        upPaging.setUser(buyerLogin.getsCode());
        
        unPaging = new PagingAndCtg(unPage, unPaging.getCurPage(), unPaging.getSearch());
        unPaging.setUser(buyerLogin.getsCode());
        
        List<Map<String, Object>> ordList = sellService.selectAllOrd(upPaging);
        List<Map<String, Object>> qnaList = sellService.selectAllQna(unPaging);
        
        logger.info("up : {}", upPaging);
        logger.info("ord : {}", ordList);
        logger.info("un : {}", unPaging);
        logger.info("qna : {}", qnaList);
        
        model.addAttribute("upUrl", "/seller/main");
        model.addAttribute("unUrl", "/seller/main");
        
        model.addAttribute("ordList", ordList);
        model.addAttribute("ordSize", ordList.size());
        model.addAttribute("upPaging", upPaging);
                
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("qnaSize", qnaList.size());
        model.addAttribute("unPaging", unPaging);
		
        logger.info("그 외");
        
		return "/seller/main";
	}
	
	@GetMapping("/sellerinfo")
	public String sellerinfo(
				Authentication authentication,
				Model model
				) {
		logger.info("/seller/sellerinfo [GET]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("{}", buyerLogin);
		
		Seller seller = new Seller();
		seller.setbCode(buyerLogin.getbCode());
		
		// 구매자 정보에서 주소 정보 가져오기
		BuyerAdr buyeradr = sellService.selectBuyerAdr(seller);
		logger.info("adr : {}", buyeradr);
		
		if(buyeradr == null) {
			model.addAttribute("msg", "기본 배송지 정보가 없는 경우 판매자 전환 신청이 불가능 합니다.");
			model.addAttribute("url", "/buyer/mypage/myaddr");
			return "/layout/alert";
		} else {
			return "/seller/sellerinfo";
		}
		
	}
	
	@PostMapping("/sellerinfo")
	public void sellerinfoProc(
				Authentication authentication, 
				Seller seller, 
				Model model
				) {
		logger.info("/seller/sellerinfo [POST]");
		
		BuyerLogin buyerLogin = (BuyerLogin) authentication.getPrincipal();
		logger.info("{}", buyerLogin);
		
		seller.setbCode(buyerLogin.getbCode());
		
		// 구매자 정보에서 주소 정보 가져오기
		BuyerAdr buyeradr = sellService.selectBuyerAdr(seller);
		seller.setsPostcode(buyeradr.getAdrPostcode());
		seller.setsAddr(buyeradr.getAdrAddr());
		seller.setsDetail(buyeradr.getAdrDetail());
		seller.setAccNo(seller.getAccNo().replaceAll("-", ""));
		
		int res = sellService.insertSeller(seller);
		
		model.addAttribute("res", res);
	}
	
}

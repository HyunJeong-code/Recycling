package recycling.seller.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;
import recycling.seller.service.face.ProductService;

// 상품 등록

@Controller
@RequestMapping("/seller/prd")
public class ProductController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ProductService productService;
	
	@GetMapping("/main")
	public void main() {
		logger.info("/seller/prd/main [GET]");
	}
	
	@GetMapping("/rcyform")
	public void rcyForm() {
		logger.info("/seller/prd/rcyform [GET]");
	}
	
	@PostMapping("/rcyform")
	public void rcyFormProc(HttpSession session, Prd prd, MultipartFile main, List<MultipartFile> detail) {
		logger.info("/seller/prd/rcyform [POST]");
		
		BuyerLogin seller = (BuyerLogin) session.getAttribute("buyers"); 
		prd.setsCode(seller.getsCode());
		logger.info("rcy : {}", prd);
		
		int res = productService.insertRcy(prd);
		
		logger.info("main : {}", main);
		for(MultipartFile mult : detail) {
			logger.info("detail : {}", mult);			
		}
		
		if(res > 0) {
			PrdFile prdMain = productService.saveFile(main, prd);
			if(prdMain != null) {
				int resMain = productService.insertFileMain(prdMain);
				
				int resDetail = 0;
				for(MultipartFile mult : detail) {
					
					PrdFile prdDetail = productService.saveFile(mult, prd);
					if(prdDetail != null) {
						resDetail += productService.insertFileDetail(prdDetail);						
					}
				}
				
				if(resMain > 0 && resDetail == detail.size()) {
					// 상품 상세페이지로 이동
				} else {
					// 상품 등록 전체 삭제
				}
			}
		} else {
			
		}
	}
	
	@GetMapping("/upcyform")
	public void upcyForm() {
		logger.info("/seller/prd/upyform [GET]");
	}
	
	@PostMapping("/upcyform")
	public void upcyFormProc() {
		logger.info("/seller/prd/upyform [POST]");
	}
}

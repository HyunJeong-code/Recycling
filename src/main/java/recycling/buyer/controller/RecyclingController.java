package recycling.buyer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

import recycling.buyer.service.face.RecyclingService;
import recycling.dto.buyer.Buyer;
import recycling.dto.seller.Seller;
import recycling.util.Paging;

// 메뉴 - 재활용품
@Controller
@RequestMapping("/buyer/recycling")
public class RecyclingController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private RecyclingService recyclingService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/findseller", method = RequestMethod.GET)
	public String findSeller(String sCode, String sAddr, Model model, HttpSession session) {
        
        ObjectMapper objectMapper = new ObjectMapper();
        
        // 판매자 찾기
        List<Seller> location = this.recyclingService.findSeller();
        
        List<Map<String, Object>> gpsList = new ArrayList<>();
        
        try {
            location.forEach(seller -> {
                gpsList.add((Map<String, Object>) objectMapper.convertValue(seller, JSONObject.class));
            }); 
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        model.addAttribute("gpsList", gpsList);
        model.addAttribute("location", location);

        logger.info("11111111111111{}", gpsList);
        logger.info("11111111111111{}", location);
        
        return "buyer/recycling/findseller";
//        return "buyer/recycling/findseller_origin";
    }
	
}

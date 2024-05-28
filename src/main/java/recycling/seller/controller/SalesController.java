package recycling.seller.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import recycling.dto.seller.GoogleInfResponse;
import recycling.dto.seller.GoogleRequest;
import recycling.dto.seller.GoogleResponse;

// 매출 관리

@Controller
@RequestMapping("/seller/sales")
public class SalesController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	

	
}

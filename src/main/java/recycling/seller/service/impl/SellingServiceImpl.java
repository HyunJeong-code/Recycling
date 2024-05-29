package recycling.seller.service.impl;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.seller.Exp;
import recycling.dto.seller.Prd;
import recycling.seller.dao.face.SellerDao;
import recycling.dto.seller.AllPrd;
import recycling.dto.seller.Exp;
import recycling.seller.dao.face.SellingDao;
import recycling.seller.service.face.SellingService;
import recycling.util.Paging;

@Service
@Transactional
public class SellingServiceImpl implements SellingService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingDao sellingDao;
	
//	@Override
//	public List<AllPrd> selectAllPrd(BuyerLogin seller) {
//		List<AllPrd> allPrd = sellingDao.selectAllPrd(seller);
//		
//		for(AllPrd prd : allPrd) {
//			
//		}
//		
//		return allPrd;
//	}
	
	@Override
	public List<Prd> selectAllrcyPrd(String sCode) {
		return sellingDao.selectAllrcyPrd(sCode);
	}
	
	@Override
	public List<MyOrder> selectAllMyOrder(String prdCode) {
		return sellingDao.selectAllMyOrder(prdCode);
	}
	
	@Override
	public List<Prd> selectAllupcyPrd(String sCode) {
		return sellingDao.selectAllupcyPrd(sCode);
	}
	
	@Override
	public int deletePrd(String prdCode) {
		return sellingDao.deletePrd(prdCode);
	}
	
	@Override
	public Prd selectByprdCode(String prdCode) {
		return sellingDao.selectByprdCode(prdCode);
	}
	
	@Override
	public int updatePrd(Prd prd) {
		return sellingDao.updatePrd(prd);
	}
	
	@Override
	public OrderDetail selectByorddtCode(String orddtCode) {
		return sellingDao.selectByorddtCode(orddtCode);
	}
	
	
	//포트원 토큰 생성
	@Override
	public String getToken() {
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
	
	@Override
	public int cencelpay(OrderDetail order, String token) {
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
            
            String jsonString = response.body();
            
            JsonObject jsonObject = JsonParser.parseString(jsonString).getAsJsonObject();
            int code = jsonObject.get("code").getAsInt();
            logger.info("code : {}", code);
            // 응답 코드에 따라 처리
            if (response.statusCode() == 200 && code == 1) {
                // 처리 성공
            	return 1;
            } else {
                // 처리 실패
                logger.error("Failed to cancel payment: {}", response.body());
                return 0;
            }
        } catch (IOException | InterruptedException e) {
            logger.error("Exception occurred while cancelling payment: {}", e.getMessage());
            return 0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
	}
	
	@Override
	public int updateOrderDetail(OrderDetail ordd) {
		return sellingDao.updateOrderDetail(ordd);
	}
	
	@Override
	public int insertShip(MyOrder myOrder) {
		return sellingDao.insertShip(myOrder);
	}
	
	@Override
	public int deleteShip(String orddtCode) {
		return sellingDao.deleteShip(orddtCode);
	}
	
	@Override
	public MyOrder selectMyOrderByOrddtCode(String orddtCode) {
		return sellingDao.selectMyOrderByOrddtCode(orddtCode);
	}
	
	@Override
	public List<Exp> selectMyExpList(Paging paging) {
		
		
		return sellingDao.selectMyExpList(paging);
	}

	@Override
	public Paging getSearchPaging(int curPage, String search) {
		
		Paging paging = null;
		
		int totalCount = sellingDao.selectCntAll(search);
		
		if("".equals(search)) {
			paging = new Paging(totalCount, curPage, search);
		} else {
			paging = new Paging(totalCount, curPage, search);
		}
		return paging;
	}

	@Override
	public Exp selectByExp(String expCode) {
		
		return sellingDao.selectByExp(expCode);
	}

	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = sellingDao.selectPageAll();
		
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<ExpRes> selectResList(String expCode) {
		return sellingDao.selectResList(expCode);
	}

//	@Override
//	public List<ExpRes> selectResList(String expCode, Paging paging) {
//		
//		return sellingDao.selectResList(expCode, paging);
//	}

}

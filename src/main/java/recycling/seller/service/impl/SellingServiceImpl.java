package recycling.seller.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import recycling.dto.buyer.BuyerLogin;
import recycling.dto.buyer.ExpRes;
import recycling.dto.buyer.MyOrder;
import recycling.dto.buyer.OrderDetail;
import recycling.dto.manager.MgrFile;
import recycling.dto.manager.ResSchCnt;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;
import recycling.seller.dao.face.SellerDao;
import recycling.dto.seller.AllPrd;
import recycling.dto.seller.Exp;
import recycling.seller.dao.face.SellingDao;
import recycling.seller.service.face.SellingService;
import recycling.util.PagingAndCtg;

@Service
@Transactional
public class SellingServiceImpl implements SellingService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private SellingDao sellingDao;
	@Autowired private ServletContext servletContext;
	
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
	public List<PrdFile> selectPrdFile(String prdCode) {
		return sellingDao.selectPrdFile(prdCode);
	}
	
	@Override
	public int updatePrd(Prd prd) {
		return sellingDao.updatePrd(prd);
	}
	
	@Override
	public int updatePrdFile(String prdCode, MultipartFile profile, MultipartFile file) {
		//파일이 저장될 경로 - RealPath
		String storedPath = servletContext.getRealPath("upload");
				
		//upload폴더가 존재하지 않으면 생성하기
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		int mainRes = 0;
		int detailRes = 0;
		
		if(profile != null) {
			//프로필 저장이름
			String profileStoredName = null;
			File destProfile = null;
			
			//저장될 파일명이 중복되지 않도록 반복
			do {
				profileStoredName = profile.getOriginalFilename(); //원본 파일명
				profileStoredName += UUID.randomUUID().toString().split("-")[4]; //UUID추가
				
				destProfile = new File( storedFolder, profileStoredName );
			} while( destProfile.exists() );
			try {
				//업로드된 임시 파일을 upload 폴더로 옮기기
				profile.transferTo(destProfile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		    //프로필 DB에 저장
	        PrdFile prdMainFile = new PrdFile();
	        prdMainFile.setOriginName(profile.getOriginalFilename());
	        prdMainFile.setStoredName(profileStoredName);
	        prdMainFile.setPrdCode(prdCode);
	        prdMainFile.setCtPflNo(600); // document 데이터 1000
	       
	        //프로필 삭제
	        sellingDao.deletePrdFile(prdMainFile);
	        
	        //프로필 업로드
	        mainRes = sellingDao.insertPrdFile(prdMainFile);
		}
        //-------------------------------------------------------------
		if(file != null) {
			//업로드된 파일이 저장될 이름
			String storedName = null;
			
			//저장될 파일 객체
			File dest1 = null;
			
			//저장될 파일명이 중복되지 않도록 반복
			do {
				storedName = file.getOriginalFilename(); //원본 파일명
				storedName += UUID.randomUUID().toString().split("-")[4]; //UUID추가
				
				dest1 = new File( storedFolder, storedName );
			} while( dest1.exists() );
			try {
				//업로드된 임시 파일을 upload 폴더로 옮기기
				file.transferTo(dest1);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//일반파일DB에 기록하기
			PrdFile prdFile = new PrdFile();
			prdFile.setOriginName(file.getOriginalFilename() );
			prdFile.setStoredName(storedName );
			prdFile.setPrdCode(prdCode);
			prdFile.setCtPflNo(610);
			
	        //프로필 삭제
	        sellingDao.deletePrdFile(prdFile);
			
			//파일 업로드
			detailRes = sellingDao.insertPrdFile(prdFile);
		}
		
		return mainRes + detailRes;
	}
	
	@Override
	public int updateMainFile(String prdCode, MultipartFile profile) {
		//파일이 저장될 경로 - RealPath
		String storedPath = servletContext.getRealPath("upload");
				
		//upload폴더가 존재하지 않으면 생성하기
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		
		//프로필 저장이름
		String profileStoredName = null;
		File destProfile = null;
		
		//저장될 파일명이 중복되지 않도록 반복
		do {
			profileStoredName = profile.getOriginalFilename(); //원본 파일명
			profileStoredName += UUID.randomUUID().toString().split("-")[4]; //UUID추가
			
			destProfile = new File( storedFolder, profileStoredName );
		} while( destProfile.exists() );
		try {
			//업로드된 임시 파일을 upload 폴더로 옮기기
			profile.transferTo(destProfile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	    //프로필 DB에 저장
        PrdFile prdMainFile = new PrdFile();
        prdMainFile.setOriginName(profile.getOriginalFilename());
        prdMainFile.setStoredName(profileStoredName);
        prdMainFile.setPrdCode(prdCode);
        prdMainFile.setCtPflNo(600); // document 데이터 1000
       
        //프로필 삭제
        sellingDao.deletePrdFile(prdMainFile);
        
        //프로필 업로드
        int mainRes = sellingDao.insertPrdFile(prdMainFile);
		
		return mainRes;
	}
	
	@Override
	public int updateDetailFile(String prdCode, MultipartFile detailFile) {
		//파일이 저장될 경로 - RealPath
		String storedPath = servletContext.getRealPath("upload");
				
		//upload폴더가 존재하지 않으면 생성하기
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();

		//업로드된 파일이 저장될 이름
		String storedName = null;
		
		//저장될 파일 객체
		File dest1 = null;
		
		//저장될 파일명이 중복되지 않도록 반복
		do {
			storedName = detailFile.getOriginalFilename(); //원본 파일명
			storedName += UUID.randomUUID().toString().split("-")[4]; //UUID추가
			
			dest1 = new File( storedFolder, storedName );
		} while( dest1.exists() );
		try {
			//업로드된 임시 파일을 upload 폴더로 옮기기
			detailFile.transferTo(dest1);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//일반파일DB에 기록하기
		PrdFile prdFile = new PrdFile();
		prdFile.setOriginName(detailFile.getOriginalFilename() );
		prdFile.setStoredName(storedName);
		prdFile.setPrdCode(prdCode);
		prdFile.setCtPflNo(610);
		
		logger.info("prdFile: {}",prdFile);
		
		//파일 업로드
		int detailRes = sellingDao.insertPrdFile(prdFile);
		
		return detailRes;
	}
	
	@Override
	public void deleteDetailFile(HashMap<String, String> map) {
		sellingDao.deleteDetailFile(map);
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
	public int updateMyOrder(MyOrder myOrder) {
		int res = sellingDao.updateMyOrder(myOrder);
		if(myOrder.getShipNo() != null && myOrder.getShipName() != null) {
			res *= sellingDao.insertShip(myOrder);
		}
		return res;
	}
	
	//paging Cnt
	
	@Override
	public int selectCntAllrcyPrd(PagingAndCtg upPaging) {
		return sellingDao.selectCntAllrcyPrd(upPaging);
	}
	
	@Override
	public int selectCntAllrcyMyOrder(PagingAndCtg unPaging) {
		return sellingDao.selectCntAllrcyMyOrder(unPaging);
	}
	
	@Override
	public int selectCntAllupcyPrd(PagingAndCtg upPaging) {
		return sellingDao.selectCntAllupcyPrd(upPaging);
	}
	
	@Override
	public int selectCntAllMyOrder(PagingAndCtg unPaging) {
		return sellingDao.selectCntAllMyOrder(unPaging);
	}

	//paging Cnt end
	
	//exp start
	@Override
	public List<Exp> selectMyExpList(PagingAndCtg upPaging) {
		return sellingDao.selectMyExpList(upPaging);
	}
	
	@Override
	public int selectCntAllexpList(PagingAndCtg upPaging) {
		
		return sellingDao.selectCntAllexpList(upPaging);
	}
	
//	@Override
//	public int selectCntAllExpSch(PagingAndCtg upPaging) {
//		
//		return sellingDao.selectCntAllExpSch(upPaging);
//	public List<Exp> selectMyExpList(Paging paging) {
//		
//		
//		return sellingDao.selectMyExpList(paging);
//	}

//	@Override
//	public Paging getSearchPaging(int curPage, String search) {
//		
//		Paging paging = null;
//		
//		int totalCount = sellingDao.selectCntAll(search);
//		
//		if("".equals(search)) {
//			paging = new Paging(totalCount, curPage, search);
//		} else {
//			paging = new Paging(totalCount, curPage, search);
//		}
//		return paging;
//	}

	@Override
	public Exp selectByExp(String expCode) {
		
		return sellingDao.selectByExp(expCode);
	}

	@Override
	public List<ExpSch> selectAllSch(String expCode) {
		return sellingDao.selectAllSch(expCode);
	}

	@Override
	public List<ResSchCnt> selectByResCnt(String expCode) {
		return sellingDao.selectByResCnt(expCode);
	}

	@Override
	public List<ExpFile> selectByExpFile(String expCode) {
		return sellingDao.selectByExpFile(expCode);
	}
	
	@Override
	public int selectCntAllPrd(PagingAndCtg upPaging) {
		return sellingDao.selectCntAllPrd(upPaging);
	}
	
	@Override
	public int selectCntAllOrd(PagingAndCtg unPaging) {
		return sellingDao.selectCntAllOrd(unPaging);
	}
	
	@Override
	public List<Map<String, Object>> selectAllPrd(PagingAndCtg upPaging) {
		return sellingDao.selectAllPrd(upPaging);
	}
	
	@Override
	public List<Map<String, Object>> selectAllOrd(PagingAndCtg unPaging) {
		return sellingDao.selectAllOrd(unPaging);
	}
		
	@Override
	public Exp expResDetail(String expCode) {
		return sellingDao.expResDetail(expCode);
	}

	@Override
	public ExpSch selectExpSchbySchNo(int schNo) {
		return sellingDao.selectExpSchbySchNo(schNo);
	}

	@Override
	public List<ExpRes> expResDetailRes(int schNo) {
		return sellingDao.expResDetailRes(schNo);
	}

	@Override
	public int expResUpdate(List<String> chBox, String actionType) {
int result = 0;
		
		for(int i = 0; i < chBox.size(); i++) {
			String resCode = chBox.get(i);
			
	        if ("complete".equals(actionType)) {
	        	 // 예약완료 메서드 호출
	            result += sellingDao.expResCnf(resCode);
	   
	        } else if ("cancel".equals(actionType)) {
	        
	        	// 예약취소 메서드 호출
	            result += sellingDao.expResCnl(resCode); 
	        }
		}
		
		return result;
	}

	@Override
	public int selectCntAllExpSch(PagingAndCtg upPaging) {
		// TODO Auto-generated method stub
		return 0;
	}
}

package recycling.seller.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.Cmp;
import recycling.dto.seller.Seller;
import recycling.seller.dao.face.SellerDao;
import recycling.seller.service.face.SellerService;

@Service
public class SellerServiceImpl implements SellerService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
    private SellerDao sellerDao;

	@Override
	public String selectSeller(String sCode) {
		// 판매자의 sCode로 구매자의 bCode를 조회하여 해당 구매자의 비밀번호를 가져옴
        String bCode = sellerDao.getbCodeBysCode(sCode);
        return sellerDao.selectSeller(bCode);
	}

	//----------------------------------------------------------------------------------------
	
	@Override
	public Seller getSellerInfo(String pw) {
        // 구매자의 비밀번호를 사용하여 판매자 정보 조회
        return sellerDao.getSellerInfoByPw(pw);
	}

	//----------------------------------------------------------------------------------------


	@Override
	public boolean updatePw(String bPw, String newPw) {
		return sellerDao.updatePw(bPw, newPw);
	}




	
	//----------------------------------------------------------------------------------------

	@Override
	public String updateBank(Seller seller) {
		
        return sellerDao.updateBank(seller);
	}

	//----------------------------------------------------------------------------------------

	@Override
	public String uploadImage(MultipartFile file) {
		
		String fileName = null;
		if(!file.isEmpty()) {
					
			
			try {
				fileName = UUID.randomUUID().toString() +  "_" + file.getOriginalFilename();
				File dest = new File("" + fileName);// ""안에 실제 업로드할 파일 위치 적어야함
				file.transferTo(dest);
			} 
			catch (IOException e) {
				e.printStackTrace();
			}			
		}
		
		
		return fileName;
	}

	
	
	
	@Override
	@Transactional
	public void updateSellerProf(Seller seller) {
//		// 이미지 파일 업로드 처리
//        String storedFilename = fileStorageService.storeFile(cmpFile);
//
//        // 업데이트할 Seller 객체 생성
//        Seller seller = new Seller();
//        seller.setSCode(sCode);
//        seller.setFilename(filename);
//
//        // Cmp 객체 업데이트
//        seller.setCmp(cmp);
//
//        // 업데이트 수행
//        sellerDao.updateSellerProf(seller);
		
	}



	//----------------------------------------------------------------------------------------

	
	

	
	
}































package recycling.seller.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import recycling.dto.seller.Seller;
import recycling.seller.dao.face.SellerDao;
import recycling.seller.service.face.SellerService;

@Service
public class SellerServiceImpl implements SellerService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
    private SellerDao sellerDao;

	@Override
	public String getBuyerPwBySellerCode(String sCode) {
		// 판매자의 sCode로 구매자의 bCode를 조회하여 해당 구매자의 비밀번호를 가져옴
        String bCode = sellerDao.getBuyerCodeBySellerCode(sCode);
        return sellerDao.getBuyerPasswordByBuyerCode(bCode);
	}

	@Override
	public Seller getSellerInfo(String pw) {
		// 판매자 정보 조회
        return sellerDao.getSellerInfoByPassword(pw);
	}

	
	

}

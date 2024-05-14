package recycling.seller.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.seller.Prd;
import recycling.dto.seller.PrdFile;
import recycling.seller.dao.face.ProductDao;
import recycling.seller.service.face.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired private ProductDao productDao;
	@Autowired private ServletContext servletContext;
	
	@Override
	public int insertRcy(Prd prd) {
		return productDao.insertRcy(prd);
	}
	
	@Override
	public PrdFile saveFile(MultipartFile file, Prd prd) {
		
		if(file.getSize() <= 0) {
			logger.info("파일 없음");
			
			return null;
		}
		
		String storedPath = servletContext.getRealPath("upload");
		
		File storedFolder = new File(storedPath);
		storedFolder.mkdir();
		
		String storedName = null;
		
		File dest = null;
		
		do {
			storedName = file.getOriginalFilename(); // 원본 파일명
			
			storedName += UUID.randomUUID().toString().split("-")[4]; // UUID 추가
			logger.info("storedName : {}", storedName);
			
			dest = new File(storedFolder, storedName);			
		} while(dest.exists());
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		PrdFile prdFile = new PrdFile();
		prdFile.setPrdCode(prd.getPrdCode());
		prdFile.setOriginName(file.getOriginalFilename());
		prdFile.setStoredName(storedName);
		
		return prdFile;
	}
	
	@Override
	public int insertFileMain(PrdFile prdFile) {
		prdFile.setCtPflNo(600);;
		return productDao.insertPrdFile(prdFile);
	}
	
	@Override
	public int insertFileDetail(PrdFile prdDetail) {
		prdDetail.setCtPflNo(610);
		return productDao.insertPrdFile(prdDetail);
	}
}

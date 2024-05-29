package recycling.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import recycling.view.dto.FileDto;

public class FileDownloadView extends AbstractView {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ServletContext servletContext;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("renderMergedOutputModel");
		
		// HTML 응답 테스트
//		response.setContentType("text/html; charset=utf-8");
//		response.getWriter().append("<h1>하이!!</h1>");
		
		//-------------------------------------------------------------
		
		// 모델값 가져오기
		FileDto downFile = (FileDto) model.get("downFile");
		
		// 저장된 파일의 폴더(upload)
		String path = servletContext.getRealPath("upload");
		
		// 실제 업로드된 파일의 이름
		String filename = downFile.getStoredName();
		
		// 실제 파일 객체
		File src = new File(path, filename);
		
		logger.info("서버에 업로드된 파일 : {}", src);
		logger.info("존재 여부 : {}", src.exists());
		
		
		response.setContentType("application/octet-stream");
		
		response.setContentLengthLong(src.length());
		
		response.setCharacterEncoding("UTF-8");
		
		
		String outputName = URLEncoder.encode(downFile.getOriginName(), "UTF-8");
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName + "\"");
		
		// 서버의 파일 입력 스트림 객체
		FileInputStream in = new FileInputStream(src);
		
		// 클라이언트의 응답 출력 스트림 객체
		OutputStream out = response.getOutputStream();
		
		// 서버 -> 클라이언트의 파일 복사
		FileCopyUtils.copy(in, out);
	}
}

package recycling.view.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

// 요청 파라미터에 맞는 Parameter
public class FileParam {
	
	private String title;
	private List<MultipartFile> file; // 여러 파일을 한번에 받을 때
	
	public FileParam() {}

	public FileParam(String title, List<MultipartFile> file) {
		this.title = title;
		this.file = file;
	}

	@Override
	public String toString() {
		return "FileParam [title=" + title + ", file=" + file + "]";
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
}

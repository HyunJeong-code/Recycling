package recycling.manager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import recycling.dto.buyer.ExpRes;
import recycling.dto.seller.Exp;
import recycling.dto.seller.ExpFile;
import recycling.dto.seller.ExpSch;
import recycling.manager.service.face.SlsService;


@Controller
@RequestMapping("/manager/sls")
public class SlsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private SlsService slsService;
	@Autowired HttpSession session;
	
	//체험단 전체조회
	@GetMapping("/explist")
	public String expList(
			Model model
			) {
		logger.info("controller explist :[Get]");
		
		//전체 Exp 조회기능
		List<Exp> list = slsService.selectAll();
		model.addAttribute("explist", list);
		
		return "/manager/sls/explist";
	}
	
	//체험단 선택조회 + 시간포함
	@GetMapping("/expschlist")
	public void expSchList(
			String expCode
			, String expName
			, Model model
			) {
		logger.info("controller expSchList:{}", expCode);
		
		//전체 ExpSch 조회기능
		List<ExpSch> schList = slsService.selectSchAll(expCode);
		model.addAttribute("expSchList", schList);
		model.addAttribute("expName", expName);
		
		logger.info("controller explist: {}", schList);
		
		//return "jsonView";
	}
	
	//상세 조회
	@GetMapping("/expdetail")
	public void expDetail(
			Exp exp
			, ExpFile expFile
			, Model model
			) {
		logger.info("contoller: expDetail[GET]");

		//expfile번호 가져오기
		
		ExpFile fileimage = slsService.image(expFile);
		model.addAttribute("fileimage", fileimage);
		logger.info("expDetail:{}", fileimage );
		
        
		//상세조회
		Exp view = slsService.selectDetail(exp);
		model.addAttribute("view", view);
		logger.info("expDetail:{}", view );
		
	}
	
	//체험단 등록창
	@GetMapping("/expform")
	private void expform() {}
	
	//체험단 등록
	@PostMapping("/expform")
	public String expformProc(
			Exp exp
			, ExpSch expSch
			, @RequestParam("file") MultipartFile file
			) {

		//test세션
		session.setAttribute("sCode", "SEL0000002");
		String sCode = (String) session.getAttribute("sCode");
		exp.setsCode(sCode);
		
		slsService.insert(exp, expSch, file);
		
		
		
		return "redirect:./explist";
	}
	
	//체험단 수정창
	@GetMapping("/expupdate")
	public String expUpdate(
				Exp exp
				, Model model
			) {
		logger.info("controller: expupdate[Get]");

		Exp update = slsService.expUpdateView(exp);
		model.addAttribute("update", update);
		
		//exp 정보
		logger.info("controller: update{}",update );
		
		return "/manager/sls/expupdate";
	}
	
	//체험단 수정하기
	@PostMapping("/expupdate")
	public void updateProc(
			Exp exp
			){
		logger.info("controller: updateProc[Get]");
		
		slsService.expUpdateProc(exp);
	}
	
	// 체험단삭제
	@PostMapping("/explistdel")	
	public String empListDelete(@RequestParam("chBox[]") List<String> chBox) {
		logger.info("controller: empListDelete [POST]");
		
		slsService.expListDel(chBox);
		logger.info("데이터 확인 chBox : {}", chBox);
		
		return "redirect:./explist";
	}
	
	// 체험단 예약관리
	@GetMapping("/expresdetail")	
	public void expResDetail(
			Model model
			, String expCode
			, ExpRes expRes
			) {
		Exp expView = slsService.expResDetail(expCode);
		List<ExpRes> resList = slsService.expResDetailRes(expRes);
		
		model.addAttribute("exp", expView);
		model.addAttribute("resList", resList);
		
	}
	
	
	
	
	//	@GetMapping("/expresupdate")	// 체험단 예약 정보변경[예약 구매자]
//	@GetMapping("/changeexpres")	// 체험단 예약 변경
}

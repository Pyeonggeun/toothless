package com.mkfactory.toothless.e.onlinecounsel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.OnlineCounselBoardDto;
import com.mkfactory.toothless.e.onlinecounsel.service.OnlineCounselService;

@Controller
@RequestMapping("/tl_e/onlineCounsel/*")
public class OnlineCounselController {

	@Autowired
	private OnlineCounselService onlineCounselService;
	
	
	//		**** 메인페이지 ****
	
	@RequestMapping("onlineCounselMainPage")
	public String onlineCounselMainPage(HttpSession session, Model model) {
		
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = studentInfoDto.getStudent_pk();
		
		model.addAttribute("counselList", onlineCounselService.getAllCounselListByStudentPk(studentPk));
		
		// 모든 엔트리 출력
//      List<Map<String, Object>> testList = onlineCounselService.getAllCounselListByStudentPk(studentPk);
//      Map<String, Object> testMap = testList.get(0);
//      for (Map.Entry<String, Object> entry : testMap.entrySet()) {
//          String key = entry.getKey();
//          Object value = entry.getValue();
//          System.out.println("Key: " + key + ", Value: " + value);
//      }
		return "tl_e/onlineCounsel/onlineCounselMainPage";
	}
	
	
	
	
	
	
	//		**** 상담 등록 ****
	
	@RequestMapping("writeOnlineCounselPage")
	public String writeOnlineCounselPage(Model model) {
		
		model.addAttribute("category", onlineCounselService.getAllCategory());
		
		return "tl_e/onlineCounsel/writeOnlineCounselPage";
	}
	
	
	@RequestMapping("writeOnlineCounselProcess")
	public String writeOnlineCounselProcess(OnlineCounselBoardDto onlineCounselBoardDto) {
		
		onlineCounselService.writeOnlineCounsel(onlineCounselBoardDto);
		
		return "redirect:./onlineCounselMainPage";
	}
	
	

	
	
	
	
	//		**** Read CounselPage ****
	
	@RequestMapping("readCounselPage")
	public String readCounselPage(int counsel_pk, Model model) {
		
		model.addAttribute("targetCounselDto", onlineCounselService.readCounsel(counsel_pk));
		return "tl_e/onlineCounsel/readCounselPage";
	}
	
	
}


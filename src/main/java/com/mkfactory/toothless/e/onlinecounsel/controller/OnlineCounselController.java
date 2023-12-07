package com.mkfactory.toothless.e.onlinecounsel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.CounselorTypeDto;
import com.mkfactory.toothless.e.dto.OnlineCounselBoardDto;
import com.mkfactory.toothless.e.dto.TypeCategoryDto;
import com.mkfactory.toothless.e.onlinecounsel.service.OnlineCounselService;

@Controller
@RequestMapping("/tl_e/onlineCounsel/*")
public class OnlineCounselController {

	@Autowired
	private OnlineCounselService onlineCounselService;
	
	
	
	
	//	****	학생 메인페이지		****
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
	
	
	
	//		******** 상담 등록 ********
	
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
	
	

	//		**** 학생 - 본인이 작성한 상담 읽기 ****
	
	@RequestMapping("readCounselPage")
	public String readCounselPage(int counsel_pk, Model model) {
		
		model.addAttribute("targetCounselDto", onlineCounselService.readCounsel(counsel_pk));
		return "tl_e/onlineCounsel/readCounselPage";
	}
	
	
	
	
	
	
	
	
	
	//	********	상담원 메인페이지	********

	@RequestMapping("counselorOnlineCounselMainPage")
	public String counselorOnlineCounselMainPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		int externalPk = externalInfoDto.getExternal_pk();
		
		
		model.addAttribute("counselList", onlineCounselService.getCounselInfoList(externalPk));
		
		return "tl_e/onlineCounsel/counselorOnlineCounselMainPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

//	@RequestMapping("counselorOnlineCounselMainPage")
//	public String counselorOnlineCounselMainPage(HttpSession session, Model model) {
//		
//		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
//		int externalPk = externalInfoDto.getExternal_pk();  // 302
//		
//		CounselorDto counselorDto = onlineCounselService.getCounselorInfo(externalPk);
//
//		int id = counselorDto.getId(); //82
//		
//		List<CounselorTypeDto> counselorTypeDtoList = onlineCounselService.getCounselorTypeInfo(id);
//		List<List<Map<String, Object>>> counselList = new ArrayList<>();
////		System.out.println(counselorTypeDtoList);
////		counselList.aList.studentDto.name
//		
//		for(CounselorTypeDto counselorTypeDto : counselorTypeDtoList) {
//			int typeCategoryId = counselorTypeDto.getType_category_id();  //3 , 4
//			List<Map<String, Object>> aList = new ArrayList<>();
//			List<OnlineCounselBoardDto> onlineCounselBoardDtoList = onlineCounselService.getCounselBoardInfo(typeCategoryId);
//			
//			for(OnlineCounselBoardDto onlineCounselBoardDto : onlineCounselBoardDtoList) {
//				int studentPk = onlineCounselBoardDto.getStudent_id();
//				StudentInfoDto studentInfoDto = onlineCounselService.getStudentInfo(studentPk);
//				Map<String, Object> map = new HashMap<>();
//				map.put("studentInfoDto", studentInfoDto);
//				map.put("onlineCounselBoardDto", onlineCounselBoardDto);
//				aList.add(map);	
//				
//			}	
//			counselList.add(aList);
//		}
//		
//		
//		model.addAttribute("counselList", counselList);
//		
//		return "tl_e/onlineCounsel/counselorOnlineCounselMainPage";
//		
//		
//		
//		
//	}
	
	
	
	
	

}








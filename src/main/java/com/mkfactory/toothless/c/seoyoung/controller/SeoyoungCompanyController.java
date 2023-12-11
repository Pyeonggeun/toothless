package com.mkfactory.toothless.c.seoyoung.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.c.seoyoung.service.SeoyoungCompanyServicempl;
import com.mkfactory.toothless.c.woojae.service.WoojaeExternalServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;


@Controller
@RequestMapping("/tl_c/seoyoung/company/*")
public class SeoyoungCompanyController {

	@Autowired
	private SeoyoungCompanyServicempl seoyoungCompanyService;
	@Autowired
	private GuntaekStudentServiceImpl guntaekStudentService;
	
	//산업체학생선발페이지
	@RequestMapping("ajdksStudentinternPage") 
	public String ajdksStudentinternPage(Model model,HttpSession session) {
	
		ExternalInfoDto sessionCompanyInfo = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		model.addAttribute("sessionCompanyInfo", sessionCompanyInfo);
		
		List<Map<String, Object>> map = (List<Map<String, Object>>) seoyoungCompanyService.companyList(sessionCompanyInfo.getExternal_pk());
		model.addAttribute("list", map);
		
		
		String tf = seoyoungCompanyService.companyIngTF(sessionCompanyInfo.getExternal_pk());
		if(tf==null) {
			 tf = "yes";
		}
		model.addAttribute("tf", tf);
		System.out.println(tf);
		
		//학기
//		List<Map<String, Object>> map4 = (List<Map<String, Object>>) seoyoungCompanyService.selectionGrade(sessionCompanyInfo.getExternal_pk());
//		model.addAttribute("list4", map);
		
		return "tl_c/seoyoung/company/ajdksStudentinternPage";
	}
	
	@RequestMapping("ajdksSelectInternPage") 
	public String ajdksSelectInternPage(Model model,HttpSession session,AjdksStudentInternDto pramse) {

		ExternalInfoDto sessionCompanyInfo = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		model.addAttribute("sessionCompanyInfo", sessionCompanyInfo);

		List<Map<String, Object>> map = (List<Map<String, Object>>) seoyoungCompanyService.companyList(sessionCompanyInfo.getExternal_pk());
		model.addAttribute("list", map);
	
		//신청 학생 정보 확인
		int internId=pramse.getInternship_course_pk();
		List<Map<String, Object>> map2 =  (List<Map<String, Object>>)  seoyoungCompanyService.selectionStudent(internId);
		model.addAttribute("list2", map2);
		

		// 자기소개서 리스트
		guntaekStudentService.getselfIntroductionDto(pramse.student_pk);
		model.addAttribute("selfIntroduction", guntaekStudentService.getselfIntroductionDto(pramse.student_pk));
		
		
		return "tl_c/seoyoung/company/ajdksSelectInternPage";
	}
	
}

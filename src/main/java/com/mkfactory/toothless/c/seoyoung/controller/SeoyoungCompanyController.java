package com.mkfactory.toothless.c.seoyoung.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.dto.AjdksStudentInternDto;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.c.seoyoung.service.SeoyoungCompanyServicempl;
import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;
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
		//
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
		//System.out.println(sessionCompanyInfo.getExternal_pk());
		//신청 학생 정보 확인
		int internId=pramse.getInternship_course_pk();
		List<Map<String, Object>> map2 =  (List<Map<String, Object>>)  seoyoungCompanyService.selectionStudent(internId);
		model.addAttribute("list2", map2);
		
		//자격증
		List<Map<String, Object>> map3 = (List<Map<String, Object>>) seoyoungCompanyService.getCertification(sessionCompanyInfo.getExternal_pk());
		model.addAttribute("CertificationList", map3);
		

		// 자기소개서 리스트
		model.addAttribute("selfIntroduction", guntaekStudentService.getselfIntroductionDto(pramse.getStudent_pk()));
		
		
		return "tl_c/seoyoung/company/ajdksSelectInternPage";
	}
	
	//합불합
	@RequestMapping("updateSelectInternProcess") 
	public String updateSelectInternProcess(Model model,HttpSession session, AjdksStudentApplyingDto pramse) {

		ExternalInfoDto sessionCompanyInfo = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		model.addAttribute("sessionCompanyInfo", sessionCompanyInfo);

		List<Map<String, Object>> map = (List<Map<String, Object>>) seoyoungCompanyService.companyList(sessionCompanyInfo.getExternal_pk());
		model.addAttribute("list", map);
		
		//업데이트
		seoyoungCompanyService.updateSelectionArticle(pramse);
		
	
		//신청 학생 정보 확인
		int internId=pramse.getInternship_course_pk();
		List<Map<String, Object>> map2 =  (List<Map<String, Object>>)  seoyoungCompanyService.selectionStudent(internId);
		model.addAttribute("list2", map2);
		
		//자격증
		List<Map<String, Object>> map3 = (List<Map<String, Object>>) seoyoungCompanyService.getCertification(sessionCompanyInfo.getExternal_pk());
		model.addAttribute("CertificationList", map3);
		
		
		// 자기소개서 리스트
		model.addAttribute("selfIntroduction", guntaekStudentService.getselfIntroductionDto(pramse.getStudent_pk()));
		
		return "redirect:../company/ajdksSelectInternPage?internship_course_pk="+pramse.getInternship_course_pk();
	}
	
	
	
	@RequestMapping("certificationProcess")
	public String certificationProcess(Model model, AjdksCertificationDto id) {
		
		int certification = id.getStudent_pk();
		model.addAttribute("CertificationList",seoyoungCompanyService.getCertification(certification));
		
		return "redirect:../ajdksSelectInternPage";
	
		
	}
	
	
}

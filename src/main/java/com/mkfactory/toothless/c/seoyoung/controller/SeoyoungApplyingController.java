package com.mkfactory.toothless.c.seoyoung.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.dto.AjdksCompanyInfoDto;
import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksStudentApplyingDto;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.c.seoyoung.service.SeoyoungApplyingServicempl;
import com.mkfactory.toothless.c.woojae.service.WoojaeStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_c/seoyoung/student/*")
public class SeoyoungApplyingController {
	
	@Autowired
	private SeoyoungApplyingServicempl seoyoungApplyingService;
	
	@Autowired
	private GuntaekStudentServiceImpl guntaekStudentService;
	
	@Autowired
	private WoojaeStaffServiceImpl woojaeExternalService;
	
	
	//test
	@RequestMapping("helloSeoyoung") 
	public String helloSeoyoung() {
		return "tl_c/seoyoung/helloSeoyoung";
	}
	
	// 학생 지원신청 페이지, 산업체 조회 확인
	@RequestMapping("ajdksInterneduApplyPage") 
	public String ajdksInterneduApplyPage(Model model,HttpSession session, AjdksStudentApplyingDto params) {
		
		StudentInfoDto sessionStudentInfo = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		model.addAttribute("sessionStudentInfo", sessionStudentInfo);

		List<Map<String, Object>> map = (List<Map<String, Object>>) seoyoungApplyingService.applyCompanyList();
		model.addAttribute("list", map);

		String tf = seoyoungApplyingService.applyTF(sessionStudentInfo.getStudent_pk());
		if(tf==null) {
			 tf = "yes";
		}
		model.addAttribute("tf", tf);
		
		//카테고리 서치 + 산업체
		//List<Map<String, Object>> map2 = seoyoungApplyingService.companyCategori();
		//model.addAttribute("searchCompanyCategori", map2);
		
		// 카테고리 리스트
		List<AjdksCompanyCategoryDto> list = woojaeExternalService.companyCategoryList();
		model.addAttribute("categoryList", list);
		
		
		
		return "tl_c/seoyoung/student/ajdksInterneduApplyPage";
	}
	
	// 신청내역 조회 페이지
		@RequestMapping("ajdksStudentApplyPage") 
		public String ajdksStudentApplyPage(Model model,HttpSession session, AjdksSelfIntroductionDto ajdksSelfIntroductionDto) {
			StudentInfoDto sessionStudentInfo = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
			model.addAttribute("sessionStudentInfo", sessionStudentInfo);
	
			List<Map<String, Object>> map = (List<Map<String, Object>>) seoyoungApplyingService.applyNewList(sessionStudentInfo.getStudent_pk());
			model.addAttribute("list", map);

			List<Map<String, Object>> map2 = (List<Map<String, Object>>) seoyoungApplyingService.applyOldList(sessionStudentInfo.getStudent_pk());
			model.addAttribute("list2", map2);			
			
			
			// 자기소개서 리스트
			guntaekStudentService.getselfIntroductionDto(sessionStudentInfo.getStudent_pk());
			model.addAttribute("selfIntroduction", guntaekStudentService.getselfIntroductionDto(sessionStudentInfo.getStudent_pk()));
			
			return "tl_c/seoyoung/student/ajdksStudentApplyPage";
		}
		
		// 신청 값 넘겨주기
		@RequestMapping("studentApplyProcess")
		public String studentApplyProcess(Model model, AjdksStudentApplyingDto params,HttpSession session) {
			//sessionStudentInfo.student_pk
			StudentInfoDto sessionStudentInfo = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
			model.addAttribute("sessionStudentInfo", sessionStudentInfo);
			seoyoungApplyingService.register(params);
			
			
			List<Map<String, Object>> map = (List<Map<String, Object>>) seoyoungApplyingService.applyNewList(sessionStudentInfo.getStudent_pk());
			model.addAttribute("list", map);
			
			List<Map<String, Object>> map2 = (List<Map<String, Object>>) seoyoungApplyingService.applyOldList(sessionStudentInfo.getStudent_pk());
			model.addAttribute("list2", map2);
			
			return "redirect:./ajdksStudentApplyPage";
		}
		
}

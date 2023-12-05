package com.mkfactory.toothless.d.sb.resume.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.CareerCategoryDto;
import com.mkfactory.toothless.d.dto.CareerDto;
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.sb.resume.service.ResumeServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/sb_resume/*")
public class ResumeController {

	@Autowired
	private ResumeServiceImpl resumeService;
	
	
	// 이력서 등록 페이지
	@RequestMapping("resumeRegistrationPage")
	public String resumeRegistrationPage(HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto != null) {
			return "/tl_d/sb_resume/resumeRegistrationPage";
		
		}else {
			return "redirect:../../another/student/loginPage";
		}
		
		
	}
	
	// 이력서 등록
	@RequestMapping("resumeRegisterProcess")
	public String resumeRegisterProcess(ResumeDto params) {
		resumeService.resumeRegistration(params);
		
		return "redirect:./resumeManagementPage";
	}
	
	// 이력서 목록 페이지
	@RequestMapping("resumeManagementPage")
	public String resumeManagementPage(HttpSession session, Model model, ResumeDto params) {
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		params.setStudent_pk(student_pk);
		
		List<ResumeDto> list = resumeService.getResumeList(params);
		
		List<ResumeDto> resumeList = new ArrayList<ResumeDto>();
		ResumeDto resumeDto = new ResumeDto();
		for(ResumeDto dto : list) {
			if(dto.getMain_resume().equals("Y")) {
				resumeDto = dto;
			}else {
				resumeList.add(dto);
			}
		}
		
		model.addAttribute("resumeDto", resumeDto);
		model.addAttribute("resumeList", resumeList);
		
		return "/tl_d/sb_resume/resumeManagementPage";
	}
	
	// 이력서 관리 페이지
	@RequestMapping("updateResumePage")
	public String updateResumePage(Model model, ResumeDto params, CareerDto careerDto) {
		// 이력서 내용 가져오기
		ResumeDto resumeDto = resumeService.getResume(params);
		model.addAttribute("resumeDto", resumeDto);
		
		// 경력 카테고리 가져오기
		List<CareerCategoryDto> careerCategoryList = resumeService.getCareerCategory();
		model.addAttribute("careerCategoryList", careerCategoryList);
		
		// 경력 내용 가져오기
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto);
		model.addAttribute("careerList", careerList);
		
		return "/tl_d/sb_resume/updateResumePage";
	}
	
	// 경력 추가
	@RequestMapping("careerRagistrationProcess")
	public String careerRagistrationProcess(Model model, CareerDto params) {
		
		resumeService.insertCareer(params);
		
		return "redirect:./updateResumePage?resume_pk=" + params.getResume_pk();
	}
	
	// 경력 삭제
	@RequestMapping("careerDeleteProcess")
	public String careerDeleteProcess(CareerDto params) {
		resumeService.deleteCareer(params);
		return "redirect:./updateResumePage?resume_pk=" + params.getResume_pk();
	}
	
	// 경력 수정 페이지
	@RequestMapping("updateCareerPage")
	public String updateCareerPage(Model model, CareerDto params) {
		
		int resume_pk = params.getResume_pk();
		ResumeDto dto = new ResumeDto();
		dto.setResume_pk(resume_pk);
		
		
		// 이력서 내용 가져오기
		ResumeDto resumeDto = resumeService.getResume(dto);
		model.addAttribute("resumeDto", resumeDto);
		
		// 경력 카테고리 가져오기
		List<CareerCategoryDto> careerCategoryList = resumeService.getCareerCategory();
		model.addAttribute("careerCategoryList", careerCategoryList);
		
		// 경력 내용 가져오기
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto);
		model.addAttribute("careerList", careerList);
		
		model.addAttribute("careerDto", params);
		
		
		
		return "/tl_d/sb_resume/updateCareerPage";
	}
	
	// 경력 수정
	@RequestMapping("careerUpdateProcess")
	public String careerUpdateProcess(CareerDto params) {
		resumeService.updateCareer(params);
		return "redirect:./updateResumePage?resume_pk=" + params.getResume_pk();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

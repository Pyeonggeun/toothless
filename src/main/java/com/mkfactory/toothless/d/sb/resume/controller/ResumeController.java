package com.mkfactory.toothless.d.sb.resume.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.CareerCategoryDto;
import com.mkfactory.toothless.d.dto.CareerDto;
import com.mkfactory.toothless.d.dto.LicenseDto;
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
		
		return "tl_d/sb_resume/resumeManagementPage";
	}
	
	// 메인이력서 등록
	@RequestMapping("changeMainResumeProcess")
	public String changeMainResumeProcess(ResumeDto params) {
		
		resumeService.changeMainResume(params);
		
		return "redirect:./resumeManagementPage";
	}
	
	// 이력서 공개
	@RequestMapping("changeResumeStatus")
	public String changeResumeStatus(ResumeDto params) {
		resumeService.changeResumeStatus(params);
		return "redirect:./resumeManagementPage";
	}
	
	
	
	
	// 이력서 상세보기 페이지
	@RequestMapping("resumeDetailPage")
	public String resumeDetailPage(Model model, ResumeDto params) {
		
		ResumeDto resumeDto = resumeService.getResume(params);
		model.addAttribute("resumeDto", resumeDto);
		
		// 경력 내용 가져오기
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto);
		model.addAttribute("careerList", careerList);
		
		return "tl_d/sb_resume/resumeDetailPage";
	}
	
	// 이력서 수정 페이지
	@RequestMapping("resumeUpdatePage")
	public String resumeUpdatePage(Model model, ResumeDto params) {
		
		ResumeDto resumeDto = resumeService.getResume(params);
		model.addAttribute("resumeDto", resumeDto);
		
		return "tl_d/sb_resume/resumeUpdatePage";
	}
	
	// 자소서 수정
	@RequestMapping("resumeUpdateProcess")
	public String resumeUpdateProcess(ResumeDto params) {
		
		String letter = params.getCover_letter();
		letter = StringEscapeUtils.escapeHtml4(letter);
		letter = letter.replaceAll("\n", "<br>");
		params.setCover_letter(letter);
		resumeService.updateResume(params);
		
		
		return "redirect:./resumeDetailPage?resume_pk="+ params.getResume_pk();
	}
	
	
	// 경력 추가
	@RequestMapping("careerRagistrationProcess")
	public String careerRagistrationProcess(Model model, CareerDto params) {
		
		resumeService.insertCareer(params);
		
		return "redirect:./careerDetailPage?resume_pk=" + params.getResume_pk();
	}
	
	// 경력 페이지
	@RequestMapping("careerDetailPage")
	public String careerDetailPage(Model model, ResumeDto params) {
		ResumeDto resumeDto = resumeService.getResume(params);
		
		// 경력 카테고리 가져오기
		List<CareerCategoryDto> careerCategoryList = resumeService.getCareerCategory();
		model.addAttribute("careerCategoryList", careerCategoryList);
		
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto);
		model.addAttribute("careerList", careerList);
		
		model.addAttribute("resumeDto", resumeDto);
		return "tl_d/sb_resume/careerDetailPage";
	}
	
	// 경력 수정 페이지
	@RequestMapping("careerUpdatePage")
	public String careerUpdatePage(Model model, CareerDto params) {
		int resume_pk = params.getResume_pk();
		ResumeDto resumeDto = new ResumeDto();
		resumeDto.setResume_pk(resume_pk);
		
		// 경력 카테고리 가져오기
		List<CareerCategoryDto> careerCategoryList = resumeService.getCareerCategory();
		model.addAttribute("careerCategoryList", careerCategoryList);
		
		// 경력 내용 가져오기
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto);
		model.addAttribute("careerList", careerList);
		
		model.addAttribute("careerDto", params);
		
		return "tl_d/sb_resume/careerUpdatePage";
	}
	
	// 경력 수정
	@RequestMapping("careerUpdateProcess")
	public String careerUpdateProcess(CareerDto params) {
		resumeService.updateCareer(params);
		return "redirect:./careerDetailPage?resume_pk=" + params.getResume_pk();
	}

	// 경력 삭제
	@RequestMapping("careerDeleteProcess")
	public String careerDeleteProcess(CareerDto params) {
		resumeService.deleteCareer(params);
		return "redirect:./careerDetailPage?resume_pk=" + params.getResume_pk();
	}
	
	// 자격증 관리 페이지
	
	public String licenseDetailPage(LicenseDto params) {
		
		return "tl_d/sb_resume/licenseDetailPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	// 이력서 수정 페이지
//	@RequestMapping("updateResumePage")
//	public String updateResumePage(Model model, ResumeDto params, CareerDto careerDto) {
//		// 이력서 내용 가져오기
//		ResumeDto resumeDto = resumeService.getResume(params);
//		model.addAttribute("resumeDto", resumeDto);
//		
//		// 경력 카테고리 가져오기
//		List<CareerCategoryDto> careerCategoryList = resumeService.getCareerCategory();
//		model.addAttribute("careerCategoryList", careerCategoryList);
//		
//		// 경력 내용 가져오기
//		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto);
//		model.addAttribute("careerList", careerList);
//		
//		return "/tl_d/sb_resume/updateResumePage";
//	}
//	
//	
//	
//
//	// 경력 수정 페이지
//	@RequestMapping("updateCareerPage")
//	public String updateCareerPage(Model model, CareerDto params) {
//		
//		int resume_pk = params.getResume_pk();
//		ResumeDto dto = new ResumeDto();
//		dto.setResume_pk(resume_pk);
//		
//		
//		// 이력서 내용 가져오기
//		ResumeDto resumeDto = resumeService.getResume(dto);
//		model.addAttribute("resumeDto", resumeDto);
//		
//		// 경력 카테고리 가져오기
//		List<CareerCategoryDto> careerCategoryList = resumeService.getCareerCategory();
//		model.addAttribute("careerCategoryList", careerCategoryList);
//		
//		// 경력 내용 가져오기
//		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto);
//		model.addAttribute("careerList", careerList);
//		
//		model.addAttribute("careerDto", params);
//		
//		
//		
//		return "/tl_d/sb_resume/updateCareerPage";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

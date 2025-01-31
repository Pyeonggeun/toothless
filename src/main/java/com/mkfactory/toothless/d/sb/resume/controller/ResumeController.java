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
import org.springframework.web.bind.annotation.RequestParam;

import com.mkfactory.toothless.d.dto.CareerCategoryDto;
import com.mkfactory.toothless.d.dto.CareerDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.InterestPostingDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.dto.LicenseDto;
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.dto.VolunteerDto;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.d.sb.resume.service.ResumeServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/sb_resume/*")
public class ResumeController {

	@Autowired
	private ResumeServiceImpl resumeService;
	@Autowired
	private PostingServiceImpl postingService;
	// 나연. 회사이름가져오려고 사용
	@Autowired
	private CompanyServiceIpml companyService;
	
	
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
		
		List<ResumeDto> list = resumeService.getResumeList(params);
		if(list.isEmpty()) {
			params.setMain_resume("Y");
		}
		
		
		resumeService.resumeRegistration(params);
		
		return "redirect:./resumeManagementPage";
	}
	
	// 이력서 목록 페이지
	@RequestMapping("resumeManagementPage")
	public String resumeManagementPage(HttpSession session, Model model) {
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto !=null) {
			int student_pk = studentInfoDto.getStudent_pk();
			ResumeDto params = new ResumeDto();
			params.setStudent_pk(student_pk);
		
			List<ResumeDto> list = resumeService.getResumeList(params);
			List<ResumeDto> resumeList = new ArrayList<ResumeDto>();
			
			ResumeDto resumeDto = null;
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
		
		}else {
			
			return "redirect:../../another/student/loginPage";
		}
		
		
		
		
		
		
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
		
		ResumeDto resumeDto = resumeService.getResume(params,true);
		model.addAttribute("resumeDto", resumeDto);
		
		// 경력 내용 가져오기
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto,true);
		model.addAttribute("careerList", careerList);
		// 자격증
		LicenseDto licenseDto = new LicenseDto();
		int resume_pk = resumeDto.getResume_pk();
		licenseDto.setResume_pk(resume_pk);
		List<LicenseDto> licneseList = resumeService.getLicenseDtoList(licenseDto);
		model.addAttribute("licenseList", licneseList);
		
		
		return "tl_d/sb_resume/resumeDetailPage";
	}
	
	// 이력서 수정 페이지 
	@RequestMapping("resumeUpdatePage")
	public String resumeUpdatePage(Model model, ResumeDto params) {
		
		ResumeDto resumeDto = resumeService.getResume(params,false);
		model.addAttribute("resumeDto", resumeDto);
		
		return "tl_d/sb_resume/resumeUpdatePage";
	}
	
	//이력서 삭제
//	@RequestMapping("resumeDeleteProcess")
//	public String resumeDeleteProcess(ResumeDto params) {
//		resumeService.deleteResume(params);
//		return "redirect:./resumeManagementPage";
//	}
	
	
	// 자소서 수정
	@RequestMapping("resumeUpdateProcess")
	public String resumeUpdateProcess(ResumeDto params) {
		
		
		resumeService.updateResume(params);
		
		
		return "redirect:./resumeDetailPage?resume_pk="+ params.getResume_pk();
	}
	
	
	// 경력 추가
	@RequestMapping("careerRagistrationProcess")
	public String careerRagistrationProcess(CareerDto params) {
		
		resumeService.insertCareer(params);
		
		return "redirect:./careerDetailPage?resume_pk=" + params.getResume_pk();
	}
	
	// 경력 페이지
	@RequestMapping("careerDetailPage")
	public String careerDetailPage(Model model, ResumeDto params) {
		ResumeDto resumeDto = resumeService.getResume(params,true);
		
		// 경력 카테고리 가져오기
		List<CareerCategoryDto> careerCategoryList = resumeService.getCareerCategory();
		model.addAttribute("careerCategoryList", careerCategoryList);
		
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto,true);
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
		List<Map<String, Object>> careerList = resumeService.getCareerDtoList(resumeDto,false);
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
	@RequestMapping("licenseDetailPage")
	public String licenseDetailPage(Model model, LicenseDto params) {
		List<LicenseDto> licenseList = resumeService.getLicenseDtoList(params);
		model.addAttribute("licenseList", licenseList);
		model.addAttribute("licenseDto", params);
		
		return "tl_d/sb_resume/licenseDetailPage";
	}
	
	// 자격증 삭제
	@RequestMapping("licenseDeleteProcess")
	public String licenseDeleteProcess(LicenseDto params) {
		
		resumeService.deleteLicenseDto(params);
		return "redirect:./licenseDetailPage?resume_pk="+ params.getResume_pk();
	}
	
	// 자격증 수정페이지
	@RequestMapping("licenseUpdatePage")
	public String licenseUpdatePage(Model model, LicenseDto params) {
		
		List<LicenseDto> licenseList = resumeService.getLicenseDtoList(params);
		model.addAttribute("licenseList", licenseList);
		
		model.addAttribute("licenseDto", params);
		
		return "tl_d/sb_resume/licenseUpdatePage";
	}
	
	// 자격증 수정
	@RequestMapping("licenseUpdateProcess")
	public String licenseUpdateProcess(LicenseDto params) {
		resumeService.updateLicenseDto(params);
		return "redirect:./licenseDetailPage?resume_pk=" + params.getResume_pk();
	}
	
	// 자격증 추가
	@RequestMapping("licenseRagistrationProcess")
	public String licenseRagistrationProcess(LicenseDto params) {
		resumeService.insertLicense(params);
		return "redirect:./licenseDetailPage?resume_pk=" + params.getResume_pk();
	}
	
	// 공고 지원하기 페이지
	@RequestMapping("applyJobPostingPage")
	public String applyJobPostingPage(Model model ,HttpSession session ,VolunteerDto params,InterestPostingDto interestPostingDto,
			@RequestParam(name = "resume_pk", required = false) String resume_pk) {
		
		JobPostingDto jobPostingDto = resumeService.getJobPostingDto(params);
		model.addAttribute("jobPostingDto", jobPostingDto);
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		ResumeDto resumeDto = new ResumeDto();
		resumeDto.setStudent_pk(studentInfoDto.getStudent_pk());
		List<ResumeDto> resumeList =  resumeService.getResumeList(resumeDto);
		model.addAttribute("resumeList", resumeList);
		int studentPk = studentInfoDto.getStudent_pk();
		int postingPk = params.getJob_posting_pk();
		model.addAttribute("jobPostingDetailForStudent", postingService.getJobPostingDetailForStudentAndCompany(studentPk ,postingPk,true));
		
		// 관심 공고
		interestPostingDto.setJob_posting_pk(params.getJob_posting_pk());
		
		
		
		if(studentInfoDto != null) {
			studentPk = studentInfoDto.getStudent_pk();
			interestPostingDto.setStudent_pk(studentPk);
			
		}
		
		model.addAttribute("checkMyInteresting", postingService.checkMyPostingInterestCount(interestPostingDto));
		
		 if (resume_pk != null && !resume_pk.isEmpty()) {
			 	ResumeDto dto = resumeService.getResume(resume_pk);
				model.addAttribute("resumeDto", dto);
	        }
		
		
		return "tl_d/sb_resume/applyJobPostingPage";
	}
	
	// 공고스크랩 프로세스
	@RequestMapping("interestingProcess")
	public String interestingProcess(InterestPostingDto params) {
		
		if(postingService.checkMyPostingInterestCount(params) == 0) {
			postingService.plusInterestPosting(params);
		}else {
			postingService.minusInterestPosting(params);
		}
		return "redirect:./applyJobPostingPage?job_posting_pk=" + params.getJob_posting_pk();
		
	}
	
	// 공고 지원하기
	@RequestMapping("applyJobPostingProcess")
	public String applyJobPostingProcess(VolunteerDto params, HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		ResumeDto resumeDto = new ResumeDto();
		resumeDto.setStudent_pk(studentInfoDto.getStudent_pk());
		if(params.getResume_pk() == 0) {
			List<ResumeDto> resumeList = resumeService.getResumeList(resumeDto);
			for(ResumeDto dto : resumeList) {
				if("Y".equals(dto.getMain_resume())) {
					params.setResume_pk(dto.getResume_pk());
					resumeService.applyJobPosting(params);
				}
			}
			
		
		}else {
			resumeService.applyJobPosting(params);

		}
		return "redirect:./postApplyListPage";
	}
	
	
	// 지원 공고 목록 페이지
	@RequestMapping("postApplyListPage")
	public String postApplyListPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto != null) {
			int student_pk = studentInfoDto.getStudent_pk();
			
			List<Map<String, Object>> list = resumeService.getPostAndCompanyList(student_pk);
			model.addAttribute("postAndCompanyList", list);
			
			model.addAttribute("applyCount", resumeService.getCountForStudentApplyList(student_pk));
			
			return "tl_d/sb_resume/postApplyListPage";
		
		}else {
			return "redirect:../../another/student/loginPage";
		}
		
		
		
//		List<JobPostingDto> postList = resumeService.getPostApplyList(student_pk);
//		model.addAttribute("postList", postList);
//		
//		List<CompanyDto> companyDtoList = resumeService.getCompanyDtoListByStudentPk(student_pk);
//		model.addAttribute("companyList", companyDtoList);
		
		
		
		
	}
	
	// 공고 지원 취소
	@RequestMapping("cancleApplyProcess")
	public String cancleApplyProcess(HttpSession session, int job_posting_pk) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int student_pk = studentInfoDto.getStudent_pk();
		
		resumeService.cancleApply(student_pk, job_posting_pk);
		
		return "redirect:./postApplyListPage";
	}
	
	// 공개한 학생들의 이력서 보는 페이지
	@RequestMapping("publicResumeByStudentListPage")
	public String publicResumeByStudentListPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalInfoPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalInfoPk);
			
			//나연. 회사이름 가져오는 용으로 사용
			model.addAttribute("company", companyService.getCompany(companyDto.getCom_pk()));
			model.addAttribute("applyStudentList", postingService.getApplyStudentTotalList(companyDto.getCom_pk()));
			model.addAttribute("resumeList", resumeService.getPublicResumeList());
			model.addAttribute("departmentCategory" , resumeService.getDepartmentCategory());
		
			return "tl_d/sb_resume/publicResumeByStudentListPage";
		
		}else {
			return "redirect:../../another/external/loginPage";
		}
		
	}
	
	
	// 지원한 학생의 이력서 보는 페이지
	@RequestMapping("viewResumeByApplyStudentPage")
	public String viewResumeByApplyStudentPage(HttpSession session,  Model model, int job_posting_pk) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalInfoPk = externalInfoDto.getExternal_pk();
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalInfoPk);
			List<Map<String, Object>> resumeList = resumeService.getResumeDtoListAndStudentInfoByJobPostingPk(job_posting_pk);
			JobPostingDto jobPostingDto = resumeService.getApplyJobPostingDto(job_posting_pk);
			
			model.addAttribute("company", companyService.getCompany(companyDto.getCom_pk()));
			model.addAttribute("resumeList", resumeList);
			model.addAttribute("job_posting_pk", job_posting_pk);
			model.addAttribute("jobPostingDto", jobPostingDto);
			return "tl_d/sb_resume/viewResumeByApplyStudentPage";
		
		}else {
			return "redirect:../../another/external/loginPage";
		}
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

package com.mkfactory.toothless.d.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;
import com.mkfactory.toothless.d.gw.program.service.ProgramServiceIpml;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.d.sb.resume.service.ResumeServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/common/*")
public class EmploymentCommonController {

	
	@Autowired
	private PostingServiceImpl postingService;
	
	@Autowired
	private CompanyServiceIpml companyService;

	@Autowired
	private ResumeServiceImpl resumeService;
	
	@Autowired
	private ProgramServiceIpml programService;
	
	// 학생용 마이페이지
	@RequestMapping("studentMyPage")
	public String studentMyPage(HttpSession session, Model model) {
			
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			int studentPk = studentInfoDto.getStudent_pk();
			model.addAttribute("interestpostingForMyPage", postingService.getInterestPostingListForMyPage(studentPk));
			model.addAttribute("applyPostListForMyPage", resumeService.getRowNumApplyList(studentPk));
			model.addAttribute("applyProgramListForMyPage", programService.studentApplyProgramList());
			model.addAttribute("studentDepartmentName", postingService.getStudentDepartmentName(studentInfoDto.getDepartment_pk()));
		}
		
		
		return "tl_d/common/studentMyPage";
	}
	
	// 학생 로그아웃
	@RequestMapping("studentLogoutProcess")
	public String studentLogoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:./studentMyPage";
	}
	
	// 취창업 메인 페이지
	@RequestMapping("employmentMainPage")
	public String employMainPage(Model model) {
		
		model.addAttribute("programList", programService.getProgramList());
		return "tl_d/common/employmentMainPage";
	}
	
	// 메인페이지 로그아웃
	@RequestMapping("studentLogoutProcessForMain")
	public String studentLogoutProcessForMain(HttpSession session) {
		session.invalidate();
		return "redirect:./employmentMainPage";
	}
	
	
	
	
	// 기업용 메인 페이지
	@RequestMapping("companyMainPage")
	public String companyMainPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto)session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalPk);
			
			model.addAttribute("company", companyService.getCompany(companyDto.getCom_pk()));
			model.addAttribute("companyList", companyService.getCompanyList());
			model.addAttribute("mainResumeList", companyService.mainResumeListForCompany());
			
			// 관심기업 학생 4개 컷
			model.addAttribute("interestCompanyList", postingService.getInterestCompanyListForMainPage(companyDto.getCom_pk()));
			// 채용공고 4개 컷
			model.addAttribute("jobPostingForCompanyMainPage", postingService.getPostingListForCompanyMainPage(companyDto.getCom_pk()));
			// 기업 지원자 4개 컷
			model.addAttribute("applyListForMainPage", postingService.getApplyListForCompanyMainPage(companyDto.getCom_pk()));
		}
		
		return "tl_d/common/companyMainPage";
	}
	
	// 기업 로그아웃
	@RequestMapping("companyLogoutProcess")
	public String companyLogoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:./companyMainPage";
	}
	
	
	//교직원 메인페이지
	@RequestMapping("staffMainPage")
	public String staffMainPage(Model model) {
		
		
		
		
		//기업용
		model.addAttribute("companyList", companyService.getCompanyList());
		
		return "tl_d/common/staffMainPage";
	}
	
	// 교직원 로그아웃
	@RequestMapping("staffLogoutProcess")
	public String staffLogoutProcess(HttpSession session) {
		
		session.invalidate();
		return "redirect:./staffMainPage";
	}

}

package com.mkfactory.toothless.d.sb.resume.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.d.dto.D_RestResponseDto;
import com.mkfactory.toothless.d.dto.LicenseDto;
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.d.sb.resume.service.ResumeServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@RestController
@RequestMapping("/tl_d/sb_resume/*")
public class RestResumeController {

	@Autowired
	private ResumeServiceImpl resumeService;
	@Autowired
	private PostingServiceImpl postingService;
	
	
	@RequestMapping("getSessionStudentId")
	public D_RestResponseDto getSessionStudentId(HttpSession session) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		StudentInfoDto sessionUser = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		d_RestResponseDto.setResult("success");
		
		if(sessionUser !=null) {
			d_RestResponseDto.setData(sessionUser.getStudent_pk());
		
		}
		
		return d_RestResponseDto;
		
	}
	
	
	// 일반 이력서 목록 가져오기
	@RequestMapping("getGeneralResumeList")
	public D_RestResponseDto getGeneralResumeList(int student_pk) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		d_RestResponseDto.setResult("success");
		
		d_RestResponseDto.setData(resumeService.getGeneralResumeList(student_pk));
		
		return d_RestResponseDto;
	}
	
	// 메인 이력서 가져오기
	@RequestMapping("getMainResume")
	public D_RestResponseDto getMainResume(int student_pk) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		d_RestResponseDto.setResult("success");
		
		d_RestResponseDto.setData(resumeService.getMainResumeDto(student_pk));
		
		return d_RestResponseDto;
	}
	
	
	// 이력서 삭제
	@RequestMapping("deleteResume")
	public D_RestResponseDto deleteResume(int resume_pk) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
	
		resumeService.deleteResume(resume_pk);
		
		d_RestResponseDto.setResult("success");
		
		return d_RestResponseDto;
	}
	
	// 이력서 미리보기 모달
	@RequestMapping("previewResume")
	public D_RestResponseDto previewResume(int resume_pk) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
	
		d_RestResponseDto.setResult("success");
	
		d_RestResponseDto.setData(resumeService.getThisResumeDto(resume_pk));
		
		return d_RestResponseDto;
	}
	
	
	// 메인 이력서 공개
	@RequestMapping("changePublicStatus")
	public D_RestResponseDto changePublicStatus(ResumeDto params) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
	
		d_RestResponseDto.setResult("success");
	
		resumeService.changeResumeStatus(params);
		
		return d_RestResponseDto;
	}
	
	// 메인 이력서로 변경
	@RequestMapping("changeMainStatus")
	public D_RestResponseDto changeMainStatus(ResumeDto params) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
	
		d_RestResponseDto.setResult("success");
	
		resumeService.changeMainResume(params);
		
		return d_RestResponseDto;
	}
	
	// 이력서 추가
	@RequestMapping("addResume")
	public D_RestResponseDto addresume(HttpSession session, ResumeDto params) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto !=null) {
			int student_pk = studentInfoDto.getStudent_pk();
			params.setStudent_pk(student_pk);
		}
		params.setIs_public("N");
		
		List<ResumeDto> list = resumeService.getResumeList(params);
		if(list.isEmpty()) {
			params.setMain_resume("Y");
		}
		
		
		
		d_RestResponseDto.setResult("success");
	
		resumeService.resumeRegistration(params);
		
		return d_RestResponseDto;
	}
	
	// 이력서 내용 가져오기
	@RequestMapping("getResumeDto")
	public D_RestResponseDto getResumeDto (ResumeDto params) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		d_RestResponseDto.setResult("success");
		d_RestResponseDto.setData(resumeService.getResume(params));
		
		
		return d_RestResponseDto;
	}
	
	// 경력 내용 가져오기
	@RequestMapping("getCareerDto")
	public D_RestResponseDto getCareerDto (ResumeDto params) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		d_RestResponseDto.setResult("success");
		ResumeDto resumeDto = resumeService.getResume(params);
		
		d_RestResponseDto.setData(resumeService.getCareerDtoList(resumeDto));
		
		
		return d_RestResponseDto;
	}
	
	// 자격증 내용 가져오기
	@RequestMapping("getLicenseDto")
	public D_RestResponseDto getLicenseDto (ResumeDto params) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		d_RestResponseDto.setResult("success");
		ResumeDto resumeDto = resumeService.getResume(params);
		
		LicenseDto licenseDto = new LicenseDto();
		int resume_pk = resumeDto.getResume_pk();
		licenseDto.setResume_pk(resume_pk);
		
		d_RestResponseDto.setData(resumeService.getLicenseDtoList(licenseDto));
		return d_RestResponseDto;
	}
	
	@RequestMapping("getStudentInfoByResume")
	public D_RestResponseDto getStudentInfoByResume(ResumeDto params) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		d_RestResponseDto.setResult("success");
		ResumeDto resumeDto = resumeService.getResume(params);
		int student_pk = resumeDto.getStudent_pk();
		StudentInfoDto student = resumeService.getStudentDtoByResumePk(student_pk);
		d_RestResponseDto.setData(student);
		
		return d_RestResponseDto;
	}
	
	// 공개된 이력서 목록 가져오기
	@RequestMapping("getIsPublicResumeList")
	public D_RestResponseDto getIsPublicResumeList (int department_pk) {
		D_RestResponseDto d_RestResponseDto = new D_RestResponseDto();
		d_RestResponseDto.setResult("success");
		
		
		if(department_pk == 0) {
			d_RestResponseDto.setData(resumeService.getPublicResumeList());
		}else {
			d_RestResponseDto.setData(resumeService.getResumeDtoListByDepartmentPk(department_pk));
		}
		
		return d_RestResponseDto;
	}

	
	
	
	

	
	
}

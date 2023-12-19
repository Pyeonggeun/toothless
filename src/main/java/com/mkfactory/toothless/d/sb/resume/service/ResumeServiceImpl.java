package com.mkfactory.toothless.d.sb.resume.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.CareerCategoryDto;
import com.mkfactory.toothless.d.dto.CareerDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.dto.LicenseDto;
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.dto.VolunteerDto;
import com.mkfactory.toothless.d.ny.posting.mapper.PostingSqlMapper;
import com.mkfactory.toothless.d.sb.resume.mapper.ResumeSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class ResumeServiceImpl {

	@Autowired
	private ResumeSqlMapper resumeSqlMapper;
	@Autowired
	private PostingSqlMapper postingSqlMapper;
	
	// 이력서 등록
	public void resumeRegistration(ResumeDto resumeDto) {
		
		if(resumeDto.getMain_resume().equals("Y")) {
		
			List<ResumeDto> resumeList = resumeSqlMapper.getResumeListByStudentPk(resumeDto);
			for(ResumeDto resumeDto2 : resumeList) {
				if(resumeDto2.getMain_resume().equals("Y") || resumeDto2.getIs_public().equals("Y") ) {
					resumeSqlMapper.changeMainAndPublic(resumeDto2);
				}
				
			}
			
		}
		
		resumeSqlMapper.insertResumeDto(resumeDto);
		
	}
	
	// 학생 이력서 목록 가져오기
	public List<ResumeDto> getResumeList(ResumeDto resumeDto) {
		
		List<ResumeDto> resumeList = resumeSqlMapper.getResumeListByStudentPk(resumeDto);
		
		return resumeList;
	}
	
	
	
	// 메인 이력서 변경
	public void changeMainResume(ResumeDto resumeDto) {
		
		ResumeDto dto = resumeSqlMapper.getThisResumeDtoByResumePk(resumeDto);
		
		
		if(dto.getMain_resume().equals("N")) {	
			List<ResumeDto> resumeList = resumeSqlMapper.getResumeListByStudentPk(dto);
			for(ResumeDto resumeDto2 : resumeList) {
				if(resumeDto2.getMain_resume().equals("Y") || resumeDto2.getIs_public().equals("Y") ) {
					
					resumeSqlMapper.changeMainAndPublic(resumeDto2);
				}
				
			}
		}	
		resumeSqlMapper.changeMainResume(resumeDto);
		
	}
	
	// 이력서 공개
	public void changeResumeStatus(ResumeDto resumeDto) {
		
		ResumeDto dto = resumeSqlMapper.getThisResumeDtoByResumePk(resumeDto);
		
		if(dto.getIs_public().equals("N")) {
			resumeSqlMapper.changePublicResume(resumeDto);
			
		}else {
			resumeSqlMapper.changePrivateResume(resumeDto);
			
		}	
	}
	
	
	// 이력서 상세보기
	public ResumeDto getResume(ResumeDto resumeDto) {
		
		ResumeDto dto = resumeSqlMapper.getThisResumeDtoByResumePk(resumeDto);
		
		return dto;
	}
	
	// 이력서 내용 수정
	public void updateResume(ResumeDto resumeDto) {
		
		resumeSqlMapper.updateResumeDtoByResumePk(resumeDto);
	}
	
	// 이력서 삭제
//	public void deleteResume(ResumeDto resumeDto) {
//		
//		resumeSqlMapper.deleteResumeByResumePk(resumeDto);
//	}
	
	public ResumeDto getResume(String resume_pk) {
		ResumeDto resumeDto = resumeSqlMapper.getResumeDtoByResumePk(resume_pk);
		return resumeDto;
	}
	
	// 경력 카테고리 가져오기
	public List<CareerCategoryDto> getCareerCategory(){
		
		List<CareerCategoryDto> careerList = resumeSqlMapper.getCareerCategoryList();
		
		return careerList;
	}
	
	
	// 경력 추가
	public void insertCareer(CareerDto careerDto) {
		
		resumeSqlMapper.insertCareerContents(careerDto);
	}
	
	
	// 해당 이력성에 작성한 경력 목록 가져오기
	public List<Map<String, Object>> getCareerDtoList(ResumeDto resumeDto) {
		// 이력서 번호에 해당되는 경력 리스트 뽑아오기
		
		List<Map<String, Object>> careerList = new ArrayList<Map<String,Object>>();
		
		List<CareerDto> list = resumeSqlMapper.getCareerByResumePk(resumeDto);
		
		for(CareerDto careerDto : list) {
			int category_pk = careerDto.getCareer_category_pk();
			CareerCategoryDto careerName = resumeSqlMapper.getCareerCategoryNameByCategoryPk(category_pk);
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("careerName", careerName);
			map.put("careerDto", careerDto);
			
			careerList.add(map);
		}
		
		return careerList;
	}
	
	// 경력 삭제
	public void deleteCareer(CareerDto careerDto) {
		resumeSqlMapper.deleteCareerByCareerPk(careerDto);
	}
	
	// 경력 수정
	public void updateCareer(CareerDto careerDto) {
		resumeSqlMapper.updateCareerByCareerPk(careerDto);
	}
	
	
	// 자격증 추가
	public void insertLicense(LicenseDto licenseDto) {
		resumeSqlMapper.insertLicenseContents(licenseDto);
	}
	
	// 이력서에 해당되는 자격증 목록 가져오기
	public List<LicenseDto> getLicenseDtoList(LicenseDto licenseDto){
		
		List<LicenseDto> list = resumeSqlMapper.getLicenseDtoListByResumePk(licenseDto);
		
		return list;
	}
	
	
	// 해당 자격증 삭제
	public void deleteLicenseDto(LicenseDto licenseDto) {
		resumeSqlMapper.deleteLicenseByLicensePk(licenseDto);
	}
	
	// 자격증 수정
	public void updateLicenseDto(LicenseDto licenseDto) {
		resumeSqlMapper.updateLicenseByLicensePk(licenseDto);
	}
	
	// 지원하려는 공고 정보 가져오기
	public JobPostingDto getJobPostingDto(VolunteerDto volunteerDto ) {
		JobPostingDto jobPostingDto = resumeSqlMapper.getJobPostingByJobPostingPk(volunteerDto);
		
		return jobPostingDto;
	}
	
	
	// 공고 지원하기
	public void applyJobPosting(VolunteerDto volunteerDto) {
		resumeSqlMapper.insertFromJobPostingToVolunteer(volunteerDto);
	}
	
	
	// 학생이 지원한 공고 목록 가져오기
	public List<JobPostingDto> getPostApplyList(int student_pk){
		
		List<JobPostingDto> list = resumeSqlMapper.getPostingListByStudentPk(student_pk);
		
		return list;
	}
	
	// 학생이 지원한 회사 정보 목록 가져오기
	public List<CompanyDto> getCompanyDtoListByStudentPk(int student_pk){
		
		List<CompanyDto> list = resumeSqlMapper.getComPanyDtoListByStudentPk(student_pk);
		
		return list;
	}
	
	// 학생이 지원한 공고목록과 회사 정보 가져오기
	public List<Map<String, Object>> getPostAndCompanyList(int student_pk) {
		
		List<JobPostingDto> postList = resumeSqlMapper.getPostingListByStudentPk(student_pk);
		
		
		List<CompanyDto> companyList = resumeSqlMapper.getComPanyDtoListByStudentPk(student_pk);
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		
		
		for(JobPostingDto jobPostingDto : postList) {
			
			for(CompanyDto companyDto : companyList) {
				if(jobPostingDto.getCom_pk()== companyDto.getCom_pk()) {
					Map<String, Object> map = new HashMap<String, Object>();
					JobFieldCategoryDto jobFieldCategoryDto = postingSqlMapper.selectByJobFieldCategoryPk(jobPostingDto.getJob_field_category_pk());
					
					String str = companyDto.getCom_address();
					
					if (str.length() >= 2) {
						companyDto.setCom_address(str.substring(0, 2));
					}
					
					map.put("postDto", jobPostingDto);
					map.put("companyDto", companyDto);
					map.put("jfcDto", jobFieldCategoryDto);
					list.add(map);
				}
			}
		}
		
		return list;
		
		
		
	}
	
	
	
	// 학생이 지원한 공고 수 가져오기
	public int getCountForStudentApplyList(int student_pk) {
		int count = resumeSqlMapper.getCountForStudentApplyListByStudentPk(student_pk);
		
		return count;
	}
	
	// 학생이 공고 지원 취소하기
	public void cancleApply(int student_pk, int job_posting_pk) {
		
		resumeSqlMapper.cancleApplyForJobPosting(student_pk, job_posting_pk);
	}
	
	
	// 학생 마이페이지에 지원한 공고목록 4줄 요약
	public List<Map<String, Object>> getRowNumApplyList(int student_pk){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<JobPostingDto> postList = resumeSqlMapper.getApplyListByStudentPkToMyPage(student_pk);
		
		List<CompanyDto> companyList = resumeSqlMapper.getComPanyDtoListByStudentPk(student_pk);
		
		for(JobPostingDto jobPostingDto : postList) {
				
			for(CompanyDto companyDto : companyList) {
				if(jobPostingDto.getCom_pk()== companyDto.getCom_pk()) {
					Map<String, Object> map = new HashMap<String, Object>();
					JobFieldCategoryDto jobFieldCategoryDto = postingSqlMapper.selectByJobFieldCategoryPk(jobPostingDto.getJob_field_category_pk());
					
					String str = companyDto.getCom_address();
					
					if (str.length() >= 2) {
						companyDto.setCom_address(str.substring(0, 2));
					}
					
					map.put("postDto", jobPostingDto);
					map.put("companyDto", companyDto);
					map.put("jfcDto", jobFieldCategoryDto);
					list.add(map);
				}
			}
		}
	
		return list;
	}
	
	// 공개된 학생 이력서 정보 가져오기
	public List<Map<String,Object>>  getPublicResumeList(){
		
		List<Map<String,Object>> resumeList = new ArrayList<Map<String,Object>>();
		
		List<ResumeDto> list = resumeSqlMapper.getMainResumeListByIsPublic();
		
		for(ResumeDto resumeDto : list ) {
			Map<String, Object> map = new HashMap<String, Object>();
			int resume_pk = resumeDto.getResume_pk();
			String departmentName = resumeSqlMapper.getStudentDepartmentNameByResumePk(resume_pk);
			
			map.put("resumeDto", resumeDto);
			map.put("department", departmentName );
			
			resumeList.add(map);
		}
		
		return resumeList;
		
	}
	// 공개된 이력서의 학생 정보 가져오기
	public StudentInfoDto getStudentDtoByResumePk(int student_pk) {
		
		StudentInfoDto student = resumeSqlMapper.getStudentDtoByResumePk(student_pk);
		
		return student;
		
	}
	

	
//	-----------------------------------------------------------------------------------------
	// ajax 
	
	// 학생의 일반 이력서 목록 가져오기
	public List<ResumeDto> getGeneralResumeList(int student_pk) {
		
		List<ResumeDto> resumeList = resumeSqlMapper.getGeneralResumeListByStudentPk(student_pk);
		
		return resumeList;
		
		
	}
	
	// 학생 메인 이력서 가져오기
	public ResumeDto getMainResumeDto(int student_pk) {
		ResumeDto resumeDto = resumeSqlMapper.getMainResumeDtoByStudentPk(student_pk);
		return resumeDto;
	}
	
	
	// 학생 이력서 삭제
	public void deleteResume(int resume_pk) {
		resumeSqlMapper.deleteResumeByResumePk(resume_pk);
	}
	
	// 이력서 미리보기
	public ResumeDto getThisResumeDto(int resume_pk) {
		ResumeDto resumeDto = resumeSqlMapper.getResumeDtoByResumePk(resume_pk);
		return resumeDto;
	}
	
}

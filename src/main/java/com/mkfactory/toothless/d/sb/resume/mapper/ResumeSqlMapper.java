package com.mkfactory.toothless.d.sb.resume.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.d.dto.CareerCategoryDto;
import com.mkfactory.toothless.d.dto.CareerDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.dto.LicenseDto;
import com.mkfactory.toothless.d.dto.ResumeDto;
import com.mkfactory.toothless.d.dto.VolunteerDto;

public interface ResumeSqlMapper {

	// 이력서등록
	public void insertResumeDto(ResumeDto resumeDto);
	
	// 로그인 학생의 이력서 가져오기
	public List<ResumeDto> getResumeListByStudentPk(ResumeDto resumeDto);
	
	// 메인이력서로 새이력서 등록시 기존이력서 변경
	public void changeMainAndPublic(ResumeDto resumeDto);
	
	// 기본이력서 메인으로 변경시
	public void changeMainResume(ResumeDto resumeDto);
	
	// 이력서 공개하기
	public void changePublicResume(ResumeDto resumeDto);
	
	// 이력서 비공개하기
	public void changePrivateResume(ResumeDto resumeDto);
	
	// 이력서 상세보기
	public ResumeDto getThisResumeDtoByResumePk(ResumeDto resumeDto);
	
	// 이력서 내용 수정
	public void updateResumeDtoByResumePk(ResumeDto resumeDto);
	
	
	// 경력 카테고리가져오기
	public List<CareerCategoryDto> getCareerCategoryList();
	
	// 경력 추가
	public void insertCareerContents(CareerDto careerDto);
	
	// 해당 이력서의 경력 내용 가져오기
	public List<CareerDto> getCareerByResumePk(ResumeDto resumeDto);
	
	// 경력 카테고리 번호로 카테고리 이름 가져오기
	public CareerCategoryDto getCareerCategoryNameByCategoryPk(int category_pk);
	
	// 경력 삭제
	public void deleteCareerByCareerPk(CareerDto careerDto);
	
	// 경력 수정
	public void updateCareerByCareerPk(CareerDto careerDto);
	
	// 자격증 추가
	public void insertLicenseContents(LicenseDto licenseDto);
	
	// 이력서에 작성한 자격증 목록 가져오기
	public List<LicenseDto> getLicenseDtoListByResumePk(LicenseDto licenseDto);
	
	// 해당 자격증 삭제
	public void deleteLicenseByLicensePk(LicenseDto licenseDto);
	
	// 자격증 수정
	public void updateLicenseByLicensePk(LicenseDto licenseDto);
	
	// 지원하려는 공고 정보 가져오기
	public JobPostingDto getJobPostingByJobPostingPk(VolunteerDto volunteerDto);
	
	// 공고 지원하기
	public void insertFromJobPostingToVolunteer(VolunteerDto volunteerDto);
	
	// 공고 지원자들의 이력서 번호 가져오기
	public List<VolunteerDto> getResumePkFromVolunteerList();
	
	// 학생이 지원한 공고 목록 가져오기
	public List<JobPostingDto> getPostingListByStudentPk(int student_pk);
	
	// 학생이 지원한 회사 정보 가져오기
	public List<CompanyDto> getComPanyDtoListByStudentPk(int student_pk);
	
	// 학생이 지원한 공고 수 가져오기
	public int getCountForStudentApplyListByStudentPk(int student_pk);
	
	// 학생이 지원한 공고 지원 취소하기
	public void cancleApplyForJobPosting(@Param("student_pk")int student_pk, @Param("job_posting_pk")int job_posting_pk);
	
	// 학생 마이페이지에 지원한 공고목록 4줄 요약
	public List<JobPostingDto> getApplyListByStudentPkToMyPage(int student_pk);
	
	
	
	
	
	
}

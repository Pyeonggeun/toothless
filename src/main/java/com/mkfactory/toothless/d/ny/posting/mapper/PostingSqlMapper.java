package com.mkfactory.toothless.d.ny.posting.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.d.dto.ComScaleCategoryDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.dto.InterestPostingDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.donot.touch.dto.GraduationInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface PostingSqlMapper {
	
	// 교직원

	// 채용공고 시퀀스
	public int createJobPostingPk();
	
	// 채용공고 등록용 분야 카테고리 출력
	public List<JobFieldCategoryDto> selectJobFieldCategoryList();
	
	// 회사명으로 pk 뽑기
	public int selectComPkByBusinessNumber(String business_number);
	
	// 채용공고 등록 페이지
	public void insertJobPostingInfo(JobPostingDto jobPostingDto);
	
	// 기업 리스트 출력(사업자 번호 확인용)
	public List<CompanyDto> selectCompanyList();
	
	// 총 공고 수 출력
	public int selectPostingCount();
	
	// 공고 리스트 출력
	public List<JobPostingDto> selectPostingList(
			@Param("searchType") String searchType, 
			@Param("searchWord") String searchWord
			);
	
	// 기업 + 채용공고
	public CompanyDto selectByCompanyPk(int com_pk); 
	
	// 채용분야 + 채용공고
	public JobFieldCategoryDto selectByJobFieldCategoryPk(int job_field_category_pk);
	
	// 마감임박 채용공고
	public List<Integer> selectPostingDeadline();
	
	// 마감종료 채용공고
	public List<Integer> selectEndPosting();
	
	// 기업별 공고 수
	public int selectCompanyPostingCount(int com_pk);
	
	// 기업별 공고 리스트
	public List<JobPostingDto> selectPostingListByComPk(int com_pk);
	
	// 공고 상세 리스트
	public JobPostingDto selectPostingDetailByJobPostingPk(int job_posting_pk);
	
	// 기업담당자 + 기업
	public CompanyManagerDto selectByComManagerPk(int com_manager_pk);
	
	// 기업규모 + 기업
	public ComScaleCategoryDto selectByComScaleCategoryPk(int com_scale_category_pk);
	
	// 디데이
	public int selectPostingDeadlineDDay(int job_posting_pk);
	
	// 채용공고 삭제
	public void deleteJobPostingByJobPostingPk(int job_posting_pk);
	
	// 채용공고 수정
	public void updateJobPostingInfo(JobPostingDto jobPostingDto);
	
	
	// 학생
	
	// 학생 마이페이지용 관심공고(4개 컷 + 채용마감일순)
	public List<JobPostingDto> selectInterestPostingListForMyPage(int student_pk);
	
	// 학생 마이페이지 관심공고 총 리스트
	public List<JobPostingDto> selectTotalInterestPostingList(int student_pk);
	
	// 총 관심공고 수
	public int selectTotalInterestPostingCount(int student_pk);
	
	// 학생 공고리스트용 관심기업
	public List<Integer> selectInterestCompanyByStudentPk(int student_pk);
	
	
	// 기업
	
	// 기업 + 외부인
	public CompanyDto selectByExternalPk(int external_pk);
	
	// 공고스크랩 추가
	public void insertInterestPosting(InterestPostingDto interestPostingDto);
	
	// 공고스크랩 삭제
	public void deleteInterestPosting(InterestPostingDto interestPostingDto);
	
	// 공고스크랩 했던가..?
	public int selectMyPostingInterestCount(InterestPostingDto interestPostingDto);
	
	// 총 공고스크랩
	public int selectAllInterestPosting(int job_posting_pk);
	
	// 공고별 스크랩한 학생 목록
	public List<StudentInfoDto> selectStudentInterestList(int job_posting_pk);
	
	// 졸업여부
	public List<Integer> selectGraduationList();
	
	// 기업 메인페이지용 공고 목록 4개(마감임박 + 지원자 많은 순)
	public List<JobPostingDto> selectPostingListForCompanyMainPage(int com_pk);
	
	// 공고 지원한 학생 출력
	public List<StudentInfoDto> selectApplyStudentList(int job_posting_pk);
	
	// 기업 메인페이지용 지원 학생
	public List<StudentInfoDto> selectApplyStudentListForCompany(int com_pk);
	
	// 기업 지원학생 리스트
	public List<StudentInfoDto> selectApplyStudentTotalList(int com_pk);
	
	// 기업 메인페이지용 관심기업 학생
	public List<StudentInfoDto> selectMyCompanyInterestStudentList(int com_pk);
	
	// 관심기업학생 목록
	public List<StudentInfoDto> selectMyCompanyInterestTotalList(int com_pk);
	
	// 학생 + 학과
	public String selectByDepartmentPk(int department_pk);
	
	// 지원자
	public List<Integer> selectMyApplyByStudentPk(int student_pk);
}

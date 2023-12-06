package com.mkfactory.toothless.d.ny.posting.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.d.dto.ComScaleCategoryDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.dto.InterestPostingDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;

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
	public List<JobPostingDto> selectPostingList();
	
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
	
	
	// 기업
	
	// 기업 + 외부인
	public CompanyDto selectByExternalPk(int external_pk);
	
	// 공고찜 추가
	public void insertInterestPosting(InterestPostingDto interestPostingDto);
	
	// 공고찜 삭제
	public void deleteInterestPosting(InterestPostingDto interestPostingDto);
	
	// 공고찜 했던가..?
	public int selectMyPostingInterestCount(InterestPostingDto interestPostingDto);
	
	// 총 공고찜
	public int selectAllInterestPosting(int job_posting_pk);
}

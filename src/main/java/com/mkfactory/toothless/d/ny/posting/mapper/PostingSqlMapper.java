package com.mkfactory.toothless.d.ny.posting.mapper;

import java.util.List;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;

public interface PostingSqlMapper {

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
	
	// 기업별 공고 리스트
	public List<JobPostingDto> selectPostingListByComPk(int com_pk);
	
//	// 기업별 공고 수
//	public int selectPostingCount(int com_pk);
	
}

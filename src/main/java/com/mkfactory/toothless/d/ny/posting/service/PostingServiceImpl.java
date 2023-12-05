package com.mkfactory.toothless.d.ny.posting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.ComScaleCategoryDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.ny.posting.mapper.PostingSqlMapper;

@Service
public class PostingServiceImpl {
	
	@Autowired
	private PostingSqlMapper postingSqlMapper;
	
	// 채용공고 등록용 카테고리 
	public List<JobFieldCategoryDto> getJobFieldCategoryList(){
		return postingSqlMapper.selectJobFieldCategoryList();
	}
	
	// 채용공고 회사명으로 pk출력
	public int getComPkByBusinessNumber(String business_number) {
		return postingSqlMapper.selectComPkByBusinessNumber(business_number);
	}
	
	// 채용공고 등록
	public void registerJobPostingInfo(JobPostingDto jobPostingDto) {
		postingSqlMapper.insertJobPostingInfo(jobPostingDto);
	}
	public List<CompanyDto> getCompanyList(){
		return postingSqlMapper.selectCompanyList();
	}
	
	// 총 공고 개수
	public int getPostingCount() {
		return postingSqlMapper.selectPostingCount();
	}
	
	// 채용공고 리스트
	public List<Map<String, Object>> getPostingList(){
		
		List<Map<String, Object>> postingList = new ArrayList<>();
		
		List<JobPostingDto> jobPostingDtoList = postingSqlMapper.selectPostingList();
		
		for(JobPostingDto jobPostingDto : jobPostingDtoList) {
			

			CompanyDto companyDto = postingSqlMapper.selectByCompanyPk(jobPostingDto.getCom_pk());
			JobFieldCategoryDto jobFieldCategoryDto = postingSqlMapper.selectByJobFieldCategoryPk(jobPostingDto.getJob_field_category_pk());
			
			Map<String, Object> jobPostingMap = new HashMap<>();
			
			String str = companyDto.getCom_address();
			
			if (str.length() >= 2) {
				companyDto.setCom_address(str.substring(0, 2));
			} else {
				
			}
			
			List<Integer> postingDeadlineList = postingSqlMapper.selectPostingDeadline();
			List<Integer> endPostingList = postingSqlMapper.selectEndPosting();
			
			jobPostingMap.put("companyDto", companyDto);
			jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
			jobPostingMap.put("jobPostingDto",jobPostingDto);
			jobPostingMap.put("postingDeadlineList", postingDeadlineList);
			jobPostingMap.put("endPostingList", endPostingList);
			
			postingList.add(jobPostingMap);
			
		}
		
		return postingList;
	}
	// 기업별 공고 개수
	public int getCompanyPostingCount(int com_pk) {
		return postingSqlMapper.selectCompanyPostingCount(com_pk);
	}
	
	// 기업별 공고 리스트
	public List<Map<String, Object>> getCompanyPostingList(int com_pk){
			
			List<Map<String, Object>> companypostingList = new ArrayList<>();
			
			List<JobPostingDto> companyPostingDtoList = postingSqlMapper.selectPostingListByComPk(com_pk);
			
			for(JobPostingDto jobPostingDto : companyPostingDtoList) {
				
	
				CompanyDto companyDto = postingSqlMapper.selectByCompanyPk(jobPostingDto.getCom_pk());
				JobFieldCategoryDto jobFieldCategoryDto = postingSqlMapper.selectByJobFieldCategoryPk(jobPostingDto.getJob_field_category_pk());
				
				Map<String, Object> jobPostingMap = new HashMap<>();
				
				String str = companyDto.getCom_address();
				
				if (str.length() >= 2) {
					companyDto.setCom_address(str.substring(0, 2));
				} else {
					
				}
				
				List<Integer> postingDeadlineList = postingSqlMapper.selectPostingDeadline();
				List<Integer> endPostingList = postingSqlMapper.selectEndPosting();
				
				jobPostingMap.put("companyDto", companyDto);
				jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
				jobPostingMap.put("jobPostingDto",jobPostingDto);
				jobPostingMap.put("postingDeadlineList", postingDeadlineList);
				jobPostingMap.put("endPostingList", endPostingList);
				
				companypostingList.add(jobPostingMap);
				
			}
			
			return companypostingList;
	}
	
	// 상세리스트
	public Map<String, Object> getJobPostingDetail(int job_posting_pk){
		
		
		JobPostingDto jobPostingDto = postingSqlMapper.selectPostingDetailByJobPostingPk(job_posting_pk);
		
		CompanyDto companyDto = postingSqlMapper.selectByCompanyPk(jobPostingDto.getCom_pk());
		JobFieldCategoryDto jobFieldCategoryDto = postingSqlMapper.selectByJobFieldCategoryPk(jobPostingDto.getJob_field_category_pk());
		CompanyManagerDto companyManagerDto = postingSqlMapper.selectByComManagerPk(companyDto.getCom_manager_pk());
		ComScaleCategoryDto comScaleCategoryDto = postingSqlMapper.selectByComScaleCategoryPk(companyDto.getCom_scale_category_pk());
				
		
		Map<String, Object> jobPostingMap = new HashMap<>();
		
		String str = companyDto.getCom_address();
		if (str.length() >= 2) {
			companyDto.setCom_address(str.substring(0, 2));
		} 
		
		
		// 채용마감 디데이
		int deadlineDDay = postingSqlMapper.selectPostingDeadlineDDay(job_posting_pk);
	
		// 채용마감
		List<Integer> endPostingList = postingSqlMapper.selectEndPosting();
		// 마감임박
		List<Integer> postingDeadlineList = postingSqlMapper.selectPostingDeadline();
		
		
		jobPostingMap.put("companyDto", companyDto);
		jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
		jobPostingMap.put("jobPostingDto",jobPostingDto);
		jobPostingMap.put("companyManagerDto", companyManagerDto);
		jobPostingMap.put("comScaleCategoryDto", comScaleCategoryDto);
		jobPostingMap.put("postingDeadlineList", postingDeadlineList);
		jobPostingMap.put("endPostingList", endPostingList);
		jobPostingMap.put("deadlineDDay", deadlineDDay);
		
			
		return jobPostingMap;
	}
	
	// 채용공고 삭제
	public void removeJobPosting(int job_posting_pk) {
		postingSqlMapper.deleteJobPostingByJobPostingPk(job_posting_pk);
	}
	
	// 채용공고 수정
	public void modifyJobPosting(JobPostingDto jobPostingDto) {
		postingSqlMapper.updateJobPostingInfo(jobPostingDto);
	}
	
	
	
	
	
	
	
	
	// 학생용 채용공고 리스트(관심공고 대비해서 따로 만듦)
	public List<Map<String, Object>> getPostingListForStudent(){
		
		List<Map<String, Object>> postingList = new ArrayList<>();
		
		List<JobPostingDto> jobPostingDtoList = postingSqlMapper.selectPostingList();
		
		for(JobPostingDto jobPostingDto : jobPostingDtoList) {
			
			CompanyDto companyDto = postingSqlMapper.selectByCompanyPk(jobPostingDto.getCom_pk());
			JobFieldCategoryDto jobFieldCategoryDto = postingSqlMapper.selectByJobFieldCategoryPk(jobPostingDto.getJob_field_category_pk());
			
			Map<String, Object> jobPostingMap = new HashMap<>();
			
			String str = companyDto.getCom_address();
			
			if (str.length() >= 2) {
				companyDto.setCom_address(str.substring(0, 2));
			} else {
				
			}
			
			List<Integer> postingDeadlineList = postingSqlMapper.selectPostingDeadline();
			List<Integer> endPostingList = postingSqlMapper.selectEndPosting();
			
			jobPostingMap.put("companyDto", companyDto);
			jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
			jobPostingMap.put("jobPostingDto",jobPostingDto);
			jobPostingMap.put("postingDeadlineList", postingDeadlineList);
			jobPostingMap.put("endPostingList", endPostingList);
			
			postingList.add(jobPostingMap);
			
		}
		
		return postingList;
	}
	
	// 학생용 기업별 공고 리스트(관심공고 대비 이하 생략)
	public List<Map<String, Object>> getCompanyPostingListForStudent(int com_pk){
		
		List<Map<String, Object>> companypostingList = new ArrayList<>();
		
		List<JobPostingDto> companyPostingDtoList = postingSqlMapper.selectPostingListByComPk(com_pk);
		
		for(JobPostingDto jobPostingDto : companyPostingDtoList) {
			

			CompanyDto companyDto = postingSqlMapper.selectByCompanyPk(jobPostingDto.getCom_pk());
			JobFieldCategoryDto jobFieldCategoryDto = postingSqlMapper.selectByJobFieldCategoryPk(jobPostingDto.getJob_field_category_pk());
			
			Map<String, Object> jobPostingMap = new HashMap<>();
			
			String str = companyDto.getCom_address();
			
			if (str.length() >= 2) {
				companyDto.setCom_address(str.substring(0, 2));
			} else {
				
			}
			
			List<Integer> postingDeadlineList = postingSqlMapper.selectPostingDeadline();
			List<Integer> endPostingList = postingSqlMapper.selectEndPosting();
			
			jobPostingMap.put("companyDto", companyDto);
			jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
			jobPostingMap.put("jobPostingDto",jobPostingDto);
			jobPostingMap.put("postingDeadlineList", postingDeadlineList);
			jobPostingMap.put("endPostingList", endPostingList);
			
			companypostingList.add(jobPostingMap);
			
		}
		
		return companypostingList;
	}
	
}

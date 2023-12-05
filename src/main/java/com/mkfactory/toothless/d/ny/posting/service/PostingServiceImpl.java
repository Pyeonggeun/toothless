package com.mkfactory.toothless.d.ny.posting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.CompanyDto;
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
			
			jobPostingMap.put("companyDto", companyDto);
			jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
			jobPostingMap.put("jobPostingDto",jobPostingDto);
			jobPostingMap.put("postingDeadlineList", postingDeadlineList);
			
			
			postingList.add(jobPostingMap);
		}
		
		return postingList;
	}
	// 기업별 공고 개수
//	public int getCompanyPostingCount(int com_pk) {
//		return postingSqlMapper.selectPostingCount(com_pk);
//	}
}

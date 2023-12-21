package com.mkfactory.toothless.d.ny.posting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.d.dto.ComScaleCategoryDto;
import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.dto.InterestPostingDto;
import com.mkfactory.toothless.d.dto.JobFieldCategoryDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.ny.posting.mapper.PostingSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.GraduationInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class PostingServiceImpl {
	
	@Autowired
	private PostingSqlMapper postingSqlMapper;
	
	
	//교직원
	
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
		
		int jobPostingPk = postingSqlMapper.createJobPostingPk();
		jobPostingDto.setJob_posting_pk(jobPostingPk);
		
		
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
	public List<Map<String, Object>> getPostingList(String searchType, String searchWord){
		
		List<Map<String, Object>> postingList = new ArrayList<>();
		
		List<JobPostingDto> jobPostingDtoList = postingSqlMapper.selectPostingList(searchType, searchWord);
		
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
	
	// 기업별 공고 리스트(기업용으로도 사용)
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
				
				
				// 총 공고찜 수(공고별)
				int allPostingInterest = postingSqlMapper.selectAllInterestPosting(jobPostingDto.getJob_posting_pk());
				
				jobPostingMap.put("companyDto", companyDto);
				jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
				jobPostingMap.put("jobPostingDto",jobPostingDto);
				jobPostingMap.put("postingDeadlineList", postingDeadlineList);
				jobPostingMap.put("endPostingList", endPostingList);
				jobPostingMap.put("allPostingInterest", allPostingInterest);

				
				
				companypostingList.add(jobPostingMap);
				
			}
			
			return companypostingList;
	}

	
	// 교직원용 공고 상세리스트(기업용 공고 상세 페이지)
	public Map<String, Object> getJobPostingDetail(int job_posting_pk, boolean escape){
		
		
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
		
		// 채용마감
		List<Integer> endPostingList = postingSqlMapper.selectEndPosting();
		
		// 마감임박
		List<Integer> postingDeadlineList = postingSqlMapper.selectPostingDeadline();
		
		int allPostingInterest = postingSqlMapper.selectAllInterestPosting(job_posting_pk);
		
		
		// 채용마감 디데이
		if (postingDeadlineList.contains(job_posting_pk) && ! endPostingList.contains(job_posting_pk)) {
		    int deadlineDDay = postingSqlMapper.selectPostingDeadlineDDay(job_posting_pk);
		    
		    	jobPostingMap.put("deadlineDDay", deadlineDDay);
		}
		
		
		if(escape) {
			
			String postingContents = jobPostingDto.getPosting_contents();
			
			if (postingContents != null) {
		      postingContents = StringEscapeUtils.escapeHtml4(postingContents);
		      
		      postingContents = postingContents.replaceAll("<","&lt;");
		      postingContents = postingContents.replaceAll(">", "&gt;");
		      postingContents = postingContents.replaceAll("\n", "<br>");
		      
		      jobPostingDto.setPosting_contents(postingContents);
			}
		
		      String postingPreference = jobPostingDto.getPreference();
		
		      if(postingPreference != null) {
		    	  
		    	  postingPreference = StringEscapeUtils.escapeHtml4(postingPreference);
		          
		    	  postingPreference = postingPreference.replaceAll("<","&lt;");
		    	  postingPreference = postingPreference.replaceAll(">", "&gt;");
		    	  postingPreference = postingPreference.replaceAll("\n", "<br>");
			      
		    	  jobPostingDto.setPreference(postingPreference);
		    	  
		      }
		}
 	
		
		jobPostingMap.put("companyDto", companyDto);
		jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
		jobPostingMap.put("jobPostingDto",jobPostingDto);
		jobPostingMap.put("companyManagerDto", companyManagerDto);
		jobPostingMap.put("comScaleCategoryDto", comScaleCategoryDto);
		jobPostingMap.put("postingDeadlineList", postingDeadlineList);
		jobPostingMap.put("endPostingList", endPostingList);
		jobPostingMap.put("allPostingInterest", allPostingInterest);
		
		
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
	
	
	
	
	
	// 학생
	
	// 학생용 채용공고 리스트(관심공고 정보 추가)
	public List<Map<String, Object>> getPostingListForStudent(int student_pk, String searchType, String searchWord){
		
		List<Map<String, Object>> postingList = new ArrayList<>();
		
		List<JobPostingDto> jobPostingDtoList = postingSqlMapper.selectPostingList(searchType, searchWord);
		
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
			
			// 관심기업
			List<Integer> interestCompany = postingSqlMapper.selectInterestCompanyByStudentPk(student_pk);
			// 지원자
			List<Integer> myApplyPostingList = postingSqlMapper.selectMyApplyByStudentPk(student_pk);
			
			InterestPostingDto interestPostingDto = new InterestPostingDto();
			interestPostingDto.setJob_posting_pk(jobPostingDto.getJob_posting_pk());
			interestPostingDto.setStudent_pk(student_pk);
			
			int checkInterestPosting = postingSqlMapper.selectMyPostingInterestCount(interestPostingDto);
			int allPostingInterest = postingSqlMapper.selectAllInterestPosting(jobPostingDto.getJob_posting_pk());
			
			
			jobPostingMap.put("companyDto", companyDto);
			jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
			jobPostingMap.put("jobPostingDto",jobPostingDto);
			jobPostingMap.put("postingDeadlineList", postingDeadlineList);
			jobPostingMap.put("endPostingList", endPostingList);
			jobPostingMap.put("allPostingInterest", allPostingInterest);
			jobPostingMap.put("interestCompany", interestCompany);
			jobPostingMap.put("myApplyPostingList", myApplyPostingList);
			jobPostingMap.put("checkInterestPosting", checkInterestPosting);
			
			
			postingList.add(jobPostingMap);
			
		}
		
		return postingList;
	}
	
	
	// 학생용 공고 상세 페이지
	public Map<String, Object> getJobPostingDetailForStudentAndCompany(int student_pk, int job_posting_pk, boolean escape){
		
		
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
		
		// 채용마감
		List<Integer> endPostingList = postingSqlMapper.selectEndPosting();
		
		// 마감임박
		List<Integer> postingDeadlineList = postingSqlMapper.selectPostingDeadline();
		
		// 채용마감 디데이
		if (postingDeadlineList.contains(job_posting_pk) && ! endPostingList.contains(job_posting_pk)) {
		    int deadlineDDay = postingSqlMapper.selectPostingDeadlineDDay(job_posting_pk);
		    
		    	jobPostingMap.put("deadlineDDay", deadlineDDay);
		}
			
		List<Integer> myApplyPostingList = postingSqlMapper.selectMyApplyByStudentPk(student_pk);
		List<Integer> interestCompany = postingSqlMapper.selectInterestCompanyByStudentPk(student_pk);
		
		int allPostingInterest = postingSqlMapper.selectAllInterestPosting(job_posting_pk);
		
		
		if(escape) {
			
			String postingContents = jobPostingDto.getPosting_contents();
			
			if (postingContents != null) {
		      postingContents = StringEscapeUtils.escapeHtml4(postingContents);
		  
		      postingContents = postingContents.replaceAll("<","&lt;");
		      postingContents = postingContents.replaceAll(">", "&gt;");
		      postingContents = postingContents.replaceAll("\n", "<br>");
		      
		      jobPostingDto.setPosting_contents(postingContents);
			}
		
		      String postingPreference = jobPostingDto.getPreference();
		
		      if(postingPreference != null) {
		    	  
		    	  postingPreference = StringEscapeUtils.escapeHtml4(postingPreference);
		          
		    	  postingPreference = postingPreference.replaceAll("<","&lt;");
		    	  postingPreference = postingPreference.replaceAll(">", "&gt;");
		    	  postingPreference = postingPreference.replaceAll("\n", "<br>");
			      
		    	  jobPostingDto.setPreference(postingPreference);
		    	  
		      }
		}
		

		
		
		jobPostingMap.put("companyDto", companyDto);
		jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
		jobPostingMap.put("jobPostingDto",jobPostingDto);
		jobPostingMap.put("companyManagerDto", companyManagerDto);
		jobPostingMap.put("comScaleCategoryDto", comScaleCategoryDto);
		jobPostingMap.put("postingDeadlineList", postingDeadlineList);
		jobPostingMap.put("endPostingList", endPostingList);
		jobPostingMap.put("allPostingInterest", allPostingInterest);
		jobPostingMap.put("myApplyPostingList",myApplyPostingList);
		jobPostingMap.put("interestCompany", interestCompany);
		
			
		return jobPostingMap;
	}
	
	// 마이페이지 메인용 관심공고 리스트(채용마감순 4개 컷)
	public List<Map<String, Object>> getInterestPostingListForMyPage(int student_pk){
		
		List<Map<String, Object>> postingList = new ArrayList<>();
		
		List<JobPostingDto> jobPostingDtoList = postingSqlMapper.selectInterestPostingListForMyPage(student_pk);
		
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

	// 학생 관심공고 총 리스트(관심공고 수 포함)
	public List<Map<String, Object>> getInterestPostingTotalList(int student_pk){
		
		List<Map<String, Object>> postingList = new ArrayList<>();
		
		List<JobPostingDto> jobPostingDtoList = postingSqlMapper.selectTotalInterestPostingList(student_pk);
		
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
			List<Integer> interestCompany = postingSqlMapper.selectInterestCompanyByStudentPk(student_pk);
			List<Integer> myApplyPostingList = postingSqlMapper.selectMyApplyByStudentPk(student_pk);
			
			
			jobPostingMap.put("companyDto", companyDto);
			jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
			jobPostingMap.put("jobPostingDto",jobPostingDto);
			jobPostingMap.put("postingDeadlineList", postingDeadlineList);
			jobPostingMap.put("endPostingList", endPostingList);
			jobPostingMap.put("interestCompany", interestCompany);
			jobPostingMap.put("myApplyPostingList", myApplyPostingList);
			
			postingList.add(jobPostingMap);
			
		}
		
		return postingList;
	} 
	
	// 총 관심공고 수(List안에 넣는 방법 생각해보기)
	public int getTotalInterestPostingCount(int student_pk) {
		return postingSqlMapper.selectTotalInterestPostingCount(student_pk);
	}
	
	// 기업
	
	// 기업 + 외부인
	public CompanyDto getCompanyPkFromExternalPk(int external_pk) {
		return postingSqlMapper.selectByExternalPk(external_pk);
	}
	
	
	
	// 공고스크랩 추가
	public void plusInterestPosting(InterestPostingDto interestPostingDto) {
		postingSqlMapper.insertInterestPosting(interestPostingDto);
	}
	
	// 공고스크랩 삭제
	public void minusInterestPosting(InterestPostingDto intesePostingDto) {
		postingSqlMapper.deleteInterestPosting(intesePostingDto);
	}
	
	// 공고스크랩 했던가..?(restAPI용)
//	public boolean isMyPostingInterestCount(InterestPostingDto interestPostingDto) {
//		return postingSqlMapper.selectMyPostingInterestCount(interestPostingDto) > 0 ? true : false;
//	}
	// 공고스크랩 했던가..?
	public int checkMyPostingInterestCount(InterestPostingDto interestPostingDto) {
		return postingSqlMapper.selectMyPostingInterestCount(interestPostingDto);
	}
	
	// 총 공고 스크랩 수
	public int allPostingInterest (int job_posting_pk) {
		return postingSqlMapper.selectAllInterestPosting(job_posting_pk); 
	}
	
	
	// 공고별 스크랩한 학생 리스트
	public List<Map<String, Object>> getStudentListByPostingInterest(int job_posting_pk){
		
		List<Map<String, Object>> interestStudentList = new ArrayList<>();
		
		List<StudentInfoDto> studentInfoDtoList = postingSqlMapper.selectStudentInterestList(job_posting_pk);
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			
			List<Integer> graduationInfoDtoList = postingSqlMapper.selectGraduationList();
			
			Map<String, Object> interestStudentMap = new HashMap<>();
			
			interestStudentMap.put("studentInfoDto", studentInfoDto);
			interestStudentMap.put("graduationInfoDtoList", graduationInfoDtoList);
			
			interestStudentList.add(interestStudentMap);
			
		}
		return interestStudentList;
	}
	
	// 메인페이지용 기업별 공고리스트(마감임박 + 지원자 많은 순)
	public List<Map<String, Object>> getPostingListForCompanyMainPage(int com_pk){
		
		List<Map<String, Object>> companypostingList = new ArrayList<>();
		
		List<JobPostingDto> companyPostingDtoList = postingSqlMapper.selectPostingListForCompanyMainPage(com_pk);
		
		
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
			
			// 총 공고스크랩 수(공고별)
			int allPostingInterest = postingSqlMapper.selectAllInterestPosting(jobPostingDto.getJob_posting_pk());
			
			jobPostingMap.put("companyDto", companyDto);
			jobPostingMap.put("jobFieldCategoryDto", jobFieldCategoryDto);
			jobPostingMap.put("jobPostingDto",jobPostingDto);
			jobPostingMap.put("postingDeadlineList", postingDeadlineList);
			jobPostingMap.put("endPostingList", endPostingList);
			jobPostingMap.put("allPostingInterest", allPostingInterest);
			
			companypostingList.add(jobPostingMap);
			
		}
		
		return companypostingList;
		
	}
	
	// 공고별 지원한 학생 리스트
	public List<Map<String, Object>> getApplyStudentList(int job_posting_pk){
		
		List<Map<String, Object>> interestStudentList = new ArrayList<>();
		
		List<StudentInfoDto> studentInfoDtoList = postingSqlMapper.selectApplyStudentList(job_posting_pk);
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			
			List<Integer> graduationInfoDtoList = postingSqlMapper.selectGraduationList();
			
			Map<String, Object> interestStudentMap = new HashMap<>();
			
			interestStudentMap.put("studentInfoDto", studentInfoDto);
			interestStudentMap.put("graduationInfoDtoList", graduationInfoDtoList);
			
			interestStudentList.add(interestStudentMap);
			
		}
		return interestStudentList;
	}
	
	
	// 기업 메인페이지용 지원 학생 리스트
	public List<Map<String, Object>> getApplyListForCompanyMainPage(int com_pk){
		
		List<Map<String, Object>> applyStudentList = new ArrayList<>();
		
		List<StudentInfoDto> studentInfoDtoList = postingSqlMapper.selectApplyStudentListForCompany(com_pk);
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			
			List<Integer> graduationInfoDtoList = postingSqlMapper.selectGraduationList();
			
			Map<String, Object> applyStudentMap = new HashMap<>();
			
			applyStudentMap.put("studentInfoDto", studentInfoDto);
			applyStudentMap.put("graduationInfoDtoList", graduationInfoDtoList);
			
			applyStudentList.add(applyStudentMap);
			
		}
		return applyStudentList;
	
	}
	
	// 기업 메인페이지용 관심 기업 학생 리스트
	public List<Map<String, Object>> getInterestCompanyListForMainPage(int com_pk){
		
		List<Map<String, Object>> interestCompanyList = new ArrayList<>();
		
		List<StudentInfoDto> studentInfoDtoList = postingSqlMapper.selectMyCompanyInterestStudentList(com_pk);
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			
			List<Integer> graduationInfoDtoList = postingSqlMapper.selectGraduationList();
			
			Map<String, Object> interestCompanyMap = new HashMap<>();
			
			interestCompanyMap.put("studentInfoDto", studentInfoDto);
			interestCompanyMap.put("graduationInfoDtoList", graduationInfoDtoList);
			
			interestCompanyList.add(interestCompanyMap);
			
		}
		return interestCompanyList;
		
	}
	
	// 관심기업 리스트
	public List<Map<String, Object>> getInterestCompanyTotalList(int com_pk){
		
			List<Map<String, Object>> interestCompanyTotalList = new ArrayList<>();
		
		List<StudentInfoDto> studentInfoDtoList = postingSqlMapper.selectMyCompanyInterestTotalList(com_pk);
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			
			List<Integer> graduationInfoDtoList = postingSqlMapper.selectGraduationList();
			
			Map<String, Object> interestCompanyTotalMap = new HashMap<>();
			
			interestCompanyTotalMap.put("studentInfoDto", studentInfoDto);
			interestCompanyTotalMap.put("graduationInfoDtoList", graduationInfoDtoList);
			
			interestCompanyTotalList.add(interestCompanyTotalMap);
			
		}
		return interestCompanyTotalList;
	}
	
	// 기업 지원한 학생 총 리스트
	public List<Map<String, Object>> getApplyStudentTotalList(int com_pk){
		
		List<Map<String, Object>> alpplyStudentTotalList = new ArrayList<>();
		
		List<StudentInfoDto> studentInfoDtoList = postingSqlMapper.selectApplyStudentTotalList(com_pk);
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			
			List<Integer> graduationInfoDtoList = postingSqlMapper.selectGraduationList();
			
			Map<String, Object> applyStudentTotalMap = new HashMap<>();
			
			
			applyStudentTotalMap.put("studentInfoDto", studentInfoDto);
			applyStudentTotalMap.put("graduationInfoDtoList", graduationInfoDtoList);
			
			alpplyStudentTotalList.add(applyStudentTotalMap);
			
		}
		return alpplyStudentTotalList;
	}
	
	// 학생 + 학과 
	public String getStudentDepartmentName(int department_pk) {
		return postingSqlMapper.selectByDepartmentPk(department_pk);
	}
	
	// 지원한 학생 리스트
	public List<Integer> getStudentApplyList(int student_pk){
		return postingSqlMapper.selectMyApplyByStudentPk(student_pk);
	}
	
	// 학생별 관심기업 리스트
	public List<Integer> getStudentInterestCompanyList(int student_pk){
		return postingSqlMapper.selectInterestCompanyByStudentPk(student_pk);
	}
	
}

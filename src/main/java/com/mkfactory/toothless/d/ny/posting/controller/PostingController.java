package com.mkfactory.toothless.d.ny.posting.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.d.dto.CompanyDto;
import com.mkfactory.toothless.d.dto.InterestCompanyDto;
import com.mkfactory.toothless.d.dto.InterestPostingDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.gw.company.service.CompanyServiceIpml;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/ny_posting/*")
public class PostingController {
	
	@Autowired
	private PostingServiceImpl postingService;
	
	@Autowired
	private CompanyServiceIpml companyService;
	
	
	// 교직원
	
	// 채용공고 등록 페이지
	@RequestMapping("registerJobPostingPage")
	public String registerJobPostingPage(HttpSession session, Model model) {
		
		StaffInfoDto staffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfo == null) {
			return "redirect:../../another/staff/loginPage";
			
		}
		
		model.addAttribute("jobFieldCategory", postingService.getJobFieldCategoryList());
		return "tl_d/ny_posting/registerJobPostingPage";
	}
	
	// 채용공고 등록 프로세스
	@RequestMapping("registerJobPostingProcess")
	public String registerJobPostingProcess(
			HttpSession session, JobPostingDto params, 
			CompanyDto param, MultipartFile imageFile) {
		
		// 교직원 pk 입력
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfoDto != null) {
			int staffPk = staffInfoDto.getStaff_pk();
			params.setStaff_pk(staffPk);		
		}
		
		// 이미지 입력
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd/");
		
		if(imageFile != null && !imageFile.isEmpty()) {
			
			String imageRootPath = "C:/Workspace/GitWorkspace/toothless/src/main/webapp/resources/img/employment/";
			String imageTodayPath = sdf.format(new Date());
			
			File todayFolderForCreate = new File(imageRootPath + imageTodayPath);
			
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs();
			}
			
			String originalFileName = imageFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			String fileName = uuid + "_" + currentTime;
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			fileName += ext;
			
			try {
				imageFile.transferTo(new File(imageRootPath + imageTodayPath + fileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			params.setPosting_mainimage(imageTodayPath + fileName);
					
		}
		
		// 회사 pk 입력
		List<CompanyDto> companyDtoList = postingService.getCompanyList();
		
		boolean businessNumberMatched = false;
		
		// 사업자 번호 찾기
		for (CompanyDto companyDto : companyDtoList) {
		    if (companyDto.getBusiness_number().equals(param.getBusiness_number())) {
		        int comPk = postingService.getComPkByBusinessNumber(param.getBusiness_number());
		        params.setCom_pk(comPk);
		        businessNumberMatched = true;
		        break;  // 일치하는 것을 찾았으므로 반복문 종료
		    }
		}

		if (businessNumberMatched) {
			postingService.registerJobPostingInfo(params);
		    return "redirect:./registerJobPostingPage";
		} else {
		    return "tl_d/ny_posting/registerJobPostingFail";
		}
				 
	}
	
	// 채용공고 등록 완료
	@RequestMapping("registerJobPostingSuccess")
	public String registerJobPostingSuccess() {
		
		return "tl_d/ny_posting/registerJobPostingSuccess";
	}
	
	// 채용공고 리스트 페이지
	@RequestMapping("jobPostingListPage")
	public String jobPostingListPage(HttpSession session, Model model, String searchType, String searchWord, String searchPosition) {
		
		StaffInfoDto staffInfo = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfo == null) {
			return "redirect:../../another/staff/loginPage";
		}
			
		model.addAttribute("postingCount", postingService.getPostingCount());
		model.addAttribute("jobPostingList", postingService.getPostingList(searchType, searchWord, searchPosition));
		return "tl_d/ny_posting/jobPostingListPage";
	}
	
	// 기업별 채용공고 리스트 페이지
	@RequestMapping("companyPostingListPage")
	public String companyPostingListPage(Model model, int com_pk) {
		model.addAttribute("companyPostingCount", postingService.getCompanyPostingCount(com_pk));
		model.addAttribute("companyPostingList", postingService.getCompanyPostingList(com_pk));
		return "tl_d/ny_posting/companyPostingListPage";
	}	
	
	// 공고 상세 페이지
	@RequestMapping("jobPostingDetailPage")
	public String jobPostingDetailPage(Model model, int id) {
		
		model.addAttribute("jobPostingDetail", postingService.getJobPostingDetail(id));
		
		return "tl_d/ny_posting/jobPostingDetailPage";
	}
	
	// 채용공고 삭제
	@RequestMapping("removeJobPostingProcess")
	public String removeJobPostingProcess(int id) {
		postingService.removeJobPosting(id);
		return "redirect:./jobPostingListPage";
	}
	@RequestMapping("removeJobPostingProcessForCompany")
	public String removeJobPostingProcessForCompany(int id) {
		postingService.removeJobPosting(id);
		return "redirect:./companyPostingListPage";
	}
	
	// 채용공고 수정
	@RequestMapping("modifyJobPostingPage")
	public String modifyJobPostingPage(Model model, int id) {
		
		model.addAttribute("modifyJobPosting", postingService.getJobPostingDetail(id));
		model.addAttribute("jobFieldCategory", postingService.getJobFieldCategoryList());
		
		
		
		return "tl_d/ny_posting/modifyJobPostingPage";
	}
	
	@RequestMapping("modifyJobPostingProcess")
	public String modifyJobPostingProcess(HttpSession session, JobPostingDto params, MultipartFile modifyimage) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd/");
		
		if(modifyimage != null && !modifyimage.isEmpty()) {
			
			String imageRootPath = "C:/Workspace/GitWorkspace/toothless/src/main/webapp/resources/img/employment/";
			String imageTodayPath = sdf.format(new Date());
			
			File todayFolderForCreate = new File(imageRootPath + imageTodayPath);
			
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs();
			}
			
			String originalFileName = modifyimage.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			String fileName = uuid + "_" + currentTime;
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			fileName += ext;
			
			try {
				modifyimage.transferTo(new File(imageRootPath + imageTodayPath + fileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			params.setPosting_mainimage(imageTodayPath + fileName);
					
		}
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfoDto != null) {
			int staffPk = staffInfoDto.getStaff_pk();
			params.setStaff_pk(staffPk);
		}
		
		postingService.modifyJobPosting(params);
		
		return "redirect:./jobPostingDetailPage?id=" + params.getJob_posting_pk();
	}
	
	
	
	
	
	
	// 학생용
	
	// 학생용 채용공고 리스트
	@RequestMapping("jobPostingListForStudentPage")
	public String jobPostingListForStudentPage(HttpSession session, Model model, InterestCompanyDto params, String searchType, String searchWord, String searchPosition) {
		
		StudentInfoDto studentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfo != null) {
			int studentPk = studentInfo.getStudent_pk();
			model.addAttribute("jobPostingForStudentList", postingService.getPostingListForStudent(studentPk, searchType, searchWord, searchPosition));
		}else {
			return "redirect:../../another/staff/loginPage";
		}
		model.addAttribute("jobFieldList", postingService.getJobFieldCategoryList());
		model.addAttribute("postingCount", postingService.getPostingCount());
		
		
		// 페이징할때 링크 남기는 방법		
        String searchQueryString = "";
		
		// 쿼리 스트링이니까 &붙임
		if(searchType != null && searchWord != null && searchPosition != null && searchPosition != null) {
			searchQueryString += "&searchType=" + searchType;
			searchQueryString += "&searchWord=" + searchWord;
			searchQueryString += "&searchPosition=" + searchPosition;
			
		}
		
		model.addAttribute("searchQueryString", searchQueryString);
		
		// 검색 칸에 검색 내용 띄워 두기 영상확인!
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("searchPosition", searchPosition);

		// 여기서도 찜하는 방법 생각해보기
		
		return "tl_d/ny_posting/jobPostingListForStudentPage";
	}
	
	// 학생용 기업별 공고리스트
	@RequestMapping("companyPostingListForStudentPage")
	public String companyPostingListForStudentPage(HttpSession session, Model model, int com_pk) {
			
		StudentInfoDto studentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfo != null) {
			
			int studentPk = studentInfo.getStudent_pk();
			model.addAttribute("companyPosting",postingService.getStudentApplyList(studentPk));
		}
		
		
		model.addAttribute("companyPostingListForStudent", postingService.getCompanyPostingList(com_pk));
		model.addAttribute("companyPostingCount", postingService.getCompanyPostingCount(com_pk));
		return "tl_d/ny_posting/companyPostingListForStudentPage";
	}
	
	// 학생용 공고 상세 페이지
	@RequestMapping("jobPostingDetailForStudentPage")
	public String jobPostingDetailForStudentPage(HttpSession session, Model model, int id, InterestPostingDto params) {

		
		params.setJob_posting_pk(id);
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			int studentPk = studentInfoDto.getStudent_pk();
			params.setStudent_pk(studentPk);
			model.addAttribute("jobPostingDetailForStudent",
					postingService.getJobPostingDetailForStudentAndCompany(studentPk, id));
			
		}else {
			return "redirect:../../another/staff/loginPage";
		}
		
		model.addAttribute("checkMyInteresting", postingService.checkMyPostingInterestCount(params));
		
		return "tl_d/ny_posting/jobPostingDetailForStudentPage";
	}
	
	// 공고스크랩 프로세스
	@RequestMapping("interestingProcess")
	public String interestingProcess(InterestPostingDto params) {
		
		if(postingService.checkMyPostingInterestCount(params) == 0) {
			postingService.plusInterestPosting(params);
		}else {
			postingService.minusInterestPosting(params);
		}
		return "redirect:./jobPostingDetailForStudentPage?id=" + params.getJob_posting_pk();
		
	}
	
	// 관심공고 총 리스트 페이지
	@RequestMapping("interestPostingListForStudentPage")
	public String interestPostingListForStudentPage(HttpSession session, Model model) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			
			int studentPk = studentInfoDto.getStudent_pk();
			model.addAttribute("totalInterestPostingList", postingService.getInterestPostingTotalList(studentPk));
			model.addAttribute("totalInterestPostingCount", postingService.getTotalInterestPostingCount(studentPk));
		}
		
		return "tl_d/ny_posting/interestPostingListForStudentPage";
	}
	
	
	
	
	
	
	
	
	// 기업용 
	
	// 기업용 공고 리스트
	@RequestMapping("jobPostingListForCompanyPage")
	public String jobPostingListForCompanyPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		
		
		if(externalInfoDto != null) {
			int externalInfoPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalInfoPk);
			
			model.addAttribute("company", companyService.getCompany(companyDto.getCom_pk()));
			model.addAttribute("companyPostingCount", postingService.getCompanyPostingCount(companyDto.getCom_pk()));
			model.addAttribute("companyPostingList", postingService.getCompanyPostingList(companyDto.getCom_pk()));
			
		}else {
			return "redirect:../../another/staff/loginPage";
		}
		model.addAttribute("jobFieldCategory", postingService.getJobFieldCategoryList());
		
		return "tl_d/ny_posting/jobPostingListForCompanyPage";
	}
	
	// 기업용 상세 리스트
	@RequestMapping("jobPostingDetailForCompanyPage")
	public String jobPostingDetailForCompanyPage(HttpSession session, Model model, int id) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalInfoPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalInfoPk);
			
			model.addAttribute("company", companyService.getCompany(companyDto.getCom_pk()));
		}else {
			return "redirect:../../another/staff/loginPage";
		}
		
		// 기업 상세
		model.addAttribute("jobPostingDetailForCompany", postingService.getJobPostingDetail(id));
		
		// 관심공고 학생 리스트
		model.addAttribute("interestStudentList", postingService.getStudentListByPostingInterest(id));
		
		//공고 지원 학생 리스트
		model.addAttribute("applyStudentList", postingService.getApplyStudentList(id));
		
		return "tl_d/ny_posting/jobPostingDetailForCompanyPage";
	}
	
	// 기업 지원자 학생 리스트
	@RequestMapping("myCompanyApplyStudentListPage")
	public String myCompanyApplyStudentListPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalInfoPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalInfoPk);
			
			model.addAttribute("company", companyService.getCompany(companyDto.getCom_pk()));
			model.addAttribute("applyStudentList", postingService.getApplyStudentTotalList(companyDto.getCom_pk()));
			
		} else {
			return "redirect:../../another/staff/loginPage";
		}
		
		return "tl_d/ny_posting/myCompanyApplyStudentListPage";
	}
	
	// 관심기업 학생리스트
	@RequestMapping("myCompanyInterestListPage")
	public String myCompanyInterestListPage(HttpSession session, Model model) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalInfoPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalInfoPk);
			
			model.addAttribute("company", companyService.getCompany(companyDto.getCom_pk()));
			model.addAttribute("interestCompanyTotalList", postingService.getInterestCompanyTotalList(companyDto.getCom_pk()));
			
		}else {
			return "redirect:../../another/staff/loginPage";
		}
		
		return "tl_d/ny_posting/myCompanyInterestListPage";
	}
}

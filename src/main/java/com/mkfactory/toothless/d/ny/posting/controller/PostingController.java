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
import com.mkfactory.toothless.d.dto.InterestPostingDto;
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/ny_posting/*")
public class PostingController {
	
	@Autowired
	private PostingServiceImpl postingService;
	
	
	// 교직원
	
	// 채용공고 등록 페이지
	@RequestMapping("registerJobPostingPage")
	public String registerJobPostingPage(Model model) {
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
	
	// 채용공고 리스트 페이지
	@RequestMapping("jobPostingListPage")
	public String jobPostingListPage(Model model) {
		model.addAttribute("postingCount", postingService.getPostingCount());
		model.addAttribute("jobPostingList", postingService.getPostingList());
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
	public String jobPostingListForStudentPage(Model model) {
		
		model.addAttribute("jopPostingForStudent", postingService.getPostingListForStudent());
		model.addAttribute("postingCount", postingService.getPostingCount());
		
		// 여기서도 찜하는 방법 생각해보기
		
		return "tl_d/ny_posting/jobPostingListForStudentPage";
	}
	
	// 학생용 기업별 공고리스트
	@RequestMapping("companyPostingListForStudentPage")
	public String companyPostingListForStudentPage(Model model, int com_pk) {
		model.addAttribute("companyPostingCount", postingService.getCompanyPostingCount(com_pk));
		model.addAttribute("companyPostingListForStudent", postingService.getCompanyPostingList(com_pk));
		return "tl_d/ny_posting/companyPostingListForStudentPage";
	}
	
	// 학생용 공고 상세 페이지
	@RequestMapping("jobPostingDetailForStudentPage")
	public String jobPostingDetailForStudentPage(HttpSession session, Model model, int id, InterestPostingDto params) {

		model.addAttribute("jobPostingDetailForStudent", postingService.getJobPostingDetailForStudentAndCompany(id));
		
		params.setJob_posting_pk(id);
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			int studentPk = studentInfoDto.getStudent_pk();
			params.setStudent_pk(studentPk);
			
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
	
	
	
	
	
	
	
	
	// 기업용 
	
	// 기업용 공고 리스트
	@RequestMapping("jobPostingListForCompanyPage")
	public String jobPostingListForCompanyPage(Model model, HttpSession session) {
		
		ExternalInfoDto externalInfoDto = (ExternalInfoDto) session.getAttribute("sessionExternalInfo");
		
		if(externalInfoDto != null) {
			int externalInfoPk = externalInfoDto.getExternal_pk();
			
			CompanyDto companyDto = postingService.getCompanyPkFromExternalPk(externalInfoPk);
			
			model.addAttribute("companyPostingCount", postingService.getCompanyPostingCount(companyDto.getCom_pk()));
			model.addAttribute("companyPostingList", postingService.getCompanyPostingList(companyDto.getCom_pk()));
			
		}
		model.addAttribute("jobFieldCategory", postingService.getJobFieldCategoryList());
		
		return "tl_d/ny_posting/jobPostingListForCompanyPage";
	}
	
	// 기업용 상세 리스트
	@RequestMapping("jobPostingDetailForCompanyPage")
	public String jobPostingDetailForCompanyPage(Model model, int id) {
		
		model.addAttribute("jobPostingDetailForCompany", postingService.getJobPostingDetailForStudentAndCompany(id));
		model.addAttribute("interestStudentList", postingService.getStudentListByPostingInterest(id));
		
		
		return "tl_d/ny_posting/jobPostingDetailForCompanyPage";
	}
	
	
}

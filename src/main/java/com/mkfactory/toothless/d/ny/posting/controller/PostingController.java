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
import com.mkfactory.toothless.d.dto.JobPostingDto;
import com.mkfactory.toothless.d.ny.posting.service.PostingServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/ny_posting/*")
public class PostingController {
	
	@Autowired
	private PostingServiceImpl postingService;
	
	// 채용공고 등록 페이지
	@RequestMapping("registerJobPostingPage")
	public String registerJobPostingPage(Model model) {
		model.addAttribute("jobFieldCategory", postingService.getJobFieldCategoryList());
		return "/tl_d/ny_posting/registerJobPostingPage";
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
		
		if(imageFile != null && !imageFile.isEmpty()) {
			
			String imageRootPath = "C:/uploadMainFile/";
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
		    return "/tl_d/ny_posting/registerJobPostingFail";
		}
				 
	}
	
	// 채용공고 리스트 페이지
	@RequestMapping("jobPostingListPage")
	public String jobPostingListPage(Model model) {
		model.addAttribute("postingCount", postingService.getPostingCount());
		model.addAttribute("jobPostingList", postingService.getPostingList());
		return "/tl_d/ny_posting/jobPostingListPage";
	}
	
	// 기업별 채용공고 리스트 페이지
	@RequestMapping("companyPostingListPage")
	public String companyPostingListPage(Model model, int com_pk) {
		// model.addAttribute("companyPostingCount", postingService.getCompanyPostingCount(com_pk));
		return "/tl_d/ny_posting/companyPostingListPage";
	}	
	

}

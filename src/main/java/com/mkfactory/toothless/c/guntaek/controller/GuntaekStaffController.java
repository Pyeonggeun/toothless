package com.mkfactory.toothless.c.guntaek.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.c.dto.AjdksInternEduApplying;
import com.mkfactory.toothless.c.dto.AjdksInternEduProgramDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduReviewDto;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStaffServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_c/guntaek/staff/*")
public class GuntaekStaffController {

	@Autowired
	GuntaekStaffServiceImpl guntaekStaffService;
	
	
	@RequestMapping("ajdksStaffMainPage")
	public String ajdksStaffMainPage() {
		
		return "../../woojae/staff/ajdksStaffMainPage";
	}
	
	@RequestMapping("ajdksRegisterProgram")
	public String ajdksRegisterProgram(HttpSession session, Model model) {
		StaffInfoDto staffDto = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		
		model.addAttribute("staffDto",staffDto);
		
		return "tl_c/guntaek/staff/ajdksRegisterProgram";
	}
	@RequestMapping("ajdksRegisterProgramProcess")
	public String ajdksRegisterProgramPosterImageProcess(AjdksInternEduProgramDto eduProgramDto, MultipartFile imageLink,
			HttpSession session) {
		
			StaffInfoDto staffDto = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
			eduProgramDto.setStaff_pk(staffDto.getStaff_pk());
			
			if(imageLink != null) {
				String rootPath = "C:/Git_imageFile/";	
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
				String todayPath = sdf.format(new Date());
					
				File todayFolderForCreate = new File(rootPath + todayPath);
				if(!todayFolderForCreate.exists()) {
					todayFolderForCreate.mkdirs();
				}
				String originalMainFileName = imageLink.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				String fileName = uuid + "_" + currentTime;
				String ext = originalMainFileName.substring(originalMainFileName.lastIndexOf("."));
				fileName += ext;
				try {
					imageLink.transferTo(new File(rootPath + todayPath + fileName));					
				}catch(Exception e) {
					e.printStackTrace();
				}
				eduProgramDto.setPoster_image(todayPath + fileName);
		}
				guntaekStaffService.registerEduProgram(eduProgramDto);
				return "redirect:./ajdksRegisterProgramComplete";
	}


	@RequestMapping("ajdksRegisterProgramComplete")
	public String ajdksRegisterProgramComplete() {
		return "tl_c/guntaek/staff/ajdksRegisterProgramComplete";
	}
	
	// 교육 프로그램 조회 포워딩
	@RequestMapping("ajdksInquiryProgram")
	public String ajdksInquiryProgram(HttpSession session, Model model) {
		
		StaffInfoDto staffDto = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		
		
			
		List<Map<String,Object>> list = guntaekStaffService.getListEduProgramAll();
		
		model.addAttribute("list",list);
		
		return "tl_c/guntaek/staff/ajdksInquiryProgram";
	}
	
	// 담당자의 게시글 디테일하게 조회하기
	@RequestMapping("ajdksDetailInquiryProgram")
	public String ajdksDetailInquiryProgram(Model model,int internedu_program_pk, HttpSession session) {
		StaffInfoDto loginstaffDto = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		int staffPk = loginstaffDto.getStaff_pk(); // 현재 로그인 한 담당자 키
		
		// 일단 프로그램 pk를 통해 현재 프로그램 dto를 얻어와야한다.
		AjdksInternEduProgramDto EduDto = guntaekStaffService.getEduDto(internedu_program_pk);
		
		// checkStaff 라는 map에다가 
		Map<String,Object> checkStaff = new HashMap<>();
		checkStaff.put("eduStaffKey", EduDto.getStaff_pk());
		checkStaff.put("loginStaffKey", staffPk);
		// 현재 로그인한 스태프키랑, 교육 스태프 키를 map으로 보내주겠다.
		model.addAttribute("checkStaff", checkStaff);
		// 현재 로그인 한 담당자 키와 교육 프로그램의 담당자 키와 같다면? 삭제 권한을 줄 수 있게 두개의 키를 전송하겠다.
		model.addAttribute("EduDto",guntaekStaffService.getEduDto(internedu_program_pk));	
		return "tl_c/guntaek/staff/ajdksDetailInquiryProgram";
	}
	
	// 특정 게시글 삭제 (담당자)
	@RequestMapping("delteProgramProcess")
	public String delteProgram(int internedu_program_pk) {

		
		
		guntaekStaffService.deleteProgramByStaff(internedu_program_pk);
		
		return "redirect:./ajdksInquiryProgram";
	}
	
	// 로그인한 작성자가 등록한 프로그램만 볼수 있게 하는 페이지이며, 링크를 클릭하면 학생들의 이수내역 관리 가능. 
	@RequestMapping("ajdksManageProgram")
	public String ajdksManageProgram(HttpSession session, Model model) {
		
		StaffInfoDto loginstaffDto = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		// 현재 로그인한 StaffDto
		int staffPk = loginstaffDto.getStaff_pk();
		
		// 로그인한 담당자의 교육 프로그램 리스트
		List<AjdksInternEduProgramDto> EduListByStaff = guntaekStaffService.getEduProgramByStaff(staffPk);
		model.addAttribute("EduListByStaff",EduListByStaff);
		
		return "tl_c/guntaek/staff/ajdksManageProgram";

	}

	
	
	// 로그인한 담당자가 학생 이수내역 관리 (Only 자기 프로그램만)
	@RequestMapping("ajdksDetailManageProgram")
	public String ajdksDetailManageProgram(Model model,int internedu_program_pk, HttpSession session) {
		StaffInfoDto loginstaffDto = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		

		List<Map<String,Object>> myStudentApplyList= guntaekStaffService.getEduProgramAppStudentList(internedu_program_pk);
		
		model.addAttribute("myStudentApplyList", myStudentApplyList);
		model.addAttribute("internedu_program_pk",internedu_program_pk);
		
		// 현재 프로그램 Dto 넘기기
		model.addAttribute("programDto", guntaekStaffService.getEduDto(internedu_program_pk));
		
		
		return "tl_c/guntaek/staff/ajdksDetailManageProgram";
	}
	
	
	// 학생 수료로 바꿔주기 (가능한 토글로...)
	@RequestMapping("ajdksChangeCompletion")
	public String ajdksChangeCompletion(AjdksInternEduApplying eduApply) {
		
		int program_pk = eduApply.getInternedu_program_pk();
		
	
		System.out.println(program_pk);
		System.out.println(eduApply.getStudent_pk());
		
		
		// 이제 업데이트만 해주면 된다.
		guntaekStaffService.updateInternEduComplete(eduApply);
		
		// 리 다이렉트 + 쿼리스트링 (현재 상세 페이지로 다시 갈 수 있게. 
		return "redirect:./ajdksDetailManageProgram?internedu_program_pk="+program_pk; 	
	} 
	

	// 담당자의 리뷰 관리하는 페이지 일렬로 자기가 등록한 프로그램 리스트를 볼 수 있고, 거기에 해당하는 리뷰들을 쫙 볼 수 있다.
	// 학생은 알 수 없게 
	@RequestMapping("ajdksShowProgramReview")
	public String ajdksManageProgramReview(HttpSession session, Model model) {
		
		StaffInfoDto loginstaffDto = (StaffInfoDto) session.getAttribute("sessionStaffInfo");
		// 현재 로그인한 StaffDto
		int staffPk = loginstaffDto.getStaff_pk();
		
		List<Map<String,Object>> list = guntaekStaffService.getEduDtoWithRating(staffPk);
		
		model.addAttribute("List",list);
		
		return "tl_c/guntaek/staff/ajdksShowProgramReview";
	}
	
	
	@RequestMapping("ajdksManageProgramReview")
	public String ajdksManageProgramReview(Model model,int internedu_program_pk, HttpSession session) {
		
		// 특정 프로그램에 대한 정보를 얻고
		// 이미지, 타이틀만 출력
		model.addAttribute("ProgramDto",guntaekStaffService.getEduDto(internedu_program_pk));
		
		// 특정 프로그램에 대해 교육 이수 + 리뷰 등록한 사람들의 Dto 리스트를 얻어온다. (댓글 형식으로 보이게)
		
		List<AjdksInternEduReviewDto> reviewList = guntaekStaffService.getReviewDtoListByProgramPk(internedu_program_pk);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("internedu_program_pk",internedu_program_pk);
		
		
		return "tl_c/guntaek/staff/ajdksManageProgramReview";
	}
	
	@RequestMapping("ajdksDeleteProgramReview")
	public String ajdksDeleteProgramReview(int internedu_review_pk, AjdksInternEduProgramDto a) {
		
		
		// 특정 리뷰 삭제
		guntaekStaffService.deleteProgramReview(internedu_review_pk);
		
		return "redirect:./ajdksManageProgramReview?internedu_program_pk="+a.getInternedu_program_pk();
	}

}

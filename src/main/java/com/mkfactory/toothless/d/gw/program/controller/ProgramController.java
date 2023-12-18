package com.mkfactory.toothless.d.gw.program.controller;

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
import com.mkfactory.toothless.d.dto.CompanyManagerDto;
import com.mkfactory.toothless.d.dto.InterestCompanyDto;
import com.mkfactory.toothless.d.dto.ProgramApplyDto;
import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.dto.ProgramReviewDto;
import com.mkfactory.toothless.d.gw.program.service.ProgramServiceIpml;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_d/gw_program/*")
public class ProgramController {
	
	@Autowired
	private ProgramServiceIpml programService;

	@RequestMapping("registerProgramPage")
	public String registerProgramPage(Model model) {
		
		model.addAttribute("programCategory", programService.programCategory());
		
		return "/tl_d/gw_program/registerProgramPage";
	}
	
	@RequestMapping("registerProgramProcess")
	public String registerProgramProcess(HttpSession session, ProgramDto programDto, MultipartFile imageFile) {
		
		// 교직원 pk 입력
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfoDto != null) {
			int staffPk = staffInfoDto.getStaff_pk();
			programDto.setStaff_pk(staffPk);
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
			programDto.setPrg_main_image(imageTodayPath + fileName);
		}

		programService.registerProgramInfo(programDto);
		
		return "redirect:./programListPage";
	}
	
	//프로그램 목록페이지
	@RequestMapping("programListPage")
	public String programListPage(Model model) {
		
		model.addAttribute("programList", programService.getProgramList());
		
		return "/tl_d/gw_program/programListPage";
	}
	
	//프로그램 상세보기 페이지(교직원용)
	@RequestMapping("programViewDetailsPage")
	public String programViewDetailsPage(Model model, int program_pk) {
		
		model.addAttribute("program", programService.getProgram(program_pk));
		programService.countApplyProgram(program_pk);
		
		return "/tl_d/gw_program/programViewDetailsPage";
	}
	
	//기업, 담당자 정보 수정
	@RequestMapping("updateProgramInfoPage")
	public String updateProgramInfo(Model model,int program_pk) {
		
		model.addAttribute("program", programService.getProgram(program_pk));
		model.addAttribute("programCategory", programService.programCategory());
		
		return "/tl_d/gw_program/updateProgramInfoPage";
	}
	
	//곧 수정해야함
	@RequestMapping("updateProgramInfoProcess")
	public String updateProgramInfoProcess(ProgramDto programDto, MultipartFile updateimageFile) {
		
		
		
		// 이미지 입력
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd/");
		
		
		
		if(updateimageFile != null && !updateimageFile.isEmpty()) {
			
			String imageRootPath = "C:/Workspace/GitWorkspace/toothless/src/main/webapp/resources/img/employment/";
			String imageTodayPath = sdf.format(new Date());
			
			File todayFolderForCreate = new File(imageRootPath + imageTodayPath);
			
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs();
			}
			
			String originalFileName = updateimageFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			String fileName = uuid + "_" + currentTime;
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			fileName += ext;
			
			try {
				updateimageFile.transferTo(new File(imageRootPath + imageTodayPath + fileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			programDto.setPrg_main_image(imageTodayPath + fileName);
					
		}
			
		programService.updateProgramInfo(programDto);
		return "redirect:./programViewDetailsPage?program_pk="+programDto.getProgram_pk();
		
	}
	
	//기업정보 삭제
	@RequestMapping("deleteProgramInfoProcess")
	public String deleteProgramInfoProcess(int program_pk) {
		
		programService.deleteProgramInfo(program_pk);
		
		return "redirect:./programListPage";
	}
	
	//학생용 프로그램 목록 페이지
	@RequestMapping("programListForStudentPage")
	public String programListForStudentPage(Model model) {
		
		model.addAttribute("programList", programService.getProgramList());
		
		return "/tl_d/gw_program/programListForStudentPage";
	}
	
	//학생용 프로그램 상세보기 페이지
	@RequestMapping("programViewDetailsForStudentPage")
	public String programViewDetailsForStudentPage(Model model, int program_pk, HttpSession session) {
		
		StudentInfoDto studentInfoDto=(StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto !=null) {
			
			ProgramApplyDto programApplyDto=new ProgramApplyDto();
			
			programApplyDto.setProgram_pk(program_pk);
			
			programApplyDto.setStudent_pk(studentInfoDto.getStudent_pk());
			
			int myApplyProgram=programService.studentApplyCount(programApplyDto);
			
			model.addAttribute("myApplyProgram",myApplyProgram);
			
		}
		
		model.addAttribute("program", programService.getProgram(program_pk));
		
		return "/tl_d/gw_program/programViewDetailsForStudentPage";
	}
	
	//학생 프로그램 신청
	@RequestMapping("studentApplyProgram")
	public String studentApplyProgram(Model model,ProgramApplyDto programApplyDto, int program_pk) {
		
		model.addAttribute("program", programService.getProgram(program_pk));
		
		return "/tl_d/gw_program/studentApplyProgram";
	}
	
	@RequestMapping("studentApplyProcess")
	public String studentApplyProcess(HttpSession session, ProgramApplyDto programApplyDto, int program_pk) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto != null) {
			int studentPk = studentInfoDto.getStudent_pk();
			programApplyDto.setStudent_pk(studentPk);
		}
		
		programService.studentApplyProgram(programApplyDto);
		
		
		return "redirect:./programViewDetailsForStudentPage?program_pk="+programApplyDto.getProgram_pk();
	}
	
	//학생 신청 프로그램 목록(학생용)
	@RequestMapping("applyProgramListForStudentPage")
	public String applyProgramListForStudentPage(Model model) {
		
		model.addAttribute("studentApplyProgram", programService.studentApplyProgramList());
		
		
		return "/tl_d/gw_program/applyProgramListForStudentPage";
	}
	
	//학생 신청 프로그램 목록(교직원용)
	@RequestMapping("applyProgramListForStaffPage")
	public String applyProgramListForStaffPage(Model model,int program_pk) {
		
		model.addAttribute("program", programService.getProgram(program_pk));
		model.addAttribute("studentApplyProgram", programService.applyProgramList(program_pk));
		
		return "/tl_d/gw_program/applyProgramListForStaffPage";
	}
	
	//교직원 출석처리
	@RequestMapping("studentAttendProcess")
	public String studentAttendProcess(ProgramApplyDto programApplyDto) {
		
		programService.changeStudentAttend(programApplyDto);
		
		return "redirect:./applyProgramListForStaffPage?program_pk="+programApplyDto.getProgram_pk();
	}
	
	//교직원 출석취소
	@RequestMapping("studentUnAttendProcess")
	public String studentUnAttendProcess(ProgramApplyDto programApplyDto) {
		
		programService.changeStudentUnAttend(programApplyDto);
		
		return "redirect:./applyProgramListForStaffPage?program_pk="+programApplyDto.getProgram_pk();
	}
	
	
	//프로그램 리뷰쓰기
	@RequestMapping("programReviewPage")
	public String programReviewPage(Model model, int program_apply_pk) {
		
		model.addAttribute("program", programService.getApplyProgram(program_apply_pk));
		
		return "/tl_d/gw_program/programReviewPage";
	}
	
	@RequestMapping("programReviewProcess")
	public String programReviewProcess(ProgramReviewDto programReviewDto) {
		
		programService.inputProgramReview(programReviewDto);
		
		return "redirect:./applyProgramListForStudentPage";
	}
	
	//리뷰목록
	@RequestMapping("programReviewListPage")
	public String programReviewListPage(Model model, int program_pk) {
		
		model.addAttribute("program", programService.getProgram(program_pk));
		model.addAttribute("studentApplyProgram", programService.applyProgramList(program_pk));
		
		return "/tl_d/gw_program/programReviewListPage";
	}
}

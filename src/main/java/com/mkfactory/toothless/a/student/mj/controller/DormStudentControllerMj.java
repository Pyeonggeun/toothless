package com.mkfactory.toothless.a.student.mj.controller;

import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.student.mj.service.DormStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentSemesterDto;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@Controller
@RequestMapping("/tl_a/student/*")
public class DormStudentControllerMj {
	
	@Autowired
	DormStudentServiceImpl studentService;
	
	@Autowired
	StudentServiceImpl commonStudentService;
	
	// 학생 로그인페이지로
	@RequestMapping("loginPage")
	public String loginPage() {

		return "another/student/loginPage";
	}
	
	// 학생 로그인
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, StudentInfoDto params) {
		
		StudentInfoDto studentInfoDto = commonStudentService.loginByStudentIdAndPassword(params);
		
		if( studentInfoDto == null ) {
			return "redirect:../../tl_a/student/loginPage";
		}
		
		session.setAttribute("sessionStudentInfo", studentInfoDto);
		return "redirect:../student/jw_mainPage";
		
	}
	
	// 학생 로그아웃
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
	
		session.invalidate();
		
		return "redirect:../student/jw_mainPage";
	}
	
	
	// 현재학기 입주공고 정보
	@RequestMapping("mj_dormPosted")
	public String mj_dormPosted(Model model, HttpSession session) {
		
		// 공고 정부
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo(true);
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		// 학생정보
		StudentInfoDto sessionStudentDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if (sessionStudentDto != null) {
			
			JoinDormApplicationDto isApplyThisSemester = studentService.getIsApplyThisSemesterInfo(sessionStudentDto.getStudent_pk());
			
			if (isApplyThisSemester != null) {	// 이미 입사신청 함
				model.addAttribute("isApply", 1);
			}else {								// 아직안함
				model.addAttribute("isApply", 2);
			}
			
		} 
		
		return "tl_a/student/mj_dormPosted";
	}
	
	// 공고에서 입사신청 페이지로
	@RequestMapping("mj_applyDormByInfoPage")
	public String mj_applyDormByInfoPage(Model model, HttpSession session) {
		
		StudentInfoDto sessionStudentDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		// 로그인된 학생키로 정보가져오기
		Map<String, Object> studentInfoAll = studentService.getStudentInfo(sessionStudentDto.getStudent_pk());
		model.addAttribute("studentInfoAll", studentInfoAll);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo(true);
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		return "tl_a/student/mj_applyDormByInfoPage";
	}
	
	// 입사신청하기
	@RequestMapping("mj_applyDormProcess")
	public String mj_applyDormProcess(JoinDormApplicationDto params) {
		
		studentService.applyDormByStudentInfo(params);
		
		return "redirect:../student/mj_applyDormCompletePage";
	}
	
	// 입사신청 완료 페이지로
	@RequestMapping("mj_applyDormCompletePage")
	public String mj_applyDormCompletePage(Model model) {
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo(true);
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		return "tl_a/student/mj_applyDormCompletePage";
	}

	// 합격안내 페이지로
	@RequestMapping("mj_announcePassPage")
	public String mj_announcePassPage(Model model, HttpSession session) {
		
		StudentInfoDto sessionStudentDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		// 입사신청정보(합격여부도 여기있음)
		if (sessionStudentDto != null) {
			
			JoinDormApplicationDto isApplyThisSemester = studentService.getIsApplyThisSemesterInfo(sessionStudentDto.getStudent_pk());
			if (isApplyThisSemester != null) {
				
				if (isApplyThisSemester.getSelection_status().equals("Y")) {	
					model.addAttribute("isPass", 1);	// 합격
					
					if(isApplyThisSemester.getPayment_status().equals("Y")) {	
						model.addAttribute("isPay", 1);	// 납부완료
					}else {
						model.addAttribute("isPay", 2);	// 미납
					}
					
				}else {															
					model.addAttribute("isPass", 2);	// 불합격
				}
				
			}else {
				model.addAttribute("isPass", 3);	// 신청안했음
			}
			
		}else {
			return "redirect:../student/loginPage";
		}
		
		
		// 로그인된 학생키로 정보가져오기
		Map<String, Object> studentInfoAll = studentService.getStudentInfo(sessionStudentDto.getStudent_pk());
		model.addAttribute("studentInfoAll", studentInfoAll);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo(true);
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		
		return "tl_a/student/mj_announcePassPage";
	}
	

	

	
	
}

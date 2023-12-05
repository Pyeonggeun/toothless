package com.mkfactory.toothless.a.student.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
			return "redirect:../another/student/loginPage";
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
	public String mj_dormPosted(Model model) {
		
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		return "tl_a/student/mj_dormPosted";
	}
	
	// 공고에서 입사신청 페이지로
	@RequestMapping("mj_applyDormByInfoPage")
	public String mj_applyDormByInfoPage(Model model, int student_pk) {
		
		// 학생정보 - 추후 session에서 정보 가져와야함!!!! - dormPostedjsp에서 쿼리로 넘긴 int student_pk도 지우기
		Map<String, Object> studentInfoAll = studentService.getStudentInfo(student_pk);
		model.addAttribute("studentInfoAll", studentInfoAll);
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		return "tl_a/student/mj_applyDormByInfoPage";
	}
	
	// 입사신청하기
	@RequestMapping("mj_applyDormProcess")
	public String mj_applyDormProcess(JoinDormApplicationDto params) {
		
		// 학생정보 - 추후 session에서 정보 가져와야함!!!! - join..appli.. jsp에서 히든 넘긴값도 다시생각
		studentService.applyDormByStudentInfo(params);
		
		return "redirect:../student/mj_applyDormCompletePage";
	}
	
	// 입사신청 완료 페이지로
	@RequestMapping("mj_applyDormCompletePage")
	public String mj_applyDormCompletePage(Model model) {
		
		// 현재학기정보 + 입주공고 정보
		Map<String, Object> thisSemesterJoinDormInfo = studentService.thisSemesterJoinDormInfo();
		model.addAttribute("thisSemesterJoinDormInfo", thisSemesterJoinDormInfo);
		
		return "tl_a/student/mj_applyDormCompletePage";
	}

	
	

	

	
	
}

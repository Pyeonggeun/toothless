package com.mkfactory.toothless.x.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.service.DormStaffServiceImpl;
import com.mkfactory.toothless.a.student.mj.service.DormStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StaffServiceImpl;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;
import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
import com.mkfactory.toothless.x.mj.service.LifeStaffServiceImpl;

@Controller
@RequestMapping("/tl_x/mj/*")
public class LifeStaffControllerMj {
	
	@Autowired
	private LifeStaffServiceImpl lifeStaffService;
	
	@Autowired
	private StaffServiceImpl commonStaffService;
	
	// 사감 로그인 페이지로
	@RequestMapping("loginPage")
	public String loginPage() {
		
		return "another/staff/loginPage";
	}
	
	// 사감 로그인
	@RequestMapping("loginProcess")
	public String loginProcess(HttpSession session, StaffInfoDto params) {
		
		StaffInfoDto staffInfoDto = commonStaffService.loginByStaffIdAndPassword(params);
	
		if(staffInfoDto == null) {
			return "redirect:../another/staff/loginPage";
		}
		
		session.setAttribute("sessionStaffInfo", staffInfoDto);
		return "redirect:../mj/mainPage";
	}
	
	// 사감 로그아웃
	@RequestMapping("logoutProcess")
	public String logoutProcess(HttpSession session) {
	
		session.invalidate();
		
		return "redirect:../../another/staff/loginPage";
	}
	
	// 메인 페이지로
	@RequestMapping("mainPage")
	public String mainPage() {
		
		return "tl_x/mj/mainPage";
	}
	
	
	// 강사관리 페이지로 (강사등록 탭)
	@RequestMapping("manageTeacherPage")
	public String manageTeacherPage() {
		
		return "tl_x/mj/manageTeacherPage";
	}
	
	// 강사관리 페이지2로 (조회/수정 탭)
	@RequestMapping("manageTeacherPage2")
	public String manageTeacherPage2() {
		
		return "tl_x/mj/manageTeacherPage2";
	}
	
	// 학생관리 페이지로 (학생등록 탭)
	@RequestMapping("manageStudentPage")
	public String manageStudentPage() {
		
		return "tl_x/mj/manageStudentPage";
	}
	
	// 학생관리 페이지2로 (조회/수정 탭)
	@RequestMapping("manageStudentPage2")
	public String manageStudentPage2() {
		
		return "tl_x/mj/manageStudentPage2";
	}
	
	// 교육과정관리 페이지로 (등록 탭)
	@RequestMapping("manageLecturePage")
	public String manageLecturePage() {
		
		return "tl_x/mj/manageLecturePage";
	}
	
	// 교육과정관리 페이지2로 (조회/수정 탭)
	@RequestMapping("manageLecturePage2")
	public String manageLecturePage2() {
		
		return "tl_x/mj/manageLecturePage2";
	}
	
	// 강의관리 페이지로 (등록 탭)
	@RequestMapping("manageOpenLecturePage")
	public String manageOpenLecturePage() {
	
		return "tl_x/mj/manageOpenLecturePage";
	}
	
	// 강의관리 페이지2로 (조회/수정 탭)
	@RequestMapping("manageOpenLecturePage2")
	public String manageOpenLecturePage2() {
		
		
		return "tl_x/mj/manageOpenLecturePage2";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

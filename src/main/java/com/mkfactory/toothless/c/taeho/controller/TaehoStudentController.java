package com.mkfactory.toothless.c.taeho.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksInternReportDto;
import com.mkfactory.toothless.c.taeho.service.TaehoStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_c/taeho/student/*")
public class TaehoStudentController {
	
	
	@Autowired
	private TaehoStudentServiceImpl taehoStudentService;
	
	
	@RequestMapping("writeInternReportPage")
	public String writeInternReportPage(HttpSession session, Model model) {
		
		StudentInfoDto sessionStudentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = sessionStudentInfo.getStudent_pk();
		
		Map<String, Object> internshipCourseInfoMap = taehoStudentService.getInternshipCourseInfoByStudentPk(studentPk);
		model.addAttribute("internshipCourseInfoMap", internshipCourseInfoMap);
		
//		List<Map<String, Object>> attendanceCountList = taehoStudentService.getAttendanceCountByStudentPk(studentPk);
//		model.addAttribute("attendanceCountList", attendanceCountList);
		
//		List<Map<String, Object>> internReportList = taehoStudentService.getIngInternReportByStudentPk(studentPk);
//		model.addAttribute("internReportList", internReportList);
		
		return"tl_c/taeho/student/writeInternReportPage";
	}
	
	@RequestMapping("writeInternReportProcess")
	public String writeInternReportProcess(AjdksInternReportDto ajdksInternReportDto, int student_intern_pk) {

		ajdksInternReportDto.setStudent_intern_pk(student_intern_pk);
		
		taehoStudentService.registerInternReport(ajdksInternReportDto);
				
		return "redirect:./writeInternReportPage";
	}
	
	@RequestMapping("readMyDetailAttendanceStatusPage")
	public String readMyDetailAttendanceStatusPage(HttpSession session) {
		
		return "tl_c/taeho/student/readMyDetailAttendanceStatusPage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

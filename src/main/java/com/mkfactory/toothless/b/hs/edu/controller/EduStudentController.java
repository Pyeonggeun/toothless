package com.mkfactory.toothless.b.hs.edu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.b.dto.EduApplyDto;
import com.mkfactory.toothless.b.dto.EduDto;
import com.mkfactory.toothless.b.hs.edu.service.EduStaffServiceimpl;
import com.mkfactory.toothless.b.hs.edu.service.EduStudentServiceimpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_b/hs/*")
public class EduStudentController {
	
	@Autowired
	EduStudentServiceimpl eduStudentService;
	
	@Autowired
	EduStaffServiceimpl eduStaffService;
	
	//메인, 스태프 서비스 땡겨씀
	@RequestMapping("eduMainPageForStudent")
	public String eduMainPageForStudent(Model model) {

		List<Map<String, Object>> list = eduStaffService.getEduProgList();

		model.addAttribute("list", list);
		
		return "tl_b/hs/eduMainPageForStudent";
	}
	
	//학생이 상세 글 보기
	@RequestMapping("readEduProgPageForStudent")
	public String readEduProgPageForStudent(HttpSession session, Model model, EduApplyDto eduApplyDto) {
		
		StudentInfoDto sessionstudentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");

		System.out.println(sessionstudentInfoDto.getStudent_pk());
		int studentPk = sessionstudentInfoDto.getStudent_pk();
		eduApplyDto.setStudent_pk(studentPk);

//		System.out.println(eduApplyDto.getStudent_pk());
//		System.out.println(eduApplyDto.getEdu_pk());
		Map<String, Object> map = eduStaffService.getEduProg(eduApplyDto);
		
		model.addAttribute("qwer", map);
		
		return "tl_b/hs/readEduProgPageForStudent";
	}
	
	
	
	//프로그램 신청페이지
	@RequestMapping("eduApplyPage")
	public String eduApplyPage(Model model, EduDto eduDto) {
		
		// int, strimg 민방 1
		// model(teeml)
		
		// applydto 민방2
		// model (dto.getNAmet())

		model.addAttribute("edu_pk", eduDto.getEdu_pk());
		model.addAttribute("name", eduDto.getName());
		
		return "tl_b/hs/eduApplyPage";
	}
	//프로그램 신청프로세스
	@RequestMapping("eduApplyProcess")
	public String eduApplyProcess(HttpSession session, EduApplyDto eduApplyDto) {
		
//		System.out.println("어플라이 프로세스 실행1"); 세션인포 인춘이가만든거에서 가져와야지
		StudentInfoDto sessionstudentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = sessionstudentInfoDto.getStudent_pk();
//		System.out.println(studentPk + "학생키");

		eduApplyDto.setStudent_pk(studentPk);
//		System.out.println("여기실행되나?");

		eduStudentService.eduApply(eduApplyDto);
		
		return "redirect:./eduApplyCompletePage";
	}
	//신청완료 페이지
	@RequestMapping("eduApplyCompletePage")
	public String eduApplyCompletePage() {
		return "tl_b/hs/eduApplyCompletePage";
	}
	
	//학생 마이페이지
	@RequestMapping("eduMyPageForStudent")
	public String eduMyPageForStudent(Model model) {
		
		List<Map<String, Object>> eduApplyList = eduStaffService.getEduApplyList();
		
		model.addAttribute("eduApplyList", eduApplyList);
		
		return "tl_b/hs/eduMyPageForStudent";
	}
	//만족도 작성페이지(학생)
	@RequestMapping("eduServeyWritePage")
	public String eduServeyWritePage(Model model) {
		
		List<Map<String, Object>> eduApplyList = eduStaffService.getEduApplyList();
		
		model.addAttribute("eduApplyList", eduApplyList);
		
		return "tl_b/hs/eduServeyWritePage";
	}
	
	//상태 바꾸기(학생)
	@RequestMapping("updateStatusYProcessForStudent")
	public String updateStatusYProcessForStudent(int edu_apply_pk) {
		eduStaffService.updateStatusY(edu_apply_pk);
		return "redirect:./eduMyPageForStudent";
	}
	@RequestMapping("updateStatusNProcessForStudent")
	public String updateStatusNProcessForStudent(int edu_apply_pk) {
		eduStaffService.updateStatusN(edu_apply_pk);
		return "redirect:./eduMyPageForStudent";
	}
	@RequestMapping("updateStatusCProcessForStudent")
	public String updateStatusCProcessForStudent(int edu_apply_pk) {
		eduStaffService.updateStatusC(edu_apply_pk);
		return "redirect:./eduMyPageForStudent";
	}
	
	
	
	
	
	
	
	
}

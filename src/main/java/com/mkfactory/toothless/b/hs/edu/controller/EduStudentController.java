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
import com.mkfactory.toothless.b.dto.EduStsfcSurveyDto;
import com.mkfactory.toothless.b.hs.edu.mapper.EduStaffSqlMapper;
import com.mkfactory.toothless.b.hs.edu.service.EduStaffServiceimpl;
import com.mkfactory.toothless.b.hs.edu.service.EduStudentServiceimpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.service.StudentServiceImpl;

@Controller
@RequestMapping("/tl_b/hs/*")
public class EduStudentController {
	
	@Autowired
	EduStudentServiceimpl eduStudentService;
	
	@Autowired
	EduStaffServiceimpl eduStaffService;
	
	@Autowired 
	EduStaffSqlMapper eduStaffSqlMapper;
	
	@Autowired
	private StudentServiceImpl studentService;
	
	//메인, 스태프 서비스 땡겨씀
	@RequestMapping("eduMainPageForStudent")
	public String eduMainPageForStudent(Model model, HttpSession session,
			String searchType,
			String searchWord) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto == null) {
			
			return "redirect:../../another/student/loginPage";
		}
		

		List<Map<String, Object>> list = eduStaffService.getEduProgList(searchType, searchWord);

		model.addAttribute("list", list);
		
		return "tl_b/hs/eduMainPageForStudent";
	}
	
	//학생이 상세 글 보기
	@RequestMapping("readEduProgPageForStudent")
	public String readEduProgPageForStudent(HttpSession session, Model model, EduApplyDto eduApplyDto) {
		
		StudentInfoDto sessionstudentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(sessionstudentInfoDto == null) {
			
			return "redirect:../../another/student/loginPage";
		}
		
		int studentPk = sessionstudentInfoDto.getStudent_pk();
		eduApplyDto.setStudent_pk(studentPk);

//		System.out.println(eduApplyDto.getStudent_pk());
//		System.out.println(eduApplyDto.getEdu_pk());
		Map<String, Object> map = eduStaffService.getEduProg(eduApplyDto, true);
		
		model.addAttribute("qwer", map);
		
		return "tl_b/hs/readEduProgPageForStudent";
	}
	
	
	//프로그램 신청페이지
	@RequestMapping("eduApplyPage")
	public String eduApplyPage(Model model, EduDto eduDto, HttpSession session) {
		
		// int, strimg 민방 1
		// model(teeml)
		
		// applydto 민방2
		// model (dto.getNAmet())
//		int applyStudentCount = eduStaffSqlMapper.selectApplyPkPerEduPkCount(eduDto.getEdu_pk());
		
		//인춘쓰

		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto == null) {
			
			return "redirect:../../another/student/loginPage";
		}
		Map<String, Object> studentOtherInfo = studentService.getStudentOtherInfo(studentInfoDto);
		model.addAttribute("studentOtherInfo", studentOtherInfo);
		
		
		model.addAttribute("applyStudentCount", eduStaffSqlMapper.selectApplyPkPerEduPkCount(eduDto.getEdu_pk()));
		model.addAttribute("edu_pk", eduDto.getEdu_pk());
		model.addAttribute("name", eduDto.getName());
		model.addAttribute("capacity", eduDto.getCapacity());
		
		
		return "tl_b/hs/eduApplyPage";
	}
	//프로그램 신청프로세스
	@RequestMapping("eduApplyProcess")
	public String eduApplyProcess(HttpSession session, EduApplyDto eduApplyDto) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		int studentPk = studentInfoDto.getStudent_pk();
		
		eduApplyDto.setStudent_pk(studentPk);

		eduStudentService.eduApply(eduApplyDto);
		
		return "redirect:./eduApplyCompletePage?edu_pk=" + eduApplyDto.getEdu_pk();
	}
	
	//신청완료 페이지
	@RequestMapping("eduApplyCompletePage")
	public String eduApplyCompletePage(Model model, int edu_pk, HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto == null) {
			
			return "redirect:../../another/student/loginPage";
		}

		model.addAttribute("eduDto", eduStudentService.getEduInfoByEduPk(edu_pk));
		
		return "tl_b/hs/eduApplyCompletePage";
	}
	
	//학생 마이페이지
	@RequestMapping("eduMyPageForStudent")
	public String eduMyPageForStudent(Model model, HttpSession session) {
		
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(studentInfoDto == null) {
			
			return "redirect:../../another/student/loginPage";
		}
		
		int studentPk = studentInfoDto.getStudent_pk();

		
		List<Map<String, Object>> MyEduList = eduStudentService.getMyEduList(studentPk);
		List<Map<String, Object>> MyServeyList = eduStudentService.getMyServeyList(studentPk);
		
		model.addAttribute("MyServeyList", MyServeyList);
		model.addAttribute("MyEduList", MyEduList);
		
		return "tl_b/hs/eduMyPageForStudent";
	}
	
	//만족도 작성페이지(학생)
	@RequestMapping("eduServeyWritePage")
	public String eduServeyWritePage(Model model, HttpSession session, int edu_apply_pk) {
		
		
		
		StudentInfoDto sessionstudentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		
		if(sessionstudentInfoDto == null) {
			
			return "redirect:../../another/student/loginPage";
		}

		
		int studentPk = sessionstudentInfoDto.getStudent_pk();
		
		List<Map<String, Object>> eduApplyList = eduStudentService.getMyEduList(studentPk);
		List<Map<String, Object>> MyServeyList = eduStudentService.getMyServeyList(studentPk);
		
		model.addAttribute("MyServeyList", MyServeyList);
		model.addAttribute("eduApplyList", eduApplyList);
		model.addAttribute("edu_apply_pk", edu_apply_pk);
		
		return "tl_b/hs/eduServeyWritePage";
	}
	//만족도 작성 프로세스
	@RequestMapping("writeEduServeyProcess")
	public String writeEduServeyProcess(HttpSession session, EduStsfcSurveyDto eduStsfcSurveyDto) {
		
		eduStudentService.writeEduServey(eduStsfcSurveyDto);
		eduStaffService.updateStatusD(eduStsfcSurveyDto.getEdu_apply_pk());
		return "redirect:./eduMyPageForStudent";
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
	
	
	@RequestMapping("healthCenterBossPage")
	public String healthCenterBossPage() {
		
		return "tl_b/hs/healthCenterBossPage";
	}
	
	
	
	
	
}

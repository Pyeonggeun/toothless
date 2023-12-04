package com.mkfactory.toothless.c.guntaek.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_c/guntaek/*")
public class GuntaekStudentController {
	@Autowired
	private GuntaekStudentServiceImpl guntaekStudentService;
	
	
	// 이력서 포워딩 
	@RequestMapping("ajdksRegisterSelfIntroduction")
	public String ajdksRegisterSelfIntroduction(HttpSession session, Model model){
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 되어있는 학생 Dto

		int introductionCount = guntaekStudentService.
				countSelfIntroduction(loginUser.getStudent_pk());
		// 현재 로그인 한 학생의 이력서 개수 가져오기

		
	
		model.addAttribute("selfIntroductionDto",
				guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk()));
		// 현재 학생이 작성한 이력서 Dto 가져온 후 model에 넣어줬다.
		
		
		
		model.addAttribute("introductionCount", introductionCount);
		
		return "tl_c/guntaek/ajdksRegisterSelfIntroduction";
	}
	
	// 이력서 insert
	@RequestMapping("ajdksRegisterSelfIntroductionProcess")
	public String ajdksRegisterSelfIntroductionProcess(HttpSession session, 
	AjdksSelfIntroductionDto selfIntroductionDto, Model model){
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 유저 얻어오기
		
		int student_pk = loginUser.getStudent_pk();
		
		selfIntroductionDto.setStudent_pk(student_pk);
		// 현재 학생키 이력서Dto에 할당
		
		guntaekStudentService.registerSelfIntroduction(selfIntroductionDto);
		// 현재학생 기준 이력서 insert
		
		
		return "redirect:./ajdksRegisterSelfIntroduction";
	}
	
	// 특정 학생 이력서 수정
	@RequestMapping("ajdksUpdateSelfIntroductionProcess")
	public String ajdksUpdateSelfIntroductionProcess(HttpSession session, AjdksSelfIntroductionDto selfIntroductionDto) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 유저 얻어오기	
		selfIntroductionDto.setStudent_pk(loginUser.getStudent_pk());
		guntaekStudentService.updateSelfIntroductionDto(selfIntroductionDto);
		return "redirect:./ajdksRegisterSelfIntroduction";
	}

	
	// 자격증 포워딩
	@RequestMapping("ajdksRegisterCertification")
	public String ajdksRegisterCertification() {
		return "tl_c/guntaek/ajdksRegisterCertification";
	}
	
	
	
}

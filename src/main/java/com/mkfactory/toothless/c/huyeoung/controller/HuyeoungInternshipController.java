package com.mkfactory.toothless.c.huyeoung.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.huyeoung.service.HuyeoungInternshipServiceImpl;

@Controller
@RequestMapping("/tl_c/huyeong/staff/*")
public class HuyeoungInternshipController {

	@Autowired
	private HuyeoungInternshipServiceImpl huyeoungInternshipServiceImpl;

	// 현장실습관리목록조회
	@RequestMapping("ajdksInternshipList")
	public String ajdksInternshipList(Model model, AjdksInternshipCourseDto param) {

		List<Map<String, Object>> list = huyeoungInternshipServiceImpl.selectInternshipAll(param);

		model.addAttribute("list", list);
		return "/tl_c/huyeong/staff/ajdksInternshipList";
	}

	// 현장실습관리상세조회
	@RequestMapping("ajdksInternshipDtl")
	public String ajdksInternshipDtl(Model model, AjdksInternshipCourseDto param) {

		AjdksInternshipCourseDto aDto = huyeoungInternshipServiceImpl.selectInternshipDtil(param);
		List<Map<String, Object>> list = huyeoungInternshipServiceImpl.selectProfessorInfoList();

		model.addAttribute("AjdksInternshipCourseDto", aDto);

		// System.out.println("상세조회 결과 controller ["+aDto.course_title+"]");

		model.addAttribute("list", list);
		return "/tl_c/huyeong/staff/ajdksInternshipDtl";
	}

	// 현장실습관리등록화면이동
	@RequestMapping("ajdksInternshipRegForm")
	public String ajdksInternshipRegForm() {

		return "/tl_c/huyeong/staff/ajdksInternshipReg";
	}

	// 현장실습관리등록
	@RequestMapping("ajdksInternshipReg")
	public String ajdksInternshipReg(Model model, AjdksInternshipCourseDto param) {

		System.out.println("### param[" + param.getCourse_title() + "]");

		huyeoungInternshipServiceImpl.insertInternshipRegister(param);

		return "redirect:./ajdksInternshipList";
	}

	// 현장실습관리수정
	@RequestMapping("ajdksInternshipModify")
	public String ajdksInternshipModify(Model model, AjdksInternshipCourseDto param) {

		huyeoungInternshipServiceImpl.updateInternship(param);

		return "redirect:./ajdksInternshipDtl";
	}

}

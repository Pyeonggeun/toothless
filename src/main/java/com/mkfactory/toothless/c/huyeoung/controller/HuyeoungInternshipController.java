package com.mkfactory.toothless.c.huyeoung.controller;

import java.text.SimpleDateFormat;
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
		List<Map<String, Object>> complist = huyeoungInternshipServiceImpl.selectCompanyList();
		List<Map<String, Object>> departList = huyeoungInternshipServiceImpl.selectDepartmentList();

		model.addAttribute("AjdksInternshipCourseDto", aDto);

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		String applying_start_date = simpleDateFormat.format(aDto.applying_start_date);
		String applying_end_date = simpleDateFormat.format(aDto.applying_end_date);
		String internship_start_date = simpleDateFormat.format(aDto.internship_start_date);
		String internship_end_date = simpleDateFormat.format(aDto.internship_end_date);
		String announcement_date = simpleDateFormat.format(aDto.announcement_date);

		model.addAttribute("list", list);
		model.addAttribute("complist", complist);
		model.addAttribute("departList", departList);

		model.addAttribute("applying_start_date", applying_start_date);
		model.addAttribute("applying_end_date", applying_end_date);
		model.addAttribute("internship_start_date", internship_start_date);
		model.addAttribute("internship_end_date", internship_end_date);
		model.addAttribute("announcement_date", announcement_date);

		return "/tl_c/huyeong/staff/ajdksInternshipDtl";
	}

	// 현장실습관리등록화면이동
	@RequestMapping("ajdksInternshipRegForm")
	public String ajdksInternshipRegForm(Model model) {
		List<Map<String, Object>> list = huyeoungInternshipServiceImpl.selectProfessorInfoList();
		List<Map<String, Object>> complist = huyeoungInternshipServiceImpl.selectCompanyList();
		List<Map<String, Object>> departList = huyeoungInternshipServiceImpl.selectDepartmentList();

		model.addAttribute("list", list);
		model.addAttribute("complist", complist);
		model.addAttribute("departList", departList);
		return "/tl_c/huyeong/staff/ajdksInternshipReg";
	}

	// 현장실습관리등록
	@RequestMapping("ajdksInternshipReg")
	public String ajdksInternshipReg(Model model, AjdksInternshipCourseDto param) {

		huyeoungInternshipServiceImpl.insertInternshipRegister(param);

		return "redirect:./ajdksInternshipList";
	}

	// 현장실습관리수정
	@RequestMapping("ajdksInternshipModify")
	public String ajdksInternshipModify(Model model, AjdksInternshipCourseDto param) {

		huyeoungInternshipServiceImpl.updateInternship(param);

		return "redirect:./ajdksInternshipDtl?internship_course_pk=" + param.internship_course_pk;
	}

}

package com.mkfactory.toothless.a.student.sh.freeboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mkfactory.toothless.a.dto.DormFreeboardDto;
import com.mkfactory.toothless.a.student.sh.freeboard.service.DormBoardServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Controller
@RequestMapping("/tl_a/student/*")
public class DormBoardController {

	@Autowired
	private DormBoardServiceImpl dormboardService;

	@RequestMapping("mainGaesipan")
	public String maingaesipan(Model model) {

		List<Map<String, Object>> list = dormboardService.getGasipanList();

		model.addAttribute("list", list);

		return "tl_a/student/sh_mainGaesipan";
	}

	@RequestMapping("writeGasipan")
	public String writegasipan() {

		return "tl_a/student/sh_writeGasipan";

	}

	@RequestMapping("writeGasipanProcess")
	public String writeGasipanProcess(HttpSession session, DormFreeboardDto params) {

		int studentPk = ((StudentInfoDto) session.getAttribute("sessionStudentInfo")).getStudent_pk();
		params.setStudent_pk(studentPk);

		dormboardService.wirteGasipan(params);

		return "redirect:./mainGaesipan";
	}

	@RequestMapping("readGasipan")
	public String readGasipan(Model model, int id) {

		// dormboardService.increaseReadCount(student_pk);

		Map<String, Object> map = dormboardService.getDorm(id, true);

		model.addAttribute("qwer", map);

		return "tl_a/student/sh_readGasipan";
	}

	@RequestMapping("deleteGasipanProcess")
	public String deleteGasipanProcess(int id) {

		dormboardService.deleteDorm(id);

		return "redirect:./mainGaesipan";
	}

	@RequestMapping("updateDorm")
	public String updateGasipan(Model model, int id) {

		model.addAttribute("qwer", dormboardService.getDorm(id, false));

		return "tl_a/student/sh_updateGasipan";
	}

	@RequestMapping("updateGasipanProcess")
	public String updateGasipanProcess(int id, DormFreeboardDto params) {

		params.setDorm_freeboard_pk(id);
		
		dormboardService.updateDorm(params);

		return "redirect:./readGasipan?id=" + params.getDorm_freeboard_pk();
	}
}
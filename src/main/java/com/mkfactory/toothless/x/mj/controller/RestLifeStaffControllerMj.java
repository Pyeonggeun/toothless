package com.mkfactory.toothless.x.mj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.Mj_RestResponseDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.service.DormStaffServiceImpl;
import com.mkfactory.toothless.a.student.mj.service.DormStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@RestController
@RequestMapping("/tl_x/mj/*")
public class RestLifeStaffControllerMj {
	

	
	
	// =========================
	// templete - 항상 같은구조니까 만들어놓고 붙이면되지.
	@RequestMapping("#")
	public Mj_RestResponseDto templete(HttpSession session) {
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)
		Mj_RestResponseDto restResponseDto = new Mj_RestResponseDto();
	
	

		restResponseDto.setResult("success");
		return restResponseDto;
		// ★★★ rest api의 시작과 끝 (답정너로 넣어주기)		
	}

	
	
	
	
	
	
	
	
	
}

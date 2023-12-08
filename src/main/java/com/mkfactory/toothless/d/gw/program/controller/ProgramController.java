package com.mkfactory.toothless.d.gw.program.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.d.dto.ProgramDto;
import com.mkfactory.toothless.d.gw.program.service.ProgramServiceIpml;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Controller
@RequestMapping("/tl_d/gw_program/*")
public class ProgramController {
	
	@Autowired
	private ProgramServiceIpml programService;

	@RequestMapping("registerProgramPage")
	public String registerProgramPage(Model model) {
		
		model.addAttribute("programCategory", programService.programCategory());
		
		return "/tl_d/gw_program/registerProgramPage";
	}
	
	@RequestMapping("registerProgramProcess")
	public String registerProgramProcess(HttpSession session, ProgramDto programDto, MultipartFile imageFile) {
		
		// 교직원 pk 입력
		StaffInfoDto staffInfoDto = (StaffInfoDto)session.getAttribute("sessionStaffInfo");
		
		if(staffInfoDto != null) {
			int staffPk = staffInfoDto.getStaff_pk();
			programDto.setStaff_pk(staffPk);
		}
		
		
		// 이미지 입력
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd/");
			
		
		if(imageFile != null && !imageFile.isEmpty()) {
			String imageRootPath = "C:/Workspace/GitWorkspace/toothless/src/main/webapp/resources/img/employment/";
			String imageTodayPath = sdf.format(new Date());
			
			File todayFolderForCreate = new File(imageRootPath + imageTodayPath);
			
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs();
			}
			
			String originalFileName = imageFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			String fileName = uuid + "_" + currentTime;
			
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			fileName += ext;
			
			try {
				imageFile.transferTo(new File(imageRootPath + imageTodayPath + fileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			programDto.setPrg_main_image(imageTodayPath + fileName);
		}

		programService.registerProgramInfo(programDto);
		
		return "redirect:../common/staffMainPage";
	}
	
	@RequestMapping("programListPage")
	public String programListPage() {
		
		
		
		return "/tl_d/gw_program/registerProgramPage";
	}
	
	

}

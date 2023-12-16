package com.mkfactory.toothless.a.student.sj.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.a.dto.RequestRepairDto;
import com.mkfactory.toothless.a.student.jw.service.DormStudentServiceJw;
import com.mkfactory.toothless.a.student.sj.service.RequestRepairServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;


@Controller
@RequestMapping("/tl_a/student/*")
public class RequestRepaireController {
	
	@Autowired
	private DormStudentServiceJw dormStudentServiceJw;
	
	@Autowired
	private RequestRepairServiceImpl repairService;

	@RequestMapping("sj_requestRepairPage")
	public String reqeustRepairPage() {
		return "/tl_a/student/sj_requestRepairPage";
	}
	
	@RequestMapping("sj_requestWritePage")
	public String requestWritePage(HttpSession session, Model model) {
		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		if(studentInfoDto == null) {
			return "redirect:../../tl_a/student/loginPage";
		}
		int studentPk = studentInfoDto.getStudent_pk();
		 
		if(session.getAttribute("sessionStudentInfo") != null && dormStudentServiceJw.checkDormStudent(studentPk) == 0) {
			// 로그인 한 학생이 사생이 아니면 반환 (사생페이지)
			return "redirect:../../tl_a/student/loginPage";
		} else {
			model.addAttribute("studentInfoDto", studentInfoDto);
			model.addAttribute("dormStudentDto", dormStudentServiceJw.getDormStudentByStudentPk(studentPk));
			return "tl_a/student/sj_requestWritePage";
		}
		
	}
	
	@RequestMapping("requestRepairWriteProcess")
	public String requestWriteProcess(HttpSession session, RequestRepairDto repairDto, 
						Model model, int[] categoryList,MultipartFile[] imgs) {
	
		
		List<RequestRepairDto> repairList = new ArrayList<>();
				
		if(imgs != null) {
			for(MultipartFile multipartFile : imgs) {
				if(multipartFile.isEmpty()) {
					continue;
				}

				String rootPath = "C:/requestRepairImg/";
				
				// 날짜별 폴더 생성.
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
				String todayPath = sdf.format(new Date());
				
				File todayFolderForCreate = new File(rootPath + todayPath);
				
				if(!todayFolderForCreate.exists()) {
					todayFolderForCreate.mkdirs();
				}
				
				String originalFileName = multipartFile.getOriginalFilename();

				//파일명 충돌 회피 - 랜덤, 시간 조합
				String uuid = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				String fileName = uuid + "_" + currentTime;
				
				// 확장자 추출
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				fileName += ext;
				
				try {
					multipartFile.transferTo(new File(rootPath + todayPath + fileName));					
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				RequestRepairDto requestRepairDto = new RequestRepairDto();
				requestRepairDto.setImage_link(todayPath + fileName);

				//articleImageDto.setOriginal_filename(originalFileName);
				
				repairList.add(requestRepairDto);
				}
			StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
			if(studentInfoDto == null) {
				return "redirect:../../tl_a/student/loginPage";
			}
			int studentPk = studentInfoDto.getStudent_pk();
			 
			if(session.getAttribute("sessionStudentInfo") != null && dormStudentServiceJw.checkDormStudent(studentPk) == 0) {
				// 로그인 한 학생이 사생이 아니면 반환 (사생페이지)
				return "redirect:../../tl_a/student/loginPage";
			} else {
				model.addAttribute("studentInfoDto", studentInfoDto);
				model.addAttribute("dormStudentDto", dormStudentServiceJw.getDormStudentByStudentPk(studentPk));
				
				return "/tl_a/student/sj_requestRepairPage";
			}
			
			
			
			
		}
	
			repairService.insertRequestRepair(repairDto);
			return "/tl_a/student/sj_requestRepairPage";
		
		
	}
	
	
}

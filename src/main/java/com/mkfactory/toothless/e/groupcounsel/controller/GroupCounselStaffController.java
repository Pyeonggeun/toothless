package com.mkfactory.toothless.e.groupcounsel.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselCounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.groupcounsel.service.GroupCounselStaffServiceImpl;

@Controller
@RequestMapping("/tl_e/groupcounsel/staff/*")
public class GroupCounselStaffController {
	
	@Autowired
	GroupCounselStaffServiceImpl groupCounselStaffService;
	
	@RequestMapping("groupCounselRegisterPage")
	public String groupCounselRegisterPage() {
		
		return "/tl_e/groupcounsel/staff/groupCounselRegisterPage";
	}
	
	@RequestMapping("groupCounselRegisterProcess")
	public String groupCounselRegisterProcess(GroupCounselDto params, MultipartFile mainImageFile) {
																
		if(mainImageFile != null) {

			String rootPath = "C:/uploadFiles/";
			
			// 날짜별 폴더 생성.
			//simpledateformat은 날짜를 문자로, 문자를 날짜로 바꾸는 api
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayPath = sdf.format(new Date());
			
			File todayFolderForCreate = new File(rootPath + todayPath);
			
			if(!todayFolderForCreate.exists()) { // 폴더가 없다면
				todayFolderForCreate.mkdirs(); // 폴더생성
			}
			
			
			String originalFileName = mainImageFile.getOriginalFilename();
			
			// 파일명 충돌 회피 - 랜덤, 시간 조합
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			String fileName = uuid + "_" + currentTime;
			
			// 확장자 추출
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			fileName += ext;
			
			
			try {
				// transferto는 파일명 적어주면 그 공간에 저장해줌(서버에 저장)
				mainImageFile.transferTo(new File(rootPath + todayPath + fileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			params.setPosterImage(todayPath + fileName);  
		}		
		
		groupCounselStaffService.groupCounselRegister(params);
		
		
		
		return "redirect: ./groupCounselListPage";
	}
	
	@RequestMapping("groupCounselListPage")
	public String groupCounselListPage(Model model) {
		                                     
		List<Map<String, Object>> groupCounselList = groupCounselStaffService.readGroupCounselList();
		
		model.addAttribute("groupCounselList", groupCounselList);
		
		return "/tl_e/groupcounsel/staff/groupCounselListPage";
	}
	
	@RequestMapping("groupCounselDetailPage")
	public String groupCounselDetailPage(Model model, int id) {
		
		Map<String, Object> map = groupCounselStaffService.readGroupCounselDetail(id);
		
		model.addAttribute("groupCounselDetail", map);
		
		return "/tl_e/groupcounsel/staff/groupCounselDetailPage";
	}
	
	@RequestMapping("counselorAddPage")
	public String counselorAddPage(Model model, int group_counsel_id) {
		
		
		model.addAttribute("counselorList", groupCounselStaffService.readGrouopCounselCounselorList());
		model.addAttribute("group_counsel_id", group_counsel_id);
		
		return "/tl_e/groupcounsel/staff/counselorAddPage";
	}
	
	@RequestMapping("counselorAddProcess")
	public String counselorAddProcess(GroupCounselCounselorDto groupCounselCounselorDto) {
		groupCounselStaffService.insertGroupCounselCounselor(groupCounselCounselorDto);
		
		return "redirect: ./groupCounselDetailPage?id=" + groupCounselCounselorDto.getGroup_counsel_id();
	}
	
	
	
	
	
	
}

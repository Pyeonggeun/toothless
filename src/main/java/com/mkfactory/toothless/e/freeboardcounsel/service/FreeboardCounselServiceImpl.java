package com.mkfactory.toothless.e.freeboardcounsel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.freeboardcounsel.mapper.FreeboardCounselSqlMapper;

@Service
public class FreeboardCounselServiceImpl {

	@Autowired
	FreeboardCounselSqlMapper freeboardCounselSqlMapper;
	
	public void createFreeboardPostsProcess(FreeboardDto paraFreeboardDto) {
		freeboardCounselSqlMapper.insertFreeboardPosts(paraFreeboardDto);
	}
	
	public List<Map<String, Object>> getfreeboardList(){
			
		List<Map<String, Object>> combinedFreeboardList= new ArrayList<>();
		
		List<FreeboardDto> freeboardList = freeboardCounselSqlMapper.selectfreeboardList();
		System.out.println("selectfreeboardList 실행");
		
		for(FreeboardDto elementFreeboardDto : freeboardList) {
			int student_pk = elementFreeboardDto.getStudent_pk();
				System.out.println("int student_pk : " + student_pk);
			StudentInfoDto studentInfo  = freeboardCounselSqlMapper.selectStudentInfo(student_pk);
				System.out.println("StudentInfo.getStudent_id : "+studentInfo.getStudent_id());
			Map<String, Object> freeboardMap = new HashMap<>();
			freeboardMap.put("studentInfo", studentInfo);
			freeboardMap.put("elementFreeboardDto", elementFreeboardDto);
			
			System.out.println("combinedFreeboardList.add 실행 ");
			combinedFreeboardList.add(freeboardMap);
		}
		return combinedFreeboardList;
	}
}

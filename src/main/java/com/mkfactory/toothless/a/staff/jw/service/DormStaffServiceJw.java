package com.mkfactory.toothless.a.staff.jw.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.staff.jw.mapper.DormStaffMapperJw;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class DormStaffServiceJw {

	@Autowired
	private DormStaffMapperJw dormStaffMapperJw;
	
	
	public List<Map<String, Object>> getAllExitSituation() {
		// 기숙사에 등록되어있는 학생 리스트 안에 있는 학생 정보
//		List<StudentInfoDto> allDormStudentList = dormStaffMapperJw.selectAllStudentInDormStudent();
//		
//		for(StudentInfoDto studentInfo : allDormStudentList) {
//			// 기숙사에 등록되어있는 학생 리스트 안에 있는 학생 정보의 학생PK값 저장
//			int studentPk = studentInfo.getStudent_pk();
//			
//			// 학생PK의 사생정보
//			DormStudentDto dormStudentDto = dormStaffMapperJw.selectDormStudentInfoByStudentPk(studentPk);
//			
//			// 특정 사생의 호실키 찾기
//			int someRoomPk = dormStudentDto.getDorm_room_pk();
//			
//		}
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<ExitDto> exitList = dormStaffMapperJw.selectExitList();
		
		for(ExitDto exitDto : exitList) {
			
			int dormStudentPk = exitDto.getDorm_student_pk();
			StudentInfoDto studentInfoDto = dormStaffMapperJw.selectStudentInfoByDormStudentPk(dormStudentPk);
			DormRoomDto dormRoomDto = dormStaffMapperJw.selectDormRoomByDormStudentPk(dormStudentPk);
			
			System.out.println("dormStudentPk 출력");
			System.out.println(dormStudentPk);
			System.out.println("=============");
			int dormPk = dormRoomDto.getDorm_pk();
			DormBuildingDto dormBuildingDto = dormStaffMapperJw.selectDormByDormPk(dormPk);
			System.out.println("dormPk 출력");
			System.out.println(dormPk);
			System.out.println("=============");
			Map<String, Object> map = new HashMap<>();
			map.put("exitDto", exitDto);
			map.put("studentInfoDto", studentInfoDto);
			map.put("dormRoomDto", dormRoomDto);
			map.put("dormBuildingDto", dormBuildingDto);
			
			list.add(map);
		}
		
		return list;
	}
	
}

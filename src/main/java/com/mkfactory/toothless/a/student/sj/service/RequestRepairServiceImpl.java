package com.mkfactory.toothless.a.student.sj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.RequestRepairDto;
import com.mkfactory.toothless.a.student.sj.mapper.RequestRepairSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class RequestRepairServiceImpl {
	@Autowired
	private RequestRepairSqlMapper requestRepairSqlMapper;
	
	
	
	public void insertRequestRepair(RequestRepairDto requestRepairDto){
		requestRepairSqlMapper.insertRequestRepair(requestRepairDto);
	}
	
	public List<RequestRepairDto> printingAllRequestRepairArticle() {
		return requestRepairSqlMapper.printingArticles();
	}
	
	public List<DormStudentDto> forDormStudentsList(){
		return requestRepairSqlMapper.dormStudents();
	}
	
	public List<Map<String, Object>> printPage() {
		return requestRepairSqlMapper.printingPage();
	}
	
	public Map<String, Object> printingOne(int id){
		Map<String, Object> repairMap =new HashMap<>();
		
		RequestRepairDto repairDto = requestRepairSqlMapper.selectArticle(id);//repair_pk
		
		int dormstudent_pk = repairDto.getDorm_student_pk();
		DormStudentDto dormStudentDto = requestRepairSqlMapper.selectDormStudentPk(dormstudent_pk);
		
		int student_pk = dormStudentDto.getStudent_pk();
		StudentInfoDto studentInfo = requestRepairSqlMapper.studentPk(student_pk);
		
		repairMap.put("dormStudentDto", dormStudentDto);
		repairMap.put("repairDto", repairDto);
		repairMap.put("studentInfo", studentInfo);
		
		return repairMap;
	}
	
	public void deleteRequestRepairArticle(int request_repair_pk) {
		
		requestRepairSqlMapper.deleteRequestRepair(request_repair_pk);
	}
	

	
}

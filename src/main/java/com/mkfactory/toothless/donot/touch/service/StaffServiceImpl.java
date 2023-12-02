package com.mkfactory.toothless.donot.touch.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.CenterCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.GraduationInfoDto;
import com.mkfactory.toothless.donot.touch.dto.ProfessorInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentSemesterDto;
import com.mkfactory.toothless.donot.touch.mapper.StaffSqlMapper;

@Service
public class StaffServiceImpl {
	@Autowired
	private StaffSqlMapper staffSqlMapper;
	
	
	public StaffInfoDto loginByStaffIdAndPassword(StaffInfoDto staffInfoDto){
		
		return staffSqlMapper.selectStaffByIdAndPassword(staffInfoDto);
		
	}
	
	public void insertStudentInfo(StudentInfoDto studentInfoDto, int semester_count, int graduation, double scoreAVG ) {
		
		int studetn_pk = staffSqlMapper.getStudentPk();
		studentInfoDto.setStudent_pk(studetn_pk);
		
		staffSqlMapper.insertStudentInfo(studentInfoDto); 
		
		for(int x = 0 ; x <= (semester_count*2); x++ ) {
			StudentSemesterDto studentSemesterDto = new StudentSemesterDto();
			studentSemesterDto.setStudent_pk(studetn_pk);
			studentSemesterDto.setSemester_pk(x);
			studentSemesterDto.setTotal_score(scoreAVG);
			
			staffSqlMapper.insertSemesterInfo(studentSemesterDto);
		}
		
		if(graduation == 1) {
			staffSqlMapper.insertGraduationInfo(studetn_pk);
		}
	}
	
	public Map<String, Object> getProfessorAndDepqrtmentList(){
		Map<String, Object> map = new HashMap<>();
		
		List<ProfessorInfoDto> professorList = staffSqlMapper.selectProfessorList();
		List<DepartmentCategoryDto> departmentList = staffSqlMapper.selectDepartmentList();
		List<CenterCategoryDto> centerList = staffSqlMapper.selectCenterList();
		
		map.put("professorList", professorList);
		map.put("departmentList", departmentList);
		map.put("centerList", centerList);
		
		return map;
		
	}
	
	public void insertStaffInfo(StaffInfoDto staffInfoDto) {
		
		staffSqlMapper.insertStaff(staffInfoDto);
		
	}
	public void insertProfessorInfo(ProfessorInfoDto professorInfoDto) {
		
		staffSqlMapper.insertProfessor(professorInfoDto);
	}
}

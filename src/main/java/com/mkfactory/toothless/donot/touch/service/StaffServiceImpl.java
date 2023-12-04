package com.mkfactory.toothless.donot.touch.service;

import java.util.ArrayList;
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
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;

@Service
public class StaffServiceImpl {
	@Autowired
	private StaffSqlMapper staffSqlMapper;
	@Autowired
	private StudentSqlMapper studentSqlMapper;
	
	public StaffInfoDto loginByStaffIdAndPassword(StaffInfoDto staffInfoDto){
		
		return staffSqlMapper.selectStaffByIdAndPassword(staffInfoDto);
		
	}
	
	public void insertStudentInfo(StudentInfoDto studentInfoDto, int semester_count, boolean graduation, double scoreAVG ) {
		
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
		
		if(graduation == true) {
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
	
	public boolean checkStudentId(String student_id) {
		if(staffSqlMapper.selectExistsCheckStudentId(student_id) == 0) {
			return false;
		}else {
			return true;
		}
		
	}
	
	public boolean checkStaffId(String staff_id) {
		if(staffSqlMapper.selectExistsCheckStaffId(staff_id) == 0) {
			return false;
		}else {
			return true;
		}
		
	}
	
	public boolean checkProfessorId(String professor_id) {
		if(staffSqlMapper.selectExistsCheckProfessorId(professor_id) == 0) {
			return false;
		}else {
			return true;
		}
		
	}
	
	public List<Map<String, Object>> getStudentList(){
		List<Map<String, Object>> listMap = new ArrayList<>();
		List<StudentInfoDto> studentInfoDtoList = staffSqlMapper.selectStudnetList();
		
		for(StudentInfoDto studentInfoDto : studentInfoDtoList) {
			int student_pk = studentInfoDto.getStudent_pk();
			
			int graduationInfo =  studentSqlMapper.selectGraduationInfo(student_pk);
			int studentYear = studentSqlMapper.selectStudentYear(student_pk);
			String departmentName = studentSqlMapper.selectStudnetDepartmentName(studentInfoDto.getDepartment_pk());
			ProfessorInfoDto professorInfoDto = studentSqlMapper.selectMyProfessor(studentInfoDto.getProfessor_pk());
			
			Map<String, Object> map = new HashMap<>();
			
			map.put("graduationInfo", graduationInfo);
			map.put("studentYear", studentYear);
			map.put("departmentName", departmentName);
			map.put("professorInfoDto", professorInfoDto);
			map.put("studentInfoDto", studentInfoDto);
			
			listMap.add(map);
		}
		
		
		return listMap;
	}
	
	
	
}

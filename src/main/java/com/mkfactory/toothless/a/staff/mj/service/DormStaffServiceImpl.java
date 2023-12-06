package com.mkfactory.toothless.a.staff.mj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.mapper.DormStaffSqlMapper;
import com.mkfactory.toothless.a.student.mj.mapper.DormStudnetSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;

@Service
public class DormStaffServiceImpl {

	@Autowired
	private DormStaffSqlMapper staffSqlMapper;
	
	@Autowired
	private DormStudnetSqlMapper studentSqlMapper;
	
	@Autowired
	private StudentSqlMapper commonStudentSqlMapper;
	

	
	// 학년도/학기 등록
	public void registerYear(SemesterDto semesterDto) {
		
		staffSqlMapper.insertYear(semesterDto);
	}
	
	
	// 학년도/학기 조회
	public List<SemesterDto> getYearList() {
		
		return staffSqlMapper.selectYearList();
	}

	
	// 현재 학년도/학기 조회
	public SemesterDto getThisSemester() {
		
		return staffSqlMapper.selectThisSemester();
	}
	
	// 입주 공고 등록
	public void registerInfo(JoinDormInfoDto joinDormInfoDto) {
		
		staffSqlMapper.insertInfo(joinDormInfoDto);
	}
	
	// 공고 전체 조회
	public List<JoinDormInfoDto> getAllDormInfoList() {
		
		return staffSqlMapper.selectAllDormInfoList();
	}
	
	// 입사신청정보(학생정보, 학과정보, 학년, 입사신청정보..) 전체 조회
	public List<Map<String, Object>> getAllDormApplyList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<JoinDormApplicationDto> allDormApplyList = staffSqlMapper.selectAllDormApplyList();
		
		for(JoinDormApplicationDto applyInfo : allDormApplyList) {
			
			// 입사신청 학생정보
			StudentInfoDto studentInfo = studentSqlMapper.selectStudentInfoByStudentPk(applyInfo.getStudent_pk());
			DepartmentCategoryDto departmentInfo = studentSqlMapper.selectDeparmentInfoByPk(studentInfo.getDepartment_pk());
			int studentYear = commonStudentSqlMapper.selectStudentYear(applyInfo.getStudent_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("applyInfo", applyInfo);
			map.put("studentInfo", studentInfo);
			map.put("departmentInfo", departmentInfo);
			map.put("studentYear", studentYear);

			list.add(map);
		}
		
		return list;
	}
	
	
	// 선발상태 업데이트
	public void updateSelectionStatus(String selection_status, int dorm_application_pk) {
		
		staffSqlMapper.updateSelectionStatus(selection_status, dorm_application_pk);
	}
	

	// 선발된 정보(학생정보, 학과정보, 학년, 입사신청정보..) 전체 조회
	public List<Map<String, Object>> getAllDormSelectedList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<JoinDormApplicationDto> allDormSelectedList = staffSqlMapper.selectAllDormSelectedList();
		
		for(JoinDormApplicationDto selectedDto : allDormSelectedList) {
			
			// 선발된 학생정보
			StudentInfoDto studentInfo = studentSqlMapper.selectStudentInfoByStudentPk(selectedDto.getStudent_pk());
			DepartmentCategoryDto departmentInfo = studentSqlMapper.selectDeparmentInfoByPk(studentInfo.getDepartment_pk());
			int studentYear = commonStudentSqlMapper.selectStudentYear(selectedDto.getStudent_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("selectedDto", selectedDto);
			map.put("studentInfo", studentInfo);
			map.put("departmentInfo", departmentInfo);
			map.put("studentYear", studentYear);

			list.add(map);
		}
		
		return list;
	}
	
	
	// 납부상태 업데이트
	public void updatePaymentStatus(String payment_status, int dorm_application_pk) {
		
		staffSqlMapper.updatePaymentStatus(payment_status, dorm_application_pk);
	}
	
	// 납부완료 정보(학생정보, 학과정보, 학년, 입사신청정보..) 전체 조회
	public List<Map<String, Object>> getPaymentYesList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<JoinDormApplicationDto> paymentYesList = staffSqlMapper.selectPaymentYesList();
		
		for(JoinDormApplicationDto paymentYesDto : paymentYesList) {
			
			// 선발된 학생정보
			StudentInfoDto studentInfo = studentSqlMapper.selectStudentInfoByStudentPk(paymentYesDto.getStudent_pk());
			DepartmentCategoryDto departmentInfo = studentSqlMapper.selectDeparmentInfoByPk(studentInfo.getDepartment_pk());
			int studentYear = commonStudentSqlMapper.selectStudentYear(paymentYesDto.getStudent_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("paymentYesDto", paymentYesDto);
			map.put("studentInfo", studentInfo);
			map.put("departmentInfo", departmentInfo);
			map.put("studentYear", studentYear);

			list.add(map);
		}
		
		return list;
	}
	
	
	// 미납부 정보(학생정보, 학과정보, 학년, 입사신청정보..) 전체 조회
	public List<Map<String, Object>> getPaymentNoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<JoinDormApplicationDto> paymentNoList = staffSqlMapper.selectPaymentNoList();
		
		for(JoinDormApplicationDto paymentNoDto : paymentNoList) {
			
			// 선발된 학생정보
			StudentInfoDto studentInfo = studentSqlMapper.selectStudentInfoByStudentPk(paymentNoDto.getStudent_pk());
			DepartmentCategoryDto departmentInfo = studentSqlMapper.selectDeparmentInfoByPk(studentInfo.getDepartment_pk());
			int studentYear = commonStudentSqlMapper.selectStudentYear(paymentNoDto.getStudent_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("paymentNoDto", paymentNoDto);
			map.put("studentInfo", studentInfo);
			map.put("departmentInfo", departmentInfo);
			map.put("studentYear", studentYear);
			
			list.add(map);
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

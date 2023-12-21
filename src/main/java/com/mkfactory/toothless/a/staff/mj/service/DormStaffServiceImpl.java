package com.mkfactory.toothless.a.staff.mj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.JoinDormApplicationDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.staff.mj.mapper.DormStaffSqlMapper;
import com.mkfactory.toothless.a.student.mj.mapper.DormStudnetSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.donot.touch.mapper.StudentSqlMapper;
import com.mkfactory.toothless.donot.touch.service.AlarmApi;

@Service
public class DormStaffServiceImpl {

	@Autowired
	private DormStaffSqlMapper staffSqlMapper;
	
	@Autowired
	private DormStudnetSqlMapper studentSqlMapper;
	
	@Autowired
	private StudentSqlMapper commonStudentSqlMapper;
	
	@Autowired
	private AlarmApi alarmApi;
	
	
	// 학년도/학기 등록
	public void registerYear(SemesterDto semesterDto) {
		
		staffSqlMapper.insertYear(semesterDto);
	}
	
	// 학년도/학기 수정
	public void updateSemester(int SEMESTER_PK) {
		
		staffSqlMapper.updateThisSemester(SEMESTER_PK);
		staffSqlMapper.updateNotThisSemester(SEMESTER_PK);
	}
	
	// 학년도/학기 삭제
	public void deleteSemester(int SEMESTER_PK) {
		
		staffSqlMapper.deleteSemester(SEMESTER_PK);
	}
	
	
	// 학년도/학기 조회
	public List<Map<String, Object>> getYearList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<SemesterDto> yearList = staffSqlMapper.selectYearList();
		
		for(SemesterDto yearInfo : yearList) {
			
			int countSomeSemesterJoinInfo = staffSqlMapper.countSomeSemesterJoinInfo(yearInfo.getSemester_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("yearInfo", yearInfo);
			map.put("countSomeSemesterJoinInfo", countSomeSemesterJoinInfo);
	
			list.add(map);
		}
		
		return list;
	}

	
	// 현재 학년도/학기 조회
	public SemesterDto getThisSemester() {
		
		return staffSqlMapper.selectThisSemester();
	}
	
	// 입주 공고 등록
	public void registerInfo(JoinDormInfoDto joinDormInfoDto) {
		
		staffSqlMapper.insertInfo(joinDormInfoDto);
	}
	
	// 입주 공고 수정
	public void updateJoinInfo(JoinDormInfoDto joinDormInfoDto) {
		
		staffSqlMapper.updateJoinInfo(joinDormInfoDto);
	}
	
	// 입주 공고 삭제
	public void deleteJoinInfo(int DORM_INFO_PK) {
		
		staffSqlMapper.deleteJoinInfo(DORM_INFO_PK);
	}
	
	// 공고 전체 조회
	public List<Map<String, Object>> getAllDormInfoList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<JoinDormInfoDto> allDormInfoList = staffSqlMapper.selectAllDormInfoList();
		
		for(JoinDormInfoDto joinInfo : allDormInfoList) {
			
			int countSomeApplyInfo = staffSqlMapper.countSomeApplyInfo(joinInfo.getDorm_info_pk());
			
			Map<String, Object> map = new HashMap<>();
			map.put("joinInfo", joinInfo);
			map.put("countSomeApplyInfo", countSomeApplyInfo);

			list.add(map);
		}
		
		return list;
	}
	
	// 현재학기에 해당하는 년도의 모든 학기들..
	public List<Map<String, Object>> getThisYearAllSemester(){
		
		return staffSqlMapper.selectThisYearAllSemester();
	}
	
	// 이전년도들..
	public List<Map<String, Object>> getBeforeYearAll(){
		
		return staffSqlMapper.selectBeforeYearAll();
	}
	
	// 이전년도의 모든 학기들..
	public List<Map<String, Object>> getBeforeYearAllSemester(){
		
		return staffSqlMapper.selectBeforeYearAllSemester();
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
	
	// 알람보낼애들 pk
	public JoinDormApplicationDto selectStudentPkForAlram(int dorm_application_pk) {
		return staffSqlMapper.selectStudentPkForAlram(dorm_application_pk);
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
	
	// --------------------------------------------
	// 메인페이지 공고리스트
	public List<DormNoticeDto> getDormNotice(){
		return staffSqlMapper.selectDormNotice();
	}
	
	// 현황
	public int getCountExecutive() {
		return staffSqlMapper.countExecutive();
	}
	
	public int getCountTodayDiary() {
		return staffSqlMapper.countTodayDiary();
	}
	
	public int getCountPlusPointDormStudent() {
		return staffSqlMapper.countPlusPointDormStudent();
	}
	
	public int getCountMinusPointDormStudent() {
		return staffSqlMapper.countMinusPointDormStudent();
	}
	
	public int getCountTodayExit() {
		return staffSqlMapper.countTodayExit();
	}
	
	public int getCountTodayCallAbsence() {
		return staffSqlMapper.countTodayCallAbsence();
	}
	
	// 사생 배정 현황 끌고오는 ~ing
	public int assignedDormStudentCount() {
		
		return staffSqlMapper.assignedDormStudentCount();	
	}
	
	// 특정날짜 일지리스트
	public List<Map<Object, String>> selectSomeDayDiaryList(int month, int day) {
		
		return staffSqlMapper.selectSomeDayDiaryList(month, day);
	}
	
	
	
}

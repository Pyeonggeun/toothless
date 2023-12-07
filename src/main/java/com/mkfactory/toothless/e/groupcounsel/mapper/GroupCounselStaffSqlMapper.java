package com.mkfactory.toothless.e.groupcounsel.mapper;

import java.util.List;

import com.mkfactory.toothless.donot.touch.dto.DepartmentCategoryDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.CounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselCounselorDto;
import com.mkfactory.toothless.e.dto.GroupCounselDto;
import com.mkfactory.toothless.e.dto.GroupCounselReservationDto;

public interface GroupCounselStaffSqlMapper {
	
	// 집단상담 등록
	public void insertGroupCounsel(GroupCounselDto groupCounselDto);
	
	// 등록된 상담 리스트
	public List<GroupCounselDto> selectGroupCounselList();
	
	// 신청 가능 인원 - 신청 인원 수
	public int selectGroupCounselReservationCount(int group_counsel_id);
	
	// 신청현황 리스트
	public List<GroupCounselReservationDto> selectGroupCounselReservationList(int group_counsel_id);
	
	// 학생 Dto
	public StudentInfoDto selectStudentInfoById(int student_pk);
	
	// 집당상담 등록된 상담원
	public List<GroupCounselCounselorDto> selectGroupCounselByCounselor(int group_counsel_id);
	
	//
	public CounselorDto selectCounselorById(int counselor_id);
	
	//
	public DepartmentCategoryDto selectDepartmentCatecoryByStudentId (int department_Pk);
	
	//집단 상담 상담원 등록
	public void insertGroupCounselCounselor(GroupCounselCounselorDto groupCounselCounselorDto);
	
	//상담원 리스트
	public List<CounselorDto> selectCounselorList();
	
	// 학생 출석체크
	public void studentIsAttendSetN(int id);
	
	public void studentIsAttendSetY(int id);
	
	public GroupCounselReservationDto selectGroupCounselReservationById(int id);
	
	// pk별 집단 상담
	public GroupCounselDto selectGroupCounselById(int id);
}

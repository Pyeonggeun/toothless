package com.mkfactory.toothless.a.staff.jw.mapper;

import java.util.List;

import com.mkfactory.toothless.a.dto.CallAbsenceDto;
import com.mkfactory.toothless.a.dto.DiaryDto;
import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.ExecutiveDto;
import com.mkfactory.toothless.a.dto.ExecutiveManagementDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.PointDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormStaffMapperJw {

	// 외출/외박 신청
	public List<ExitDto> selectExitList();
//	
	// 특정 학생정보(by 사생키)
	public StudentInfoDto selectStudentInfoByProgressSemesterDormStudentPk(int dorm_student_pk);
	
	// 특정 학생 호실정보(by 사생키)
	public DormRoomDto selectDormRoomByDormStudentPk(int dorm_student_pk);
	
	// 특정 학생 동정보
	public DormBuildingDto selectDormByDormPk(int dorm_pk);
	
	// 전체 사생정보
	public List<DormStudentDto> selectAllDormStudentList();
	
	// 진행중인 학기의 사생정보
	public List<DormStudentDto> selectDormStudentByProgressSemester();
	public List<DormStudentDto> selectDormStudentByProgressSemesterAndDormRoom(int dorm_room_pk);
	public List<DormStudentDto> selectDormStudentExceptExecuteByProgressSemester();
	
	// 임원
	public void insertExecutive(int dorm_student_pk);
	public ExecutiveDto selectExecutiveByDormStudentPk(int dorm_student_pk);
	public ExecutiveDto  selectExecutiveByExecutivePk(int executive_pk);
	public void deleteExecutiveByDormStudentPk(int dorm_student_pk);
	public List<ExecutiveDto> selectAllExecutiveList();
	
	// 임원 방배정
	public List<DormRoomDto> selectDormRoomListByDormFloorAndDormPk(int dorm_floor, int dorm_pk);
	public int countExecutivePerRoomPk(int executive_pk, int dorm_room_pk);
	public void deleteExecutivePerRoomPk(int executive_pk, int dorm_room_pk);
	
	// 임원 관리
	public void insertExecutiveManagement(ExecutiveManagementDto executiveManagementDto);
	public List<DormRoomDto> selectPersonalExecutiveRoomList(int executive_pk);
	
	// 일지 관리
	public List<DiaryDto> selectAllDiaryList();
	
	// 상벌점
	public void insertPoint(PointDto pointDto);
	public List<PointCategory> selectAllPointCategory();
	public Integer sumPointByDormStudentPk(int dorm_student_pk);
	
	// 상벌코드
	public void insertPointCategory(PointCategory pointCategory);
	public void deletePointCategory(int point_category_pk);
	public void updatePointCategory(PointCategory pointCategory);
	
	// 상벌코드 목록
	public List<PointCategory> selectPointCategoryAll();
	public List<PointCategory> selectPointCategoryPlus();
	public List<PointCategory> selectPointCategoryMinus();
	
	
	// 점호 불참
	public List<CallAbsenceDto> selectAllCallAbsenceList();
	public List<DormStudentDto> selectCallAbsenceDormStudentList();
	
}

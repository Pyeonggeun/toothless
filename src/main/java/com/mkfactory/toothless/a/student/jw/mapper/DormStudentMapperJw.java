package com.mkfactory.toothless.a.student.jw.mapper;


import java.util.List;

import com.mkfactory.toothless.a.dto.DiaryDto;
import com.mkfactory.toothless.a.dto.DormBuildingDto;
import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.DormRoomDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.ExecutiveDto;
import com.mkfactory.toothless.a.dto.ExecutiveManagementDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.PointDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormStudentMapperJw {

	// 외출/외박 신청페이지
	public int countDormStudentByStudentAndProgressSemester(int student_pk);
	public DormStudentDto selectDormStudentByStudentAndProgressSemester(int student_pk);
	public void insertExit(ExitDto exitDto);
	
	// 상/벌점 확인페이지
	public List<PointDto> selectPointByStudentAndProgressSemester(int student_pk);
	public PointCategory selectPointCategoryByPointCategoryPk(int point_category_pk);
	public Integer sumTotalPointByStudentPk(int student_pk);
	
	// 일지 작성 페이지
	public int countDormStudentByStudentAndProgressSemesterAndExecutive(int student_pk);
	public ExecutiveDto selectDormStudentByStudentAndProgressSemesterAndExecutive(int student_pk);
	public void insertDiary(DiaryDto diaryDto);
	
	// 최근 글 3개 가져오기
	public List<DormNoticeDto> resentBoardthree();
	
	// 임원 관리(점호참석)
	public List<ExecutiveManagementDto> selectExecutiveManagementByExecutivePk(int executive_pk);
	public int countTodayCallAbsence(int executive_management_pk);
	public void insertCallAbsence(int executive_management_pk);
	public void deleteTodayCallAbsenceByExecutiveManagementPk(int executive_management_pk);
	public StudentInfoDto selectStudentInfoByDormStudentPk(int dorm_student_pk);
	public DormRoomDto selectDormRoomByDormStudentPk(int dorm_student_pk);
	public DormBuildingDto selectDormByDormPk(int dorm_pk);
	public ExecutiveDto selectExecutiveInfoByStudentPk(int student_pk);
	
}

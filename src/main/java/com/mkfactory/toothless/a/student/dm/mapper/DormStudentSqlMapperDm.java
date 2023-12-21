package com.mkfactory.toothless.a.student.dm.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface DormStudentSqlMapperDm {
	
	public SemesterDto semesterByProgressState();
	public JoinDormInfoDto joinDormInfoBySemesterPk(int semester_pk);
	public List<DormNoticeDto> dormNoticeAllList();
	
	public StaffInfoDto staffInfoByStaffPk(int staff_pk);
	public void dormNoticeInsertByDormNoticeDto(DormNoticeDto dormNoticeDto);
	public DormNoticeDto dormNoticeInfoByDormNoticePk(int dorm_notice_pk);
	public void deleteDormNoticeInfoByDormNoticePk(int dorm_notice_pk);
	
	// 전체 학생정보 리스트 출력 && 상세정보출력
	public List<StudentInfoDto> studentListAll();
	public StudentInfoDto studentInfoByStudentPk(int student_pk);
	public int studentListCount();
	
	// 사생 배정인원 카운트 && 배정이 필요한 인원 카운트
	public int assignPeopleCount();
	public int assignPeopleNeedCount();
	
	// 임원 배정인원 카운트 && 일지 카운트 && 오늘외출,외박 신청수
	public int executiveCount();
	public int diaryTodayCount();
	public int todayOutingCount();
	
	// 동카운트 && 호카운트 && 현재학기이름
	public int dongCount();
	public int roomCount();
	public SemesterDto semesterName();
	
	// 미선발인원(입주신청후 선발안된애들) && 미납인원(선발은 ok 돈을 아직 지불안함)
	public int selectionStatusN();
	public int unpaidCount();
	
	// 상벌점리스트카운트 && 오늘 부여된것..
	public int pointListCount();
	public int todayPointCreditCount();
	
	// 공지 작성글수 && 최근글제목
	public int noticeCount();
	public String noticeRecentWriteTitle();
	
	// 자유게시판글 수 && 최근글제목
	public int freeboardCount();
	public String freeboardRecentWriteTitle();
	
	// 시설물전체요청 수 && 오늘요청한 수
	public int requestCount();
	public int todayRequestCount();
	
	// 임원 리스트출력 && 동호 리스트 출력(층 까지만)
	public List<Map<String, Object>> executiveList();
	public List<Map<String, Object>> dongHoList();
	
	// 
	public List<SemesterDto> semesterAllList();
	public List<PointCategory> poingCategoryList();
	public List<Map<String, Object>> dongHoAssignList();
	
	//
	public List<Map<String, Object>> noticeAllList();
	public List<Map<String, Object>> freeboardAllList();
	public List<Map<String, Object>> repaireRequestAllList();
	
	
	
	
	
	
	
	
	
	
}
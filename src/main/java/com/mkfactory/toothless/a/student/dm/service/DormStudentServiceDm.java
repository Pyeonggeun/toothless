package com.mkfactory.toothless.a.student.dm.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.JoinDormInfoDto;
import com.mkfactory.toothless.a.dto.PointCategory;
import com.mkfactory.toothless.a.dto.SemesterDto;
import com.mkfactory.toothless.a.student.dm.mapper.DormStudentSqlMapperDm;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class DormStudentServiceDm {
	
	@Autowired
	public DormStudentSqlMapperDm dormStudentSqlMapperDm;
	
	public Map<String, Object> semesterByProgressState() {
		
		Map<String, Object> map = new HashMap<>();
		
		SemesterDto semesterDto = dormStudentSqlMapperDm.semesterByProgressState();
		int semester_pk = semesterDto.getSemester_pk();
		
		JoinDormInfoDto joinDormInfoDto = dormStudentSqlMapperDm.joinDormInfoBySemesterPk(semester_pk);
		
		map.put("joinDormInfoDto", joinDormInfoDto);
		map.put("semesterDto", semesterDto);
		
		
		return map;
	}
	
	public List<Map<String, Object>> dormNoticeAllList(){
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		List<DormNoticeDto> dormNoticeDto = dormStudentSqlMapperDm.dormNoticeAllList();
		
		for(DormNoticeDto e : dormNoticeDto) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			int staff_pk = e.getStaff_pk();
			StaffInfoDto staffInfoDto = dormStudentSqlMapperDm.staffInfoByStaffPk(staff_pk);
			
			map.put("dormNoticeDto", e);
			map.put("staffInfoDto", staffInfoDto);
			
			list.add(map);
			
		}
		
		return list;
	}
	
	public void dormNoticeInsertByDormNoticeDto(DormNoticeDto dormNoticeDto) {
		
		dormStudentSqlMapperDm.dormNoticeInsertByDormNoticeDto(dormNoticeDto);
	}
	
	public DormNoticeDto dormNoticeInfoByDormNoticePk(int dorm_notice_pk, Boolean escape) {
		
		DormNoticeDto dormNoticeInfo = dormStudentSqlMapperDm.dormNoticeInfoByDormNoticePk(dorm_notice_pk);
		
		if(escape) {
			// html escape
			String content = dormNoticeInfo.getContent();
			content = StringEscapeUtils.escapeHtml4(content);
			content = content.replaceAll("\n", "<br>");
			
			dormNoticeInfo.setContent(content);
		}
		
		
		return dormNoticeInfo;
	}
	
	public void deleteDormNoticeInfoByDormNoticePk(int dorm_notice_pk) {
		
		dormStudentSqlMapperDm.deleteDormNoticeInfoByDormNoticePk(dorm_notice_pk);
	}
	
	public List<StudentInfoDto> studentListAll(){
		
		
		return dormStudentSqlMapperDm.studentListAll();
	}
	
	public StudentInfoDto studentInfoByStudentPk(int student_pk) {
		
		
		return dormStudentSqlMapperDm.studentInfoByStudentPk(student_pk);
	}
	
	public int studentListCount() {
		
		return dormStudentSqlMapperDm.studentListCount();
		
	}
	
	public int assignPeopleCount() {
		
		return dormStudentSqlMapperDm.assignPeopleCount();
		
	}
	
	public int assignPeopleNeedCount() {
		
		return dormStudentSqlMapperDm.assignPeopleNeedCount();
	}
	
	public int executiveCount() {
		
		
		return dormStudentSqlMapperDm.executiveCount();
	}
	
	public int diaryTodayCount() {
		
		
		return dormStudentSqlMapperDm.diaryTodayCount();
	}
	
	public int todayOutingCount() {
		
		
		return dormStudentSqlMapperDm.todayOutingCount();
	}
	
	public int dongCount() {
		
		
		return dormStudentSqlMapperDm.dongCount();
	}
	
	public SemesterDto semesterName() {
		
		return dormStudentSqlMapperDm.semesterName();
	}
	
	public int selectionStatusN() {
		
		return dormStudentSqlMapperDm.selectionStatusN();
	}
	
	public int unpaidCount() {
		
		return dormStudentSqlMapperDm.unpaidCount();
	}
	public int pointListCount() {
		
		return dormStudentSqlMapperDm.pointListCount();
	}
	public int todayPointCreditCount() {
		
		return dormStudentSqlMapperDm.todayPointCreditCount();
	}
	public int roomCount() {
		return dormStudentSqlMapperDm.roomCount();
	}
	public int noticeCount() {
		return dormStudentSqlMapperDm.noticeCount();
	}
	public String noticeRecentWriteTitle() {
		return dormStudentSqlMapperDm.noticeRecentWriteTitle();
	}
	public int freeboardCount() {
		return dormStudentSqlMapperDm.freeboardCount();
	}
	public String freeboardRecentWriteTitle() {
		return dormStudentSqlMapperDm.freeboardRecentWriteTitle();
	}
	public int requestCount() {
		return dormStudentSqlMapperDm.requestCount();
	}
	public int todayRequestCount() {
		return dormStudentSqlMapperDm.todayRequestCount();
	}
	public List<Map<String, Object>> executiveList(){
		return dormStudentSqlMapperDm.executiveList();
	}
	public List<Map<String, Object>> dongHoList(){
		return dormStudentSqlMapperDm.dongHoList();
	}
	public List<SemesterDto> semesterAllList() {
		return dormStudentSqlMapperDm.semesterAllList();
	}
	public List<PointCategory> poingCategoryList(){
		return dormStudentSqlMapperDm.poingCategoryList();
	}
	public List<Map<String, Object>> dongHoAssignList(){
		return dormStudentSqlMapperDm.dongHoAssignList();
	}
	public List<Map<String, Object>> noticeAllList(){
		return dormStudentSqlMapperDm.noticeAllList();
	}
	public List<Map<String, Object>> freeboardAllList(){
		return dormStudentSqlMapperDm.freeboardAllList();
	}
	public List<Map<String, Object>> repaireRequestAllList(){
		return dormStudentSqlMapperDm.repaireRequestAllList();
	}
}

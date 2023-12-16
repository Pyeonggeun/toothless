package com.mkfactory.toothless.x.ic.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.x.dto.AttendanceBookDto;
import com.mkfactory.toothless.x.dto.AttendanceStatusDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LectureStudentDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
import com.mkfactory.toothless.x.ic.mapper.LifeLecturerSqlMapper;

@Service
public class LifeLecturerServiceImpl {
	@Autowired
	LifeLecturerSqlMapper lifeLecturerSqlMapper;
	
	public LifeLecturerDto getLecturerInfo(int external_pk) {
		
		return lifeLecturerSqlMapper.selectLifeLecturerInfo(external_pk);
	}
	
	
	public List<Map<String, Object>> getMyLecutre(int lecturer_key){
		 List<Map<String, Object>> list = new ArrayList<>();
		 
		 for(OpenLectureDto openLectureDto : lifeLecturerSqlMapper.selectMyOpenLectureInfoList(lecturer_key)) {
			 Map<String, Object> map = new HashMap<>();
			 int leecture_info_key = openLectureDto.getLecture_info_key();
			 LectureInfoDto lectureInfoDto = lifeLecturerSqlMapper.selectLectureInfo(leecture_info_key);
			 int roundCount = lifeLecturerSqlMapper.lectureRoundCount(openLectureDto);			
			 LifeLecturerDto lifeLecturerDto = lifeLecturerSqlMapper.selectLecturerDto(openLectureDto.getLecturer_key());
			 
			 map.put("lifeLecturerDto", lifeLecturerDto);
			 map.put("openLectureDto", openLectureDto);
			 map.put("lectureInfoDto", lectureInfoDto);
			 map.put("roundCount", roundCount);
			 
			 list.add(map);
			 
		 }
		 return list;
		
	}
	
	public  List<Map<String, Object>> getLectureStudentList(int open_lecture_key){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<LectureStudentDto> StudentList = lifeLecturerSqlMapper.selectLectureStudentList(open_lecture_key);
		
		for(LectureStudentDto lectureStudentDto : StudentList) {
			 Map<String, Object> map = new HashMap<>();
			LifeStudentDto lifeStudentDto = lifeLecturerSqlMapper.selectStudentDto(lectureStudentDto.getLife_student_key());
			OpenLectureDto openLectureDto = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
			
			map.put("lectureStudentDto", lectureStudentDto);
			map.put("lifeStudentDto", lifeStudentDto);
			map.put("openLectureDto", openLectureDto);
			
				
			 
			list.add(map);
		}
		
		
		return list ;
		
	}
	
	public int insertAttendanceBook(AttendanceBookDto attendanceBookDto) {
		int attendance_book_key = lifeLecturerSqlMapper.selectAttendanceBookPk();
		
		attendanceBookDto.setAttendance_book_key(attendance_book_key);
		lifeLecturerSqlMapper.insertAttendanceBook(attendanceBookDto);
		
		
		return attendance_book_key;
	}
	
	public void insertAttendanceStatus(AttendanceStatusDto attendanceStatusDto) {
		lifeLecturerSqlMapper.insertAttendanceStatus(attendanceStatusDto);
	}
	
	public Map<String, Object> checkAttendanceBook(String date_created){
		Map<String, Object> map = new HashMap<>();
		AttendanceBookDto attendanceBookDto = lifeLecturerSqlMapper.selectAttendanceBookByDate(date_created);
		if (attendanceBookDto == null) {
			map.put("attendanceBookDto", attendanceBookDto);
			return map;
		}else {
			int open_lecture_key = attendanceBookDto.getOpen_lecture_key();
			
			OpenLectureDto openLectureDto = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
			
			map.put("attendanceBookDto", attendanceBookDto);
			map.put("openLectureDto", openLectureDto);
			
			
			
			return map;
		}
	}
	
	
	public List<Map<String, Object>> lectureAttendanceInfo(int attendance_book_key) {
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<AttendanceStatusDto> attendanceStatusList = lifeLecturerSqlMapper.selectAttendanceStatusByBookPk(attendance_book_key);
		
		
		for(AttendanceStatusDto attendanceStatusDto : attendanceStatusList ) {
			 Map<String, Object> map = new HashMap<>();
			 int lecture_student_key =  attendanceStatusDto.getLecture_student_key();
			 LectureStudentDto lectureStudentDto = lifeLecturerSqlMapper.selectLectureStudentDto(lecture_student_key);
			 int life_student_key = lectureStudentDto.getLife_student_key();
			 LifeStudentDto  lifeStudentDto = lifeLecturerSqlMapper.selectStudentDto(life_student_key);
			 
			 
			 
			 map.put("attendanceStatusDto", attendanceStatusDto);
			 map.put("lectureStudentDto", lectureStudentDto);
			 map.put("lifeStudentDto", lifeStudentDto);
			 
			 list.add(map);
			 
		}
		return list;
		
	}
	
	public Map<String, Object> openLectureInfo(int open_lecture_key) {
		Map<String, Object> map = new HashMap<>();
		
		OpenLectureDto openLectureDto =  lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
		LectureInfoDto lectureInfoDto = lifeLecturerSqlMapper.selectLectureInfo(openLectureDto.getLecture_info_key());
		int roundCount = lifeLecturerSqlMapper.lectureRoundCount(openLectureDto);
		int lectureStudentCount = lifeLecturerSqlMapper.selectLectureStudentList(open_lecture_key).size();
		
		map.put("lectureStudentCount", lectureStudentCount);
		map.put("openLectureDto", openLectureDto);
		map.put("lectureInfoDto", lectureInfoDto);
		map.put("roundCount", roundCount);
		return map;
	}
	
	
}

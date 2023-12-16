package com.mkfactory.toothless.x.ic.mapper;

import java.util.Date;
import java.util.List;

import com.mkfactory.toothless.x.dto.AttendanceBookDto;
import com.mkfactory.toothless.x.dto.AttendanceStatusDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LectureStudentDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;

public interface LifeLecturerSqlMapper {
	
	public List<OpenLectureDto> selectMyOpenLectureInfoList(int lecturer_key);
	
	public LectureInfoDto selectLectureInfo(int lecture_info_key);
	
	public LifeLecturerDto selectLifeLecturerInfo(int external_pk);

		
	public List<LectureStudentDto> selectLectureStudentList(int open_lecture_key);
	public LifeStudentDto selectStudentDto(int life_student_key);
	public OpenLectureDto selectOpenLectureDto(int open_lecture_key);
	
	public int selectAttendanceBookPk();
	
	public void insertAttendanceStatus(AttendanceStatusDto attendanceStatusDto);
	
	public void insertAttendanceBook(AttendanceBookDto attendanceBookDto);
	
	public AttendanceBookDto selectAttendanceBookByDate(String date_created);
	public List<AttendanceStatusDto> selectAttendanceStatusByBookPk(int attendance_book_key);
	public LectureStudentDto selectLectureStudentDto(int lecture_student_key);
	
	public String selectOpenLectureName(int open_lecture_key);
	public int selectLectureCount(int lecture_info_key);
	
	public int lectureRoundCount(OpenLectureDto openLectureDto);
	
	public LifeLecturerDto selectLecturerDto(int lecturer_key);
	
	
}
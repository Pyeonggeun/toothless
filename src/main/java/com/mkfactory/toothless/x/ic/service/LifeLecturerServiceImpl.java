package com.mkfactory.toothless.x.ic.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.x.dto.AttendanceBookDto;
import com.mkfactory.toothless.x.dto.AttendanceStatusDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LectureStudentDto;
import com.mkfactory.toothless.x.dto.LectureTestDto;
import com.mkfactory.toothless.x.dto.LifeLecturerDto;
import com.mkfactory.toothless.x.dto.LifeStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
import com.mkfactory.toothless.x.dto.QuestionChoiceDto;
import com.mkfactory.toothless.x.dto.TestQuestionDto;
import com.mkfactory.toothless.x.dto.TestResultDto;
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
		if(StudentList != null) {
			for(LectureStudentDto lectureStudentDto : StudentList) {
				Map<String, Object> map = new HashMap<>();
				LifeStudentDto lifeStudentDto = lifeLecturerSqlMapper.selectStudentDto(lectureStudentDto.getLife_student_key());
				ExternalInfoDto externalInfoDto = lifeLecturerSqlMapper.selectLifeStudentExternalId(lifeStudentDto.getExternal_pk());
				int lateCount = lifeLecturerSqlMapper.selectLectureStudentLateCount(lectureStudentDto.getLecture_student_key());
				int absenceCount = lifeLecturerSqlMapper.selectLectureStudentAbsenceCount(lectureStudentDto.getLecture_student_key());
				
				map.put("lateCount", lateCount);
				map.put("absenceCount", absenceCount);
				map.put("lectureStudentDto", lectureStudentDto);
				map.put("lifeStudentDto", lifeStudentDto);
				map.put("externalInfoDto", externalInfoDto);
				

				list.add(map);
			}
		}
		return list ;
		
	}
	public  List<Map<String, Object>> getLectureStudentTotalInfoList(int open_lecture_key){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<LectureStudentDto> StudentList = lifeLecturerSqlMapper.selectLectureStudentList(open_lecture_key);
		
		for(LectureStudentDto lectureStudentDto : StudentList) {
			Map<String, Object> map = new HashMap<>();
			LifeStudentDto lifeStudentDto = lifeLecturerSqlMapper.selectStudentDto(lectureStudentDto.getLife_student_key());
			int lecture_student_key = lectureStudentDto.getLecture_student_key();
			ExternalInfoDto externalInfoDto = lifeLecturerSqlMapper.selectLifeStudentExternalId(lifeStudentDto.getExternal_pk());
			int lateCount = lifeLecturerSqlMapper.selectLectureStudentLateCount(lectureStudentDto.getLecture_student_key());
			int absenceCount = lifeLecturerSqlMapper.selectLectureStudentAbsenceCount(lectureStudentDto.getLecture_student_key());
			int totalHour = lifeLecturerSqlMapper.selectLectureInfo(lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getLecture_info_key()).getTotal_hour();
			OpenLectureDto openLectureDto = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
			Date open_date = openLectureDto.getOpen_date();
			Date close_date = openLectureDto.getClose_date();
			Date currentDate = new Date();
			
			String status = null;
			if(open_date.after(currentDate)==true && open_date.equals(currentDate)) {
				System.out.println(open_date.after(currentDate));
				
				status = "진행예정";
			}else if(open_date.before(currentDate) == true && close_date.after(currentDate)==true) {
				System.out.println(open_date.before(currentDate));
				System.out.println(close_date.after(currentDate));
				status = "진행중";
			}else if(close_date.after(currentDate)==true) {
				status = "종료";
			}
			
			double studentAttendanceAvg = (double)(((totalHour/8) - absenceCount - (lateCount/3))/totalHour) * 100;
			
			int totalTestPointSum = lifeLecturerSqlMapper.selectStudentTestScoreAvg(open_lecture_key, lecture_student_key);
			
			int testingCount = lifeLecturerSqlMapper.selectStudentTestingCount(open_lecture_key, lecture_student_key);
			
			double studentTestScoreAvg = (double)totalTestPointSum/testingCount;
			
		 
			map.put("status", status);
			map.put("studentTestScoreAvg", studentTestScoreAvg);
			map.put("studentAttendanceAvg", studentAttendanceAvg);
			map.put("lectureStudentDto", lectureStudentDto);
			map.put("externalInfoDto", externalInfoDto);
			

			list.add(map);
		}
		
		return list ;
		
	} 
	
	
	public  List<Map<String, Object>> getTestStudentList(int lecture_test_key){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<LifeStudentDto> StudentList = lifeLecturerSqlMapper.selectTestStudentList(lecture_test_key);
		if(StudentList != null) {
			for(LifeStudentDto lifeStudentDto : StudentList) {
				Map<String, Object> map = new HashMap<>();
				int life_student_key = lifeStudentDto.getLife_student_key();
				int statusCount = lifeLecturerSqlMapper.selectTestingStatus(life_student_key, lecture_test_key);
				
				if(statusCount == 1) {
					int test_point = 0;
					List<TestResultDto> resultList = lifeLecturerSqlMapper.selectStudentTestResultList(life_student_key);
					
					for(TestResultDto testResultDto : resultList) {
						int question_choice_key = testResultDto.getQuestion_choice_key();
						
						QuestionChoiceDto questionChoiceDto = lifeLecturerSqlMapper.selectQuestionChoiceDto(question_choice_key);
						
						if(questionChoiceDto.getAnswer().equals("true")){
							int test_question_key = questionChoiceDto.getTest_question_key();
							int point = lifeLecturerSqlMapper.selectAnswerTestPoint(test_question_key);
							test_point += point;
						}
					}
					
					map.put("test_point", test_point);
				}
				
				map.put("statusCount", statusCount);
				map.put("lifeStudentDto", lifeStudentDto);
				
				

				list.add(map);
			}
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
	public Map<String, Object> totalStudyingInfo(int open_lecture_key){
		
		Map<String, Object> map = new HashMap<>();
		int totalHour = lifeLecturerSqlMapper.selectLectureInfo(lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getLecture_info_key()).getTotal_hour();
		List<Map<String, Object>> dayList = lifeLecturerSqlMapper.selectCurrentStudyDay(open_lecture_key);
		int studyingHour = 0;
		int nullAttendanceBookCount = 0;
		double percent = 0;
		Date open_date = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getOpen_date();
		Date currentDate = new Date();
		if(open_date.before(currentDate) == true || open_date.equals(currentDate) == true  ) {
			for(Map<String, Object> dayMap : dayList) {
				String date = (String)dayMap.get("DT");
				
				if(dayMap.get("WEEK_DAY").equals("평일") && lifeLecturerSqlMapper.selectAttendanceBookByDate(date) == null) {
					nullAttendanceBookCount++;
					studyingHour += 8;
				}else if(dayMap.get("WEEK_DAY").equals("평일")) {
					studyingHour += 8;
				}
				
			}
			
			percent = ((double)studyingHour/totalHour) * 100;
			
			map.put("percent", percent);
			map.put("studyingHour", studyingHour);
			map.put("nullAttendanceBookCount", nullAttendanceBookCount);
		}
		map.put("totalHour", totalHour);
			
		
		
		
		
		return map;
	}
	
	
	public List<Map<String, Object>> lectureAttendanceBookList(int open_lecture_key){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<Map<String, Object>> dayList = lifeLecturerSqlMapper.selectCurrentStudyDay(open_lecture_key);
		 Date open_date = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getOpen_date();
		 Date currentDate = new Date();
		 if(open_date.before(currentDate) == true || open_date.equals(currentDate) == true  ) {
			 for(Map<String, Object> dayMap : dayList ) {
				 if(dayMap.get("WEEK_DAY").equals("평일")) {
					 Map<String, Object> map = new HashMap<>();
					 
					 String date = (String)dayMap.get("DT");
					 AttendanceBookDto attendanceBookDto = lifeLecturerSqlMapper.selectAttendanceBookByDate(date);
					 if(attendanceBookDto != null) {
						 int attendance_book_key =  attendanceBookDto.getAttendance_book_key();
						 int absenceStudentCount = lifeLecturerSqlMapper.selectAbsenceStudentCount(attendance_book_key);
						 int lateStudentCount = lifeLecturerSqlMapper.selectLateStudentCount(attendance_book_key);
						 
						 map.put("absenceStudentCount", absenceStudentCount);
						 map.put("lateStudentCount", lateStudentCount);
					 
					 }
					 map.put("date", date);
					 map.put("attendanceBookDto", attendanceBookDto);
					
					 list.add(map);
				 } 
			}
		 }
		
		return list;
		
	}
	
	public Map<String, Object> openLectureInfo(int open_lecture_key) {
		Map<String, Object> map = new HashMap<>();
		
		OpenLectureDto openLectureDto =  lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
		LectureInfoDto lectureInfoDto = lifeLecturerSqlMapper.selectLectureInfo(openLectureDto.getLecture_info_key());
		int roundCount = lifeLecturerSqlMapper.lectureRoundCount(openLectureDto);
		int lectureStudentCount = lifeLecturerSqlMapper.selectLectureStudentList(open_lecture_key).size();
		String categoryName = lifeLecturerSqlMapper.selectOpenLectureCategoryName(lectureInfoDto.getLecture_category_key());
		LifeLecturerDto lifeLecturerDto = lifeLecturerSqlMapper.selectLecturerDto(openLectureDto.getLecturer_key());
		
		map.put("lifeLecturerDto", lifeLecturerDto);
		map.put("categoryName", categoryName);
		map.put("lectureStudentCount", lectureStudentCount);
		map.put("openLectureDto", openLectureDto);
		map.put("lectureInfoDto", lectureInfoDto);
		map.put("roundCount", roundCount);
		return map;
	}
	public Map<String, Object> openLectureAttendanceInfo(int open_lecture_key){
		Map<String, Object> map = new HashMap<>();
		
		OpenLectureDto openLectureDto =  lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
		int lecture_info_key = openLectureDto.getLecture_info_key();
		
		int roundCount = lifeLecturerSqlMapper.lectureRoundCount(openLectureDto);
		
		LectureInfoDto lectureInfoDto = lifeLecturerSqlMapper.selectLectureInfo(lecture_info_key);
		
		map.put("openLectureDto", openLectureDto);
		map.put("roundCount", roundCount);
		map.put("lectureInfoDto", lectureInfoDto);
		
		int total_hour = lectureInfoDto.getTotal_hour();
		
		
		Date open_date = openLectureDto.getOpen_date();
		Date currentDate = new Date();
		if(open_date.before(currentDate) == true || open_date.equals(currentDate) == true  ) {
			int totalLateCount = lifeLecturerSqlMapper.selectTotalLateCount(open_lecture_key);
			int totalAbsenceCount = lifeLecturerSqlMapper.selectTotalAbsenceCount(open_lecture_key);
			
			List<Map<String, Object>> dayList = lifeLecturerSqlMapper.selectCurrentStudyDay(open_lecture_key);
			int studyingHour= 0;
			int nullAttendanceBookCount = 0;
			int currentStudyingDay = 0;
			for(Map<String, Object> dayMap : dayList ) {
				if(dayMap.get("WEEK_DAY").equals("평일")) {
					String date = (String)dayMap.get("DT");
					
					if(dayMap.get("WEEK_DAY").equals("평일") && lifeLecturerSqlMapper.selectAttendanceBookByDate(date) == null) {
						nullAttendanceBookCount++;
						studyingHour += 8;
						currentStudyingDay++;
					}else if(dayMap.get("WEEK_DAY").equals("평일")) {
						studyingHour += 8;
						currentStudyingDay++;
					}
				}
			}
			double percent = (double)(studyingHour/total_hour)*100;
			int lectureStudentCount = lifeLecturerSqlMapper.selectLectureStudentList(open_lecture_key).size();
			double avgAttendanceScore = (double)total_hour/8;
			
			map.put("lectureStudentCount", lectureStudentCount);
			map.put("totalLateCount", totalLateCount);
			map.put("totalAbsenceCount", totalAbsenceCount);
			map.put("nullAttendanceBookCount", nullAttendanceBookCount);
			map.put("studyingHour", studyingHour);
			map.put("currentStudyingDay", currentStudyingDay);
			map.put("percent", percent);
		}
		return map;
	}
	
	public List<Map<String, Object>> attendanceStudentList(int open_lecture_key){
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<AttendanceStatusDto> statusList = lifeLecturerSqlMapper.selectAttendanceDtoList(open_lecture_key);
		
		for(AttendanceStatusDto attendanceStatusDto : statusList) {
			Map<String, Object> map = new HashMap<>();
			
			int lecture_student_key = attendanceStatusDto.getLecture_student_key();
			LectureStudentDto lectureStudentDto = lifeLecturerSqlMapper.selectLectureStudentDto(lecture_student_key);
			int life_student_key = lectureStudentDto.getLife_student_key();
			LifeStudentDto lifeStudentDto = lifeLecturerSqlMapper.selectStudentDto(life_student_key);
			int external_pk = lifeStudentDto.getExternal_pk();
			ExternalInfoDto externalInfoDto = lifeLecturerSqlMapper.selectLifeStudentExternalId(external_pk);
			int absenceCount = lifeLecturerSqlMapper.selectStudentAbsenceCount(lecture_student_key);
			int lateCount = lifeLecturerSqlMapper.selectStudentLateCount(lecture_student_key);
			int totalHour = lifeLecturerSqlMapper.selectLectureInfoDto(open_lecture_key).getTotal_hour();
			
			double studentAttendanceAvg = (double)(((totalHour/8) - absenceCount - (lateCount/3))/totalHour) * 100;
			
			map.put("externalInfoDto", externalInfoDto);
			map.put("lifeStudentDto", lifeStudentDto);
			map.put("absenceCount", absenceCount);
			map.put("lateCount", lateCount);
			map.put("totalHour", totalHour);
			map.put("studentAttendanceAvg", studentAttendanceAvg);
			 
			 
			 list.add(map);
		}			 
		return list;
	}
	
	
	public int insertLecutreTestInfoAndReturnPk(LectureTestDto lectureTestDto) {
		int lecture_test_key =  lifeLecturerSqlMapper.selectLectureTestKey();
		lectureTestDto.setLecture_test_key(lecture_test_key);
		lifeLecturerSqlMapper.insertLectureTestInfo(lectureTestDto);
		
		return lecture_test_key;
	}
	
	public int insertTestQuestionInfoAndReturnPk(TestQuestionDto testQuestionDto) {
		int test_question_key = lifeLecturerSqlMapper.selectTestQuestionKey();
		testQuestionDto.setTest_question_key(test_question_key);
		lifeLecturerSqlMapper.insertTestQuestionInfo(testQuestionDto);
		
		return test_question_key;
	}
	
	public void insertQuestionChoiceInfo(QuestionChoiceDto questionChoiceDto) {
		lifeLecturerSqlMapper.insertQuestionChoiceInfo(questionChoiceDto);
	}
	
	public List<Map<String, Object>> lectureTestList(int open_lecture_key){
		List<Map<String, Object>> list = new ArrayList<>();
		List<LectureTestDto> testList = lifeLecturerSqlMapper.selectLectureTestList(open_lecture_key);
		
		for(LectureTestDto lectureTestDto : testList) {
			Map<String, Object> map = new HashMap<>();
			int lectureStudentCount = lifeLecturerSqlMapper.selectLectureStudentList(open_lecture_key).size();
			int testingStudentCount = lifeLecturerSqlMapper.selectTestingStudentCount(lectureTestDto.getLecture_test_key());
			String testStatus = lifeLecturerSqlMapper.selectTestStatus(lectureTestDto.getLecture_test_key());
				
			map.put("testStatus", testStatus);
			map.put("lectureTestDto", lectureTestDto);
			map.put("lectureStudentCount", lectureStudentCount);
			map.put("testingStudentCount", testingStudentCount);
			
			
			
			list.add(map);
		}
		return list;
	}
	
	public Map<String, Object> testAndLecturerInfo(int lecture_test_key){
		Map<String, Object> map = new HashMap<>();
		
		LectureTestDto lectureTestDto =  lifeLecturerSqlMapper.selectLectureTestDto(lecture_test_key);
		int open_lecture_key = lectureTestDto.getOpen_lecture_key();
		OpenLectureDto openLectureDto =  lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
		LectureInfoDto lectureInfoDto = lifeLecturerSqlMapper.selectLectureInfo(openLectureDto.getLecture_info_key());
		int roundCount = lifeLecturerSqlMapper.lectureRoundCount(openLectureDto);
		String categoryName = lifeLecturerSqlMapper.selectOpenLectureCategoryName(open_lecture_key);
		
		
		map.put("lectureInfoDto", lectureInfoDto);
		map.put("roundCount", roundCount);
		map.put("categoryName", categoryName);
		map.put("lectureTestDto", lectureTestDto);
		
		return map;
	}
}

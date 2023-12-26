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
import com.mkfactory.toothless.x.dto.LectureReviewDto;
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
	
	
	public Map<String, Object> getMyLecutre(int lecturer_key){
		Map<String, Object> map = new HashMap<>();
		 
		OpenLectureDto openLectureDto = lifeLecturerSqlMapper.selectMyOpenLectureInfo(lecturer_key);
			 
		int leecture_info_key = openLectureDto.getLecture_info_key();
		LectureInfoDto lectureInfoDto = lifeLecturerSqlMapper.selectLectureInfo(leecture_info_key);
		int roundCount = lifeLecturerSqlMapper.lectureRoundCount(openLectureDto);			
		LifeLecturerDto lifeLecturerDto = lifeLecturerSqlMapper.selectLecturerDto(openLectureDto.getLecturer_key());
		
		Map<String, Object> reviewMap = lifeLecturerSqlMapper.selectTotalReviewScore(lecturer_key);
		int totalReviewScore = Integer.parseInt(reviewMap.get("TOTAL_STAR").toString()) ;
		int studentReviewCount = Integer.parseInt(reviewMap.get("TOTAL_STUDENT").toString()) ;
		double result = (double)totalReviewScore/studentReviewCount;
		
		map.put("result", result);
		map.put("lifeLecturerDto", lifeLecturerDto);
		map.put("openLectureDto", openLectureDto);
		map.put("lectureInfoDto", lectureInfoDto);
		map.put("roundCount", roundCount);
	 
		return map;
		
	}
	public List<Map<String, Object>> getMyExpectedLecutre(int lecturer_key){
		List<Map<String, Object>> list = new ArrayList<>();
		 
		List<OpenLectureDto> openLectureDtoList = lifeLecturerSqlMapper.selectMyExpectedLectureInfoList(lecturer_key);
		
		for(OpenLectureDto openLectureDto : openLectureDtoList) {
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
	public List<Map<String, Object>> getMyCloseLecutre(int lecturer_key){
		List<Map<String, Object>> list = new ArrayList<>();
		 
		List<OpenLectureDto> openLectureDtoList = lifeLecturerSqlMapper.selectMyCloseLectureInfoList(lecturer_key);
		
		for(OpenLectureDto openLectureDto : openLectureDtoList) {
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
				int lecture_student_key = lectureStudentDto.getLecture_student_key();
				int lateCount = lifeLecturerSqlMapper.selectLectureStudentLateCount(lecture_student_key, open_lecture_key);
				int absenceCount = lifeLecturerSqlMapper.selectLectureStudentAbsenceCount(lecture_student_key, open_lecture_key);
				
				map.put("open_lecture_key", open_lecture_key);
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
			int lateCount = lifeLecturerSqlMapper.selectLectureStudentLateCount(open_lecture_key, lectureStudentDto.getLecture_student_key());
			int absenceCount = lifeLecturerSqlMapper.selectLectureStudentAbsenceCount(open_lecture_key, lectureStudentDto.getLecture_student_key());
			int totalHour = lifeLecturerSqlMapper.selectLectureInfo(lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getLecture_info_key()).getTotal_hour();
			OpenLectureDto openLectureDto = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key);
			
			Date open_date = openLectureDto.getOpen_date();
			Date close_date = openLectureDto.getClose_date();
			Date currentDate = new Date();
			
			String status = null;
			
			if(open_date.after(currentDate)==true && open_date.equals(currentDate) != true) {
				status = "진행예정";
			}else if(open_date.before(currentDate) == false && close_date.after(currentDate)== false) {
				status = "진행중";
			}else if(close_date.after(currentDate)== true && close_date.equals(currentDate) == false) {
				status = "종료";
			}
			
			
			
			
			int totalTestPointSum = lifeLecturerSqlMapper.selectStudentTestScoreAvg(open_lecture_key, lecture_student_key);
			
			
			int testingCount = lifeLecturerSqlMapper.selectStudentTestingCount(open_lecture_key, lecture_student_key);
			
			double studentTestScoreAvg = 0;
			if(testingCount != 0) {
				studentTestScoreAvg = (double)totalTestPointSum/testingCount;
			}
			
			double studyDay = (double)(totalHour/8);
			int lateBeAbsence = lateCount/3;
			double studentStudeyDay = studyDay - absenceCount - lateBeAbsence;
			double studentAttendanceAvg = studentStudeyDay/studyDay * 100;
	
			if( status == "종료") {
				 LectureInfoDto lectureInfoDto = lifeLecturerSqlMapper.selectLectureInfo(openLectureDto.getLecture_info_key());
				 int essential_attendance = lectureInfoDto.getEssential_attendance();
				 int essential_grade = lectureInfoDto.getEssential_grade();
				 if(studentTestScoreAvg >= essential_grade && studentAttendanceAvg >= essential_attendance ) {
					 status = "수료완료";
				 }else {
					 status = "미수료";
				 }
			}
			
			
			
			map.put("lifeStudentDto", lifeStudentDto);
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
				int external_pk = lifeStudentDto.getExternal_pk();
				ExternalInfoDto externalInfoDto = lifeLecturerSqlMapper.selectLifeStudentExternalId(external_pk);
				if(statusCount == 1) {
					int test_point = 0;
					List<TestResultDto> resultList = lifeLecturerSqlMapper.selectStudentTestResultList(life_student_key, lecture_test_key);
					
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
				map.put("externalInfoDto", externalInfoDto);
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
				AttendanceBookDto attendanceBookDto = lifeLecturerSqlMapper.selectAttendanceBookByDate(date);
				if(dayMap.get("WEEK_DAY").equals("평일") && attendanceBookDto == null && totalHour > studyingHour) {
					
					nullAttendanceBookCount++;
					studyingHour += 8;
				}else if(dayMap.get("WEEK_DAY").equals("평일") && totalHour > studyingHour) {
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
		 Date close_date = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getClose_date();
		 Date currentDate = new Date();
		 
		 if(open_date.before(currentDate) == true || open_date.equals(currentDate) == true) {
			 for(Map<String, Object> dayMap : dayList ) {
				 if(dayMap.get("WEEK_DAY").equals("평일")) {
					 Map<String, Object> map = new HashMap<>();
					 
					 String date = (String)dayMap.get("DT");
					 Date dd =null;
					 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					 try {
						 dd = dateFormat.parse(date);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					 
					 int compare = close_date.compareTo(dd);
					 
					 if(compare ==0 || compare == 1) {
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
			int totalHour = lifeLecturerSqlMapper.selectLectureInfo(lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getLecture_info_key()).getTotal_hour();
			int studyingHour= 0;
			int nullAttendanceBookCount = 0;
			int currentStudyingDay = 0;
			for(Map<String, Object> dayMap : dayList ) {
				if(dayMap.get("WEEK_DAY").equals("평일")) {
					String date = (String)dayMap.get("DT");
					
					if(dayMap.get("WEEK_DAY").equals("평일") && lifeLecturerSqlMapper.selectAttendanceBookByDate(date) == null && totalHour > studyingHour) {
						nullAttendanceBookCount++;
						studyingHour += 8;
						currentStudyingDay++;
					}else if(dayMap.get("WEEK_DAY").equals("평일") && totalHour > studyingHour) {
						studyingHour += 8;
						currentStudyingDay++;
					}
				}
			}
			double that = (double)studyingHour/total_hour;
			double percent = that *100;
			int lectureStudentCount = lifeLecturerSqlMapper.selectLectureStudentList(open_lecture_key).size();

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
		
		int[] statusList = lifeLecturerSqlMapper.selectAttendanceDtoList(open_lecture_key);
		
		for(int lecture_student_key : statusList) {
			Map<String, Object> map = new HashMap<>();
			
			LectureStudentDto lectureStudentDto = lifeLecturerSqlMapper.selectLectureStudentDto(lecture_student_key);
			int life_student_key = lectureStudentDto.getLife_student_key();
			LifeStudentDto lifeStudentDto = lifeLecturerSqlMapper.selectStudentDto(life_student_key);
			int external_pk = lifeStudentDto.getExternal_pk();
			ExternalInfoDto externalInfoDto = lifeLecturerSqlMapper.selectLifeStudentExternalId(external_pk);
			int absenceCount = lifeLecturerSqlMapper.selectLectureStudentAbsenceCount(lecture_student_key, open_lecture_key);
			int lateCount = lifeLecturerSqlMapper.selectLectureStudentLateCount(lecture_student_key, open_lecture_key);
			int totalHour = lifeLecturerSqlMapper.selectLectureInfoDto(open_lecture_key).getTotal_hour();
			int cutline = lifeLecturerSqlMapper.selectLectureInfoDto(open_lecture_key).getEssential_attendance();
			double studyDay = (double)(totalHour/8);
			int lateBeAbsence = lateCount/3;
			double studentStudeyDay = studyDay - absenceCount - lateBeAbsence;
			double studentAttendanceAvg = studentStudeyDay/studyDay * 100;
			
			map.put("cutline", cutline);
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
	
	public List<Map<String, Object>> studentTestQuestionAndResultList(int lecture_test_key, int life_student_key){
		List<Map<String, Object>> list = new ArrayList<>();
		List<TestQuestionDto> questionList = lifeLecturerSqlMapper.selectTestQuestionList(lecture_test_key);
		
		int lecture_student_key = lifeLecturerSqlMapper.selectLecutreKeyByLifeStudentKeyAndLectureTestKey(lecture_test_key, life_student_key);
		
		for(TestQuestionDto testQuestionDto : questionList) {
			
			Map<String, Object> map = new HashMap<>();
			int test_question_key = testQuestionDto.getTest_question_key();
			List<QuestionChoiceDto> qcList = lifeLecturerSqlMapper.selectChoiceList(test_question_key);
			List<Map<String, Object>> qList = new ArrayList<>();
			
			for(QuestionChoiceDto questionChoiceDto : qcList) {
				Map<String, Object> qMap = new HashMap<>();
				int question_choice_key = questionChoiceDto.getQuestion_choice_key();
				TestResultDto testResultDto = lifeLecturerSqlMapper.selectStudetnResultDtoForChoice(question_choice_key, lecture_student_key);
				if(testResultDto != null && questionChoiceDto.getAnswer().equals("true")) {
				
				}
				
				
				qMap.put("questionChoiceDto", questionChoiceDto);
				qMap.put("testResultDto", testResultDto);
				
				qList.add(qMap);
			}
			map.put("testQuestionDto", testQuestionDto);
			map.put("qList", qList);
			
			list.add(map);
		}
		
		return list;
	}
	public Map<String, Object> getTestingStudentInfo(int life_student_key, int lecture_test_key) {
		Map<String, Object> map = new HashMap<>();
		LifeStudentDto lifeStudentDto =  lifeLecturerSqlMapper.selectStudentDto(life_student_key);
		Date testingDate = lifeLecturerSqlMapper.selectStudentTestingDay(lecture_test_key, life_student_key);
		
		map.put("lifeStudentDto", lifeStudentDto);
		map.put("testingDate", testingDate);
		
		return map;
	
	}
	public List<String> noLectureAttendanceBook(int open_lecture_key){
		List<String> list = new ArrayList<>();
		
		List<Map<String, Object>> dayList = lifeLecturerSqlMapper.selectCurrentStudyDay(open_lecture_key);
		 Date open_date = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getOpen_date();
		 Date close_date = lifeLecturerSqlMapper.selectOpenLectureDto(open_lecture_key).getClose_date();
		 Date currentDate = new Date();
		 
		 if(open_date.before(currentDate) == true || open_date.equals(currentDate) == true) {
			 for(Map<String, Object> dayMap : dayList ) {
				 if(dayMap.get("WEEK_DAY").equals("평일")) {
					 String date = (String)dayMap.get("DT");
					 Date dd =null;
					 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					 try {
						 dd = dateFormat.parse(date);
					} catch (Exception e) {
						e.printStackTrace();
					}
					 int compare = close_date.compareTo(dd);
					 
					 if(compare ==0 || compare == 1) {
						 AttendanceBookDto attendanceBookDto = lifeLecturerSqlMapper.selectAttendanceBookByDate(date);
						 if(attendanceBookDto == null) {
							 list.add(date);
						 }
					 }
				 } 
			}
		 }
		 return list;
	}
	
	public List<LectureReviewDto> getLectureReviewList(int open_lecture_key){
		
		List<LectureReviewDto> list = lifeLecturerSqlMapper.selectOpenLecutreReviewList(open_lecture_key);
		
		return list;
	}
	
}

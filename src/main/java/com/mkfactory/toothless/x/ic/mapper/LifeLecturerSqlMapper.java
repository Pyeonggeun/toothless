package com.mkfactory.toothless.x.ic.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.donot.touch.dto.ExternalInfoDto;
import com.mkfactory.toothless.donot.touch.dto.NotificationDto;
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

public interface LifeLecturerSqlMapper {
	
	public OpenLectureDto selectMyOpenLectureInfo(int lecturer_key);
	
	public List<OpenLectureDto> selectMyExpectedLectureInfoList(int lecturer_key);
	
	public List<OpenLectureDto> selectMyCloseLectureInfoList(int lecturer_key);
	
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
	
	public LectureInfoDto selectLectureInfoDto(int open_lecture_key);
	public int selectLectureCount(int lecture_info_key);
	
	public int lectureRoundCount(OpenLectureDto openLectureDto);
	
	public LifeLecturerDto selectLecturerDto(int lecturer_key);
	
	public List<Map<String, Object>> selectCurrentStudyDay(int open_lecture_key);
	
	public int selectLateStudentCount(int attendance_book_key);
	public int selectAbsenceStudentCount(int attendance_book_key);
	
	public int selectLectureStudentLateCount(@Param("lecture_student_key") int lecture_student_key
											,@Param("open_lecture_key") int open_lecture_key);
	public int selectLectureStudentAbsenceCount(@Param("lecture_student_key")int lecture_student_key
												,@Param("open_lecture_key")int open_lecture_key);
	public ExternalInfoDto selectLifeStudentExternalId(int external_pk);
	
	public String selectOpenLectureCategoryName(int lecture_category_key);
	
	public int selectLectureTestKey();
	public void insertLectureTestInfo(LectureTestDto lectureTestDto);
	
	public int selectTestQuestionKey();
	public void insertTestQuestionInfo(TestQuestionDto testQuestionDto);
	public void insertQuestionChoiceInfo(QuestionChoiceDto questionChoiceDto);
	
	public List<LectureTestDto> selectLectureTestList(int open_lecture_key);
	
	public int selectTestingStudentCount(int lecture_test_key);
	
	public String selectTestStatus(int lecture_test_key);
	
	public List<LifeStudentDto> selectTestStudentList(int lecture_test_key);
	
	public int selectTestingStatus(@Param("life_student_key") int life_student_key,
									@Param("lecture_test_key") int lecture_test_key);
	
	public List<TestResultDto> selectStudentTestResultList(@Param("life_student_key") int life_student_key,
															@Param("lecture_test_key") int lecture_test_key);
	public QuestionChoiceDto selectQuestionChoiceDto(int question_choice_key);
	
	public int selectAnswerTestPoint(int test_question_key);
	
	public LectureTestDto selectLectureTestDto(int lecture_test_key);
	
	public int selectTotalLateCount(int open_lecture_key);
	public int selectTotalAbsenceCount(int open_lecture_key);
	
	public int[] selectAttendanceDtoList(int open_lecture_key);
	
	
	public int selectStudentTestScoreAvg(@Param("open_lecture_key") int open_lecture_key,
											@Param("lecture_student_key") int lecture_student_key);
	public int selectTestCount(int open_lecture_key);
	
	public int selectStudentTestingCount(@Param("open_lecture_key") int open_lecture_key,
										@Param("lecture_student_key") int lecture_student_key);
	
	public void insertNotificationDto(NotificationDto notificationDto);
	
	public List<TestQuestionDto> selectTestQuestionList(int lecture_test_key);

	public List<QuestionChoiceDto> selectChoiceList(int test_question_key);
	public TestResultDto selectStudetnResultDtoForChoice(@Param("question_choice_key") int question_choice_key,
														@Param("lecture_student_key") int lecture_student_key);

	public int selectLecutreKeyByLifeStudentKeyAndLectureTestKey(@Param("lecture_test_key") int lecture_test_key,
																@Param("life_student_key") int life_student_key);
	
	public Date selectStudentTestingDay(@Param("life_student_key") int life_student_key,
										@Param("lecture_test_key") int lecture_test_key);
	
	public List<LectureReviewDto> selectOpenLecutreReviewList(int open_lecture_key);
	
	public Map<String, Object> selectTotalReviewScore(int lecturer_key);
	

}
package com.mkfactory.toothless.x.hn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LectureReviewDto;
import com.mkfactory.toothless.x.dto.LectureStudentDto;
import com.mkfactory.toothless.x.dto.LectureTestDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
import com.mkfactory.toothless.x.dto.QuestionChoiceDto;
import com.mkfactory.toothless.x.dto.TestQuestionDto;
import com.mkfactory.toothless.x.dto.TestResultDto;

public interface LifeStudentSqlMapper {
	
	public List<Map<String, Object>> getReceivingLectureList();
	public int getCurrentApplyNumberByOpenLectureKey(int open_lecture_key);
	
	public OpenLectureDto getOpenLectureInfoByOpenLectureKey(int open_lecture_key);
	public LectureInfoDto getLectureInfoByLectureInfoKey(int lecture_info_key);
	public int getLectureRoundByLectureInfoKeyAndOpenLectrueKey(@Param("lecture_info_key") int lecture_info_key, @Param("open_lecture_key") int open_lecture_key);
	public List<Integer> getConditionLectureKeyListByLectureInfoKey(int lecture_info_key);
	public String getLectureNameByConditionLectureKey(int condition_lecture_key);
	public String getLectureCategoryNameByLectureCategoryKey(int lecture_category_key);
	public String getLecturerNameByLecturerKey(int lecturer_key);
	
	public int isApply(@Param("open_lecture_key") int open_lecture_key, @Param("life_student_key") int life_student_key);
	
	public List<Integer> isConditionSatisfaction(
			@Param("open_lecture_key") int open_lecture_key, @Param("life_student_key") int life_student_key);
	public int isOverlapDate(
			@Param("open_lecture_key") int open_lecture_key, @Param("life_student_key") int life_student_key);
	
	public int getLifeStudentKeyByExternalPk(int externalPk);
	
	public void insertLectureStudentInfo(LectureStudentDto lectureStudentDto);
	
	public List<OpenLectureDto> getOpenLectureInfoList(
			@Param("searchType") int[] searchType, @Param("searchWord") String searchWord, @Param("searchRecruitment") int searchRecruitment,
			@Param("pageNumber") int pageNumber, @Param("eachTotalNumber") int eachTotalNumber);
	public int getTotalOpenLectureCount(@Param("searchType") int[] searchType, @Param("searchWord") String searchWord, @Param("searchRecruitment") int searchRecruitment);
	public List<LectureCategoryDto> getLectureCategoryList();
	
	public List<Map<String, Object>> getLectureStudentKeyAndOpenLectureKeyByLifeStudentKey(
			@Param("pageNumber") int pageNumber, @Param("life_student_key") int life_student_key);
	public int getToTalReviewLectureCount(int life_student_key);
	public int isReviewRegister(int lecture_student_key);
	public LectureReviewDto getLectureReviewInfoByLectureStudentKey(int lecture_student_key);
	public void insertLectureReviewInfo(LectureReviewDto lectureReviewDto);
	
	public int getLectureStudentKeyByOpenLectureKeyAndLifeStudentKey(
			@Param("open_lecture_key") int open_lecture_key, @Param("life_student_key") int life_student_key);
	public int getTotalMyLectureCount(@Param("life_student_key") int life_student_key, @Param("searchType") int searchType);
	public List<Integer> getMyOpenLectureKeyList(
			@Param("life_student_key") int life_student_key, @Param("pageNumber") int pageNumber, @Param("searchType") int searchType);
	public int getTotalAttendanceCount(int open_lecture_key);
	public int getAttendanceCountByLectureStudentKey(int lecture_student_key);
	public int getExceptAttendanceAndAbsentCountByLectureStudentKey(int lecture_student_key);
	public int getAvgTestScoreByOpenLectureKey(int open_lecture_key);
	
	public int getTotalTestCount(int open_lecture_key);
	public int getStudentTotalTestCount(int lecture_student_key);
	public List<LectureTestDto> getLectureTestInfoByOpenLectureKey(int open_lecture_key);
	public int getStudentTestScoreByLectureTestKey(int lecture_test_key);
	public int isCompleteTest(int lecture_test_key);
	
	public String getTestNameByLectureTestKey(int lecture_test_key);
	public List<TestQuestionDto> getTestQuestionListByLectureTestKey(int lecture_test_key);
	public List<QuestionChoiceDto> getTestChoiceListByTestQuestionKey(int test_question_key);
	
	public void insertTestResult(TestResultDto testResultDto);
	
	public int getTotalingCount(int life_student_key);
	public int getTotalWaitCount(int life_student_key);
	public int getTotalCompleteCount(int life_student_key);
	
	public List<OpenLectureDto> getIngOpenLectureInfo(int life_student_key);
	public List<OpenLectureDto> getCompleteOpenLectureInfo(int life_student_key);

}

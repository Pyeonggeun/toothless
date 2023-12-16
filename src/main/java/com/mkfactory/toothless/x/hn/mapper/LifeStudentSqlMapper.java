package com.mkfactory.toothless.x.hn.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LectureStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;

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
	
	public List<Integer> isConditionSatisfaction(@Param("open_lecture_key") int open_lecture_key, @Param("life_student_key") int life_student_key);
	
	public int getLifeStudentKeyByExternalPk(int externalPk);
	
	public void insertLectureStudentInfo(LectureStudentDto lectureStudentDto);
	
	public List<OpenLectureDto> getOpenLectureInfoList(
			@Param("searchType") int[] searchType, @Param("searchWord") String searchWord, @Param("searchRecruitment") int searchRecruitment,
			@Param("pageNumber") int pageNumber, @Param("eachTotalNumber") int eachTotalNumber);
	public int getTotalOpenLectureCount(@Param("searchType") int[] searchType, @Param("searchWord") String searchWord, @Param("searchRecruitment") int searchRecruitment);
	public List<LectureCategoryDto> getLectureCategoryList();

}

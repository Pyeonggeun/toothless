package com.mkfactory.toothless.x.hn.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.x.dto.LectureCategoryDto;
import com.mkfactory.toothless.x.dto.LectureInfoDto;
import com.mkfactory.toothless.x.dto.LectureReviewDto;
import com.mkfactory.toothless.x.dto.LectureStudentDto;
import com.mkfactory.toothless.x.dto.OpenLectureDto;
import com.mkfactory.toothless.x.hn.mapper.LifeStudentSqlMapper;

@Service
public class LifeStudentServiceImpl {
	
	@Autowired
	private LifeStudentSqlMapper lifeStudentSqlMapper;
	
	public List<Map<String, Object>> getReceivingLectureList() {
		
		List<Map<String, Object>> list = lifeStudentSqlMapper.getReceivingLectureList();
		
		boolean isDeadline = true;
		
		for(Map<String, Object> map : list) {
			
			int max_student = ((BigDecimal)map.get("MAX_STUDENT")).intValue();
			int open_lecture_key = ((BigDecimal)map.get("OPEN_LECTURE_KEY")).intValue();
			
			if(max_student <= lifeStudentSqlMapper.getCurrentApplyNumberByOpenLectureKey(open_lecture_key)) {
				isDeadline = false;
			}
			
			map.put("isDeadline", isDeadline);
			
		}
		
		return list;
		
	}
	
	public Map<String, Object> getDetailPageInfo(int open_lecture_key) {
		
		Map<String, Object> map = new HashMap<>();
		
		OpenLectureDto openLectureDto = lifeStudentSqlMapper.getOpenLectureInfoByOpenLectureKey(open_lecture_key);
		int lecture_info_key = openLectureDto.getLecture_info_key();
		
		LectureInfoDto lectureInfoDto = lifeStudentSqlMapper.getLectureInfoByLectureInfoKey(lecture_info_key);
		
		List<Integer> list = lifeStudentSqlMapper.getConditionLectureKeyListByLectureInfoKey(lecture_info_key);
		List<String> conditionList = new ArrayList<>();
		
		for(int e : list) {
			
			conditionList.add(lifeStudentSqlMapper.getLectureNameByConditionLectureKey(e));
			
		}
		
		map.put("openLectureInfo", openLectureDto);
		map.put("lectureInfo", lectureInfoDto);
		map.put("round", lifeStudentSqlMapper.getLectureRoundByLectureInfoKeyAndOpenLectrueKey(lecture_info_key, open_lecture_key));
		map.put("conditionLectureNameList", conditionList);
		map.put("categoryName", lifeStudentSqlMapper.getLectureCategoryNameByLectureCategoryKey(lectureInfoDto.getLecture_category_key()));
		map.put("lecturerName", lifeStudentSqlMapper.getLecturerNameByLecturerKey(openLectureDto.getLecturer_key()));
		map.put("currentApplyNumber", lifeStudentSqlMapper.getCurrentApplyNumberByOpenLectureKey(open_lecture_key));
		
		return map;
	}
	
	public boolean isApply(int open_lecture_key, int life_student_key) {
		
		return lifeStudentSqlMapper.isApply(open_lecture_key, life_student_key) > 0 ? true : false;
	}
	
	public boolean isConditionSatisfaction(int open_lecture_key, int life_student_key) {
		
		List<Integer> list = lifeStudentSqlMapper.isConditionSatisfaction(open_lecture_key, life_student_key);
		
		boolean isSatisfaction = true;
		
		for(int e : list) {
			
			if(e == 0) {
				
				isSatisfaction = false;
				
			}
			
		}
		
		return isSatisfaction;
	}
	
	public boolean isOverlapDate(int open_lecture_key, int life_student_key) {
		
		return lifeStudentSqlMapper.isOverlapDate(open_lecture_key, life_student_key) > 0 ? true : false;
	}
	
	public int getLifeStudentKey(int external_pk) {
		
		return lifeStudentSqlMapper.getLifeStudentKeyByExternalPk(external_pk);
	}
	
	public void insertLectureStudentInfo(LectureStudentDto lectureStudentDto) {
		
		lifeStudentSqlMapper.insertLectureStudentInfo(lectureStudentDto);
	}
	
	
	public List<Map<String, Object>> getOpenLectureList(int[] searchType, String searchWord, int searchRecruitment, int pageNumber, int eachTotalNumber) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<OpenLectureDto> openLectureList = lifeStudentSqlMapper.getOpenLectureInfoList(searchType, searchWord, searchRecruitment, pageNumber, eachTotalNumber);
		
		for(OpenLectureDto openLectureDto : openLectureList) {
			
			Map<String, Object> map = new HashMap<>();
			
			LectureInfoDto lectureInfoDto = lifeStudentSqlMapper.getLectureInfoByLectureInfoKey(openLectureDto.getLecture_info_key());
			
			map.put("openLectureInfo", openLectureDto);
			map.put("lectureInfo", lectureInfoDto);
			map.put("round", lifeStudentSqlMapper.getLectureRoundByLectureInfoKeyAndOpenLectrueKey(openLectureDto.getLecture_info_key(), openLectureDto.getOpen_lecture_key()));
			map.put("categoryName", lifeStudentSqlMapper.getLectureCategoryNameByLectureCategoryKey(lectureInfoDto.getLecture_category_key()));
			map.put("currentApplyNumber", lifeStudentSqlMapper.getCurrentApplyNumberByOpenLectureKey(openLectureDto.getOpen_lecture_key()));
			
			list.add(map);
		}
		
		return list;
	}
	
	public int getTotalOpenLectureCount(int[] searchType, String searchWord, int searchRecruitment) {
		
		return lifeStudentSqlMapper.getTotalOpenLectureCount(searchType, searchWord, searchRecruitment);
	}
	
	public List<LectureCategoryDto> getLectureCategoryList() {
		
		return lifeStudentSqlMapper.getLectureCategoryList();
	}
	
	public List<Map<String, Object>> getReviewLectureList(int pageNumber, int life_student_key) {
		
		List<Map<String, Object>> list = lifeStudentSqlMapper.getLectureStudentKeyAndOpenLectureKeyByLifeStudentKey(pageNumber, life_student_key);
		
		for(Map<String, Object> map : list) {
			
			int open_lecture_key = ((BigDecimal)map.get("OPEN_LECTURE_KEY")).intValue();
			int lecture_student_key = ((BigDecimal)map.get("LECTURE_STUDENT_KEY")).intValue();
			
			OpenLectureDto openLectureDto = lifeStudentSqlMapper.getOpenLectureInfoByOpenLectureKey(open_lecture_key);
			LectureInfoDto lectureInfoDto = lifeStudentSqlMapper.getLectureInfoByLectureInfoKey(openLectureDto.getLecture_info_key());
			
			map.put("lectureName", lectureInfoDto.getName());
			map.put("categoryName", lifeStudentSqlMapper.getLectureCategoryNameByLectureCategoryKey(lectureInfoDto.getLecture_category_key()));
			map.put("round", lifeStudentSqlMapper.getLectureRoundByLectureInfoKeyAndOpenLectrueKey(openLectureDto.getLecture_info_key(), open_lecture_key));
			map.put("isReviewRegister", lifeStudentSqlMapper.isReviewRegister(lecture_student_key) > 0 ? true : false);
			
		}
		
		return list;
	}
	
	public int getTotalReviewLectureCount(int life_student_key) {
		
		return lifeStudentSqlMapper.getToTalReviewLectureCount(life_student_key);
	}
	
	public LectureReviewDto getLectureReviewInfo(int lecture_student_key) {
		
		return lifeStudentSqlMapper.getLectureReviewInfoByLectureStudentKey(lecture_student_key);
	}
	
	public void insertLectureReviewInfo(LectureReviewDto lectureReviewDto) {
		
		lifeStudentSqlMapper.insertLectureReviewInfo(lectureReviewDto);
	}

}

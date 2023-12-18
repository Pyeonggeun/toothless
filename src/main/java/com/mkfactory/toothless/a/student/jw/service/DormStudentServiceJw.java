package com.mkfactory.toothless.a.student.jw.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DiaryDto;
import com.mkfactory.toothless.a.dto.DormNoticeDto;
import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.ExecutiveDto;
import com.mkfactory.toothless.a.dto.ExitDto;
import com.mkfactory.toothless.a.dto.PointDto;
import com.mkfactory.toothless.a.student.jw.mapper.DormStudentMapperJw;

@Service
public class DormStudentServiceJw {

	@Autowired
	private DormStudentMapperJw dormStudentMapperJw;
	
	public int checkDormStudent(int student_pk) {
		return dormStudentMapperJw.countDormStudentByStudentAndProgressSemester(student_pk);
	}
	
	public int checkDormStudentExecutive(int student_pk) {
		return dormStudentMapperJw.countDormStudentByStudentAndProgressSemesterAndExecutive(student_pk);
	}
	
	public DormStudentDto getDormStudentByStudentPk(int student_pk){
		return dormStudentMapperJw.selectDormStudentByStudentAndProgressSemester(student_pk);
	}
	
	public ExecutiveDto getDormStudentByStudentPkAndExecutive(int student_pk) {
		return dormStudentMapperJw.selectDormStudentByStudentAndProgressSemesterAndExecutive(student_pk);
	}
	
	public void applyExit(ExitDto exitDto) {
		dormStudentMapperJw.insertExit(exitDto);
	}
	
	public List<Map<String, Object>> getPointSituation(int student_pk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<PointDto> pointSituationList = dormStudentMapperJw.selectPointByStudentAndProgressSemester(student_pk);
		
		for(PointDto pointDto : pointSituationList) {
			
			Map<String, Object> map = new HashMap<>();
			map.put("pointDto", pointDto);
			map.put("pointCategoryDto", dormStudentMapperJw.selectPointCategoryByPointCategoryPk(pointDto.getPoint_category_pk()));
			
			list.add(map);
		}
		
		return list;
	}
	
	public Integer sumTotalPointByStudentPk(int student_pk) {
		return dormStudentMapperJw.sumTotalPointByStudentPk(student_pk);
	}
	
	public void registerDiary(DiaryDto diaryDto) {
		dormStudentMapperJw.insertDiary(diaryDto);
	}
	
	public List<DormNoticeDto> resentBoardthree(){
		
		return dormStudentMapperJw.resentBoardthree();
	}
}

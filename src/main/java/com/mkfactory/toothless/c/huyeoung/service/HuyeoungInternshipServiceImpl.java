package com.mkfactory.toothless.c.huyeoung.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksInternshipCourseDto;
import com.mkfactory.toothless.c.huyeoung.mapper.HuyeoungInternshipSqlMapper;

@Service
public class HuyeoungInternshipServiceImpl {

	@Autowired
	private HuyeoungInternshipSqlMapper huyeoungInternshipSqlMapper;

	// 현장실습 등록
	public void insertInternshipRegister(AjdksInternshipCourseDto ajdksInternshipCourseDto) {

		huyeoungInternshipSqlMapper.insertInternshipRegister(ajdksInternshipCourseDto);

	}

	// 현장실습 등록
	public void updateInternship(AjdksInternshipCourseDto ajdksInternshipCourseDto) {

		huyeoungInternshipSqlMapper.updateInternship(ajdksInternshipCourseDto);

	}

	// 현장실습 목록조회
	public List<Map<String, Object>> selectInternshipAll(AjdksInternshipCourseDto ajdksInternshipCourseDto) {

		List<Map<String, Object>> list = new ArrayList<>();

		List<AjdksInternshipCourseDto> AjdksInternshipArray = huyeoungInternshipSqlMapper
				.selectInternshipAll(ajdksInternshipCourseDto);

		for (AjdksInternshipCourseDto aDto : AjdksInternshipArray) {
			Map<String, Object> map = new HashMap<>();
			map.put("AjdksInternshipCourseDto", aDto);
			
			//System.out.println("company_pk ["+aDto.company_pk+"]");
			//System.out.println("course_title ["+aDto.course_title+"]");
			list.add(map);
		}
		return list;
	}

	// 현장실습 상세조회
	public Map<String, Object> selectInternshipDtil(AjdksInternshipCourseDto ajdksInternshipCourseDto) {

		Map<String, Object> map = new HashMap<String, Object>();

		//System.out.println("상세조회 internship_course_pk["+ajdksInternshipCourseDto.internship_course_pk+"]");
		
		AjdksInternshipCourseDto AjdksInternshipDtl = huyeoungInternshipSqlMapper
				.selectInternshipDtil(ajdksInternshipCourseDto);
		
		//System.out.println("상세조회 AjdksInternshipDtl internship_course_pk["+AjdksInternshipDtl.internship_course_pk+"]");
		
		map.put("AjdksInternshipDtl", AjdksInternshipDtl);

		return map;
	}

}

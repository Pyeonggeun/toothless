package com.mkfactory.toothless.a.commons.mj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.commons.mj.mapper.CommonsSqlMapper;
import com.mkfactory.toothless.a.dto.SemesterDto;

@Service
public class CommonsServiceImpl {
	
	@Autowired
	private CommonsSqlMapper commonsSqlMapper;
	
	// 현재 년도에 등록된 학기들
	public List<Map<String, Object>> getThisYearAllSemester(){
		
		return commonsSqlMapper.selectThisYearAllSemester();
	}

	
}

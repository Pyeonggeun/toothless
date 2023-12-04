package com.mkfactory.toothless.a.commons.mj.mapper;

import java.util.List;
import java.util.Map;

import com.mkfactory.toothless.a.dto.SemesterDto;

public interface CommonsSqlMapper {
	
	public List<Map<String, Object>> selectThisYearAllSemester();
	
	
	
}

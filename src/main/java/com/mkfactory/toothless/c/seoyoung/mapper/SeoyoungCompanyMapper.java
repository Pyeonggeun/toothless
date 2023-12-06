package com.mkfactory.toothless.c.seoyoung.mapper;

import java.util.List;
import java.util.Map;

public interface SeoyoungCompanyMapper {

	////해당 산업체 목록 전체 리스트
	public List<Map<String, Object>> selectCompanyList(int sessionCompanyInfo);

}

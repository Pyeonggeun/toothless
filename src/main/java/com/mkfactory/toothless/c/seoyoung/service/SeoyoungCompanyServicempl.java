package com.mkfactory.toothless.c.seoyoung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.seoyoung.mapper.SeoyoungApplyingSqlMapper;
import com.mkfactory.toothless.c.seoyoung.mapper.SeoyoungCompanyMapper;

@Service
public class SeoyoungCompanyServicempl {
	@Autowired
	private SeoyoungCompanyMapper seoyoungCompanyMapper;

	//해당 산업체 목록 전체 리스트
	public List<Map<String, Object>> companyList(int sessionCompanyInfo) {
		return (List<Map<String, Object>>) seoyoungCompanyMapper.selectCompanyList(sessionCompanyInfo);
	}
}

package com.mkfactory.toothless.c.woojae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.c.dto.AjdksCompanyCategoryDto;
import com.mkfactory.toothless.c.woojae.mapper.WoojaeExternalSqlMapper;


@Service
public class WoojaeExternalServiceImpl {
	
	@Autowired
	private WoojaeExternalSqlMapper woojaeExternalSqlMapper;
	
	public List<AjdksCompanyCategoryDto> companyCategoryList(){
		
		List<AjdksCompanyCategoryDto> companyCategoryList = woojaeExternalSqlMapper.selectCompanyCategoryList();
		
		return companyCategoryList;
	}
	
}

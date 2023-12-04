package com.mkfactory.toothless.e.freeboardcounsel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.e.freeboardcounsel.mapper.FreeboardCounselSqlMapper;

@Service
public class FreeboardCounselServiceImpl {

	@Autowired
	FreeboardCounselSqlMapper freeboardCounselSqlMapper;
	
	public void createFreeboardPostsProcess() {
		freeboardCounselSqlMapper.insertFreeboardPosts();
	}
}

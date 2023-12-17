package com.mkfactory.toothless.a.student.sj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormStudentDto;
import com.mkfactory.toothless.a.dto.RequestRepairDto;
import com.mkfactory.toothless.a.student.sj.mapper.RequestRepairSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class RequestRepairServiceImpl {
	@Autowired
	private RequestRepairSqlMapper requestRepairSqlMapper;
	
	
	
	public void insertRequestRepair(RequestRepairDto requestRepairDto){
		requestRepairSqlMapper.insertRequestRepair(requestRepairDto);
	}
	
	public List<RequestRepairDto> printingAllRequestRepairArticle() {
		return requestRepairSqlMapper.printingArticles();
	}
	
	public List<DormStudentDto> forDormStudentsList(){
		return requestRepairSqlMapper.dormStudents();
	}
	
	public List<Map<String, Object>> name() {
		return requestRepairSqlMapper.name();
	}
	
}

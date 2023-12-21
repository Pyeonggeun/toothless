package com.mkfactory.toothless.a.student.sh.freeboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.a.dto.DormFreeboardDto;
import com.mkfactory.toothless.a.student.sh.freeboard.mapper.DormBoardSqlMapper;

@Service
public class DormBoardServiceImpl {
	
	@Autowired
	private DormBoardSqlMapper dormSqlMapper;
	
	public void wirteGasipan(DormFreeboardDto dormFreeboardDto) {
		dormSqlMapper.insert(dormFreeboardDto);
	}
	
	public List<Map<String, Object>> getGasipanList(){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<DormFreeboardDto> getgasipanList =
				dormSqlMapper.selectAll();
		
		for (DormFreeboardDto dormFreeboardDto : getgasipanList) {
			Map<String, Object> map = new HashMap<>();
			
			map.put("dormFreeboardDto", dormFreeboardDto);
			map.put("studentInfoDto", dormSqlMapper.getStudentInfoById(dormFreeboardDto.getStudent_pk()));
			
			list.add(map);
		}
		
		return list;
	}
	
	public Map<String, Object> getDorm(int id, boolean escape){
		
		Map<String, Object> map = new HashMap<>();
		
		DormFreeboardDto getDorm = dormSqlMapper.selectByBoardId(id);
		
		map.put("studentInfoDto", dormSqlMapper.getStudentInfoById(getDorm.getStudent_pk()));
		
		map.put("dormFreeboardDto", getDorm);
		
		if(escape) {
			// html escape
			String content = getDorm.getContent();
			content = StringEscapeUtils.escapeHtml4(content);
			content = content.replaceAll("\n", "<br>");
			
			getDorm.setContent(content);
		}
		
		return map;
	}
	
	
	public void increaseReadCount(int getstudent_pk) {
		dormSqlMapper.increaseReadCount(getstudent_pk);
	}
	
	public void deleteDorm(int id) {
		dormSqlMapper.delete(id);
	}
	
	public void updateDorm(DormFreeboardDto dormFreeboardDto) {
		
		
		dormSqlMapper.update(dormFreeboardDto);
	}
	
}

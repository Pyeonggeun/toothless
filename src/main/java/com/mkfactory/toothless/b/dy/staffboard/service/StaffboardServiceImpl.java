package com.mkfactory.toothless.b.dy.staffboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dto.StaffboardLikeDto;
import com.mkfactory.toothless.b.dto.StaffboardReplyDto;
import com.mkfactory.toothless.b.dy.staffboard.mapper.StaffboardSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;


@Service
public class StaffboardServiceImpl {

	@Autowired
	private StaffboardSqlMapper staffboardSqlMapper;
	
	public void StaffboardText(StaffboardDto staffboardDto) {
		
		staffboardSqlMapper.insertStaffboardText(staffboardDto);
	}
	
	public List<Map<String, Object>> getBoardContentsInfo() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<StaffboardDto> contentsDtolist = staffboardSqlMapper.selectBoardContentsInfo();
		
		for(StaffboardDto staffboardDto : contentsDtolist) {
			int userPk = staffboardDto.getStaff_pk();
			StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("staffboardDto", staffboardDto);
			map.put("staffInfoDto", staffInfoDto);
			
			list.add(map);	
		}
		return list;
	}
	
	public Map<String, Object> readContentsDetailInfo(int staffboard_pk) {
		
		Map<String, Object> map = new HashMap<>();
		
		StaffboardDto staffboardDto = staffboardSqlMapper.selectContentsDetailInfo(staffboard_pk);
		int userPk = staffboardDto.getStaff_pk();
		StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
		
		map.put("staffboardDto", staffboardDto);
		map.put("staffInfoDto", staffInfoDto);
		
		return map;
	}
	
	public void createTextReadCount(int staffboard_pk) {
		staffboardSqlMapper.updateTextReadCount(staffboard_pk);
	}
	
	public void removeText(int staffboard_pk) {
		staffboardSqlMapper.deleteText(staffboard_pk);
	}
	public void modifyText(StaffboardDto staffboardDto) {
		staffboardSqlMapper.updateModifyText(staffboardDto);
	}
	
	public void writeReply(StaffboardReplyDto staffboardReplyDto){
		staffboardSqlMapper.insertWriteReply(staffboardReplyDto);
	}
	
	public List<Map<String, Object>> getContentReplyInfo(int staffboard_pk){
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<StaffboardReplyDto> boardReplyDtoList = staffboardSqlMapper.selectContentReplyInfo(staffboard_pk);
		
		//댓글쓴유저의 정보와 직원 정보를 묶는다.
		for(StaffboardReplyDto staffboardReplyDto : boardReplyDtoList) {
			int replyUserPk = staffboardReplyDto.getStaff_pk();
			StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(replyUserPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("staffboardReplyDto", staffboardReplyDto);
			map.put("staffInfo", staffInfoDto);
			
			list.add(map);
		}
		
		return list;
	}
	
	public void removeReply(StaffboardReplyDto staffboardReplyDto) {
		staffboardSqlMapper.deleteReply(staffboardReplyDto);
	}
	
	public void modifyReply(StaffboardReplyDto staffboardReplyDto) {
		staffboardSqlMapper.updateReply(staffboardReplyDto);
	}
}





























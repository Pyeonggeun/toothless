package com.mkfactory.toothless.b.dy.staffboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mkfactory.toothless.b.dto.StaffboardDto;
import com.mkfactory.toothless.b.dto.StaffboardImageDto;
import com.mkfactory.toothless.b.dto.StaffboardLikeDto;
import com.mkfactory.toothless.b.dto.StaffboardReplyDto;
import com.mkfactory.toothless.b.dy.staffboard.mapper.StaffboardSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;


@Service
public class StaffboardServiceImpl {

	@Autowired
	private StaffboardSqlMapper staffboardSqlMapper;
	
	public void writeStaffboardText(StaffboardDto staffboardDto, List<StaffboardImageDto> staffboardImageDtoList) { 
		
		 int staffboardPk = staffboardSqlMapper.selectStaffboardPk();
		 
		staffboardDto.setStaffboard_pk(staffboardPk);
		staffboardSqlMapper.insertStaffboardText(staffboardDto);
		
		for(StaffboardImageDto staffboardImageDto : staffboardImageDtoList){
			staffboardImageDto.setStaffboard_pk(staffboardPk);
			staffboardSqlMapper.insertImg(staffboardImageDto);
		}
		
		
	}
	
	public List<Map<String, Object>> getBoardContentsInfo(String searchType, String searchWord) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		List<StaffboardDto> contentsDtolist = staffboardSqlMapper.selectBoardContentsInfo(searchType, searchWord);
		
		for(StaffboardDto staffboardDto : contentsDtolist) {
			int userPk = staffboardDto.getStaff_pk();
			StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
			
			int contentCountPk = staffboardDto.getStaffboard_pk();
			int staffboardLikeDto = staffboardSqlMapper.selectLikeCount(contentCountPk);
			
			int replyCountPk = staffboardDto.getStaffboard_pk();
			int staffboardReplyDto = staffboardSqlMapper.selectReplyCount(replyCountPk);
			
			Map<String, Object> map = new HashMap<>();
			map.put("staffboardDto", staffboardDto);
			map.put("staffInfoDto", staffInfoDto);
			map.put("staffboardLikeDto", staffboardLikeDto);
			map.put("staffboardReplyDto", staffboardReplyDto);
			
			list.add(map);
		}
		return list;
	}
	
	public Map<String, Object> readContentsDetailInfo(int staffboard_pk, boolean escape) {
		
		Map<String, Object> map = new HashMap<>();
		
		StaffboardDto staffboardDto = staffboardSqlMapper.selectContentsDetailInfo(staffboard_pk);
		int userPk = staffboardDto.getStaff_pk();
		StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
		
		//줄바꿈
		if(escape) {
			String content = staffboardDto.getContent();
		
			content = StringEscapeUtils.escapeHtml4(content);
			content = content.replaceAll("\n", "<br>");
			content = content.replaceAll(" ", "&nbsp;");
		
		
			staffboardDto.setContent(content);
		}
		//이미지
		List<StaffboardImageDto> staffboardImageDtoList  = staffboardSqlMapper.selectTextImgListByStaffboardPk(staffboard_pk);
		
		map.put("staffboardDto", staffboardDto);
		map.put("staffInfoDto", staffInfoDto);
		map.put("staffboardImageDtoList", staffboardImageDtoList);
		
		
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
	
	public Map<String, Object> getReply(int staffboard_reply_pk){
		
		Map<String, Object> map = new HashMap<>();
		
		StaffboardReplyDto staffboardReplyDto = staffboardSqlMapper.selectReply(staffboard_reply_pk);
		int replyUserPk = staffboardReplyDto.getStaff_pk();
		StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(replyUserPk);
		
		map.put("staffboardReplyDto", staffboardReplyDto);
		map.put("staffInfo", staffInfoDto);
		
		return map;
	}
	
	public void modifyReply(StaffboardReplyDto staffboardReplyDto) {
		staffboardSqlMapper.updateReply(staffboardReplyDto);
	}
	
	//좋아요
	public void addLike(StaffboardLikeDto staffboardLikeDto) {
		staffboardSqlMapper.insertAddLike(staffboardLikeDto);
	}
	
	//좋아요 취소
	public void canselLike(StaffboardLikeDto staffboardLikeDto) {
		staffboardSqlMapper.deleteCanselLike(staffboardLikeDto);
	}
	
	//좋아요 확인
	public int checkLike(StaffboardLikeDto staffboardLikeDto) {
		
		return staffboardSqlMapper.selectCheckLike(staffboardLikeDto);
	}
	
	//리드페이지 좋아요 수
	public int likeCount(int staffboard_pk) {
		
		return staffboardSqlMapper.selectLikeCount(staffboard_pk);
	}
	//리드페이지 댓글 수
	public int replyCountInContent(int staffboard_pk) {
		return staffboardSqlMapper.selectReplyCount(staffboard_pk);
	}
	
	//수정을위한글불러오기
//	public Map<String, Object> readContentsDetailInfoForUpdate(int staffboard_pk) {
//		
//		Map<String, Object> map = new HashMap<>();
//		
//		StaffboardDto staffboardDto = staffboardSqlMapper.selectContentsDetailInfo(staffboard_pk);
//		int userPk = staffboardDto.getStaff_pk();
//		StaffInfoDto staffInfoDto = staffboardSqlMapper.selectStaffInfo(userPk);
//		
//		//줄바꿈
//		String content = staffboardDto.getContent();
//		
//		content = StringEscapeUtils.escapeHtml4(content);
//		content = content.replaceAll("<br>", "/n");
//		content = content.replaceAll("&nbsp;", " ");
//		
//		staffboardDto.setContent(content);
//		
//		//이미지
//		List<StaffboardImageDto> staffboardImageDtoList  = staffboardSqlMapper.selectTextImgListByStaffboardPk(staffboard_pk);
//		
//		map.put("staffboardDto", staffboardDto);
//		map.put("staffInfoDto", staffInfoDto);
//		map.put("staffboardImageDtoList", staffboardImageDtoList);
//		
//		
//		return map;
//	}
	
	
	
	
	
	
	
	
	
	
}





























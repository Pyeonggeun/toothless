package com.mkfactory.toothless.b.ty.staffboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.b.dto.StudentboardDto;
import com.mkfactory.toothless.b.dto.StudentboardImageDto;
import com.mkfactory.toothless.b.dto.StudentboardLikeDto;
import com.mkfactory.toothless.b.dto.StudentboardReplyDto;
import com.mkfactory.toothless.b.ty.staffboard.mapper.StaffBoardSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

@Service
public class StaffBoardServiceImpl {

	@Autowired
	private StaffBoardSqlMapper staffBoardSqlMapper;

	
	
	public void staffWrite(StudentboardDto StudentboardDto, List<StudentboardImageDto> boardImageDtoList) {
		
		int boardPk = staffBoardSqlMapper.createBoardPk();
		
		StudentboardDto.setStudentboard_pk(boardPk);
		staffBoardSqlMapper.insertNotice(StudentboardDto);
	
		for(StudentboardImageDto imageDto : boardImageDtoList) {
			imageDto.setStudentboard_pk(boardPk);
			staffBoardSqlMapper.insertimg(imageDto);
		}
		
		
	}
	public List<Map<String, Object>> bestRead (){
		List<Map<String, Object>> list = new ArrayList<>();
		List<StudentboardDto> bestReadList = staffBoardSqlMapper.maxRead();
		
		for(StudentboardDto noticeboardDto : bestReadList) {
			int staffPk = noticeboardDto.getStaff_pk();
			StaffInfoDto staffDto = staffBoardSqlMapper.selectById(staffPk);
			
			int replyCommentCount = noticeboardDto.getStudentboard_pk();
			int replyDto = staffBoardSqlMapper.readReplyCount(replyCommentCount);
			
			Map<String, Object> map = new HashMap<>();
			map.put("noticeboardDto", noticeboardDto);
			map.put("staffDto", staffDto);
			map.put("replyDto", replyDto);
			
			list.add(map);
		}
		return list;
	
	
	
	
	}
	
	
	
	public List<Map<String, Object>> boardNoticeList(String searchType, String searchword){
		List<Map<String, Object>> list = new ArrayList<>();
		List<StudentboardDto> noticeDtoList = staffBoardSqlMapper.sellectAll(searchType, searchword);
		
		for(StudentboardDto noticeboardDto : noticeDtoList) {
			int staffPk = noticeboardDto.getStaff_pk();
			StaffInfoDto staffDto = staffBoardSqlMapper.selectById(staffPk);
			
			int boardPk = noticeboardDto.getStudentboard_pk();
			int likeDto = staffBoardSqlMapper.boardLikeCountList(boardPk);
			int imgDto = staffBoardSqlMapper.imageView(boardPk);
			
			List<StudentboardImageDto> boardImageDtoList =
					staffBoardSqlMapper.getArticleImageList(boardPk);
			
			int replyCommentCount = noticeboardDto.getStudentboard_pk();
			int replyDto = staffBoardSqlMapper.readReplyCount(replyCommentCount);
			Map<String, Object> map = new HashMap<>();
			map.put("noticeboardDto", noticeboardDto);
			map.put("staffDto", staffDto);
			map.put("likeDto", likeDto);
			map.put("replyDto", replyDto);
			map.put("imgDto", imgDto);
			map.put("boardImageDtoList",boardImageDtoList);
			
			list.add(map); 
		}
		return list;
	}
	public Map<String, Object> viewDtls(int id){
		Map<String, Object> map = new HashMap<>();
		
		StudentboardDto studentboardDto = staffBoardSqlMapper.selectNoticeId(id);
		int staffPk = studentboardDto.getStaff_pk();
		StaffInfoDto staffInfoDto = staffBoardSqlMapper.selectById(staffPk);
		
		List<StudentboardImageDto> boardImageDtoList =
				staffBoardSqlMapper.getArticleImageList(id);
		
		map.put("staffInfoDto", staffInfoDto);
		map.put("noticeboardDto", studentboardDto);
		map.put("boardImageDtoList", boardImageDtoList);
		
		return map;
	}
	public void delete(int id) {
		staffBoardSqlMapper.deleteNotice(id);
	}
	public void update(StudentboardDto studentboardDto) {
		staffBoardSqlMapper.updateRead(studentboardDto);
	}
	public void increaseCount(int id) {
		staffBoardSqlMapper.increase(id);	
	}
	public void boardReplay(StudentboardReplyDto studentboardReplyDto) {
		staffBoardSqlMapper.insertReply(studentboardReplyDto);
	}
	public List<Map<String, Object>> replyList(int id){
		List<Map<String, Object>> list = new ArrayList<>();
		List<StudentboardReplyDto> replyDtoList = staffBoardSqlMapper.selectreply(id);
		
		for(StudentboardReplyDto replyDto: replyDtoList) {
			Map<String, Object> map = new HashMap<>();
			
			int staffPk = replyDto.getStaff_pk(); // 21
			int studentPk = replyDto.getStudent_pk(); // 0
			
			int staffreplyPk = replyDto.getStudentboard_pk();
			int replyCount = staffBoardSqlMapper.readReplyCount(staffreplyPk);
			
			
			if(staffPk == 0) {
				StudentInfoDto studentDto =staffBoardSqlMapper.StudentSelectId(studentPk); 
				map.put("studentDto", studentDto);
				
			}else {
				StaffInfoDto staffDto = staffBoardSqlMapper.selectById(staffPk);
				map.put("staffDto", staffDto);
				
			}
			map.put("replyDto", replyDto);
			map.put("replyCount", replyCount);
			
			list.add(map);
		}
		return list;
}
	public void deleteBoardReply(int id) {
		staffBoardSqlMapper.deleteReply(id);
	}
	
	
	/*
	 * public int studentBoardReplyCount(StudentboardReplyDto replyDto) { return
	 * staffBoardSqlMapper.replyCount(replyDto); }
	 */
	
	
	
	public void studentBoardLike(StudentboardLikeDto likeDto){
		StudentboardLikeDto like = staffBoardSqlMapper.selectLike(likeDto);
		
		if(like == null ) {
			staffBoardSqlMapper.insertLike(likeDto);
		}else {
			staffBoardSqlMapper.deleteLike(likeDto);
		}
	}
	
	public int count(StudentboardLikeDto likeDto) {
		return staffBoardSqlMapper.likeCount(likeDto);
	}
	public int upAndDownCount(StudentboardLikeDto likeDto) {
		return staffBoardSqlMapper.studentLikeCount(likeDto);
	}

	public int totalList(StudentboardDto totalDto) {
		return staffBoardSqlMapper.totalCount(totalDto);
	}
	public int replyCount(int studentboard_pk) {
		return staffBoardSqlMapper.readReplyCount(studentboard_pk);
	}
	public int likeCount(int like) {
		return staffBoardSqlMapper.boardLikeCountList(like);
	}
	
	
	
	
	
	
	
	
	
	
	
//	public Map<String,Object> reply(int id){
//		Map<String,Object> map = new HashMap<>();
//		
//		//id는 62
//		List<StudentboardReplyDto> replyDtoList = staffBoardSqlMapper.studentOrStaffId(id);
//		
//		for(StudentboardReplyDto e : replyDtoList) {
//			int staffPk = e.getStaff_pk();
//			StaffInfoDto staffInfoDto = staffBoardSqlMapper.selectById(staffPk);
//		}
//		
//		
//		
//		System.out.println(staffPk);
//		
//		int studentPk = replyDto.getStudent_pk();
//		//studentPk = 0;
//		StudentInfoDto studentInfoDto = staffBoardSqlMapper.StudentSelectId(studentPk);
//		//studentInfoDto null ?
//		
//		System.out.println(studentPk);
//		
//		map.put("replyDto", replyDto);
//		map.put("staffInfoDto", staffInfoDto);
//		map.put("studentInfoDto", studentInfoDto);
//		
//		return map;
//	
//	}
	
	

}

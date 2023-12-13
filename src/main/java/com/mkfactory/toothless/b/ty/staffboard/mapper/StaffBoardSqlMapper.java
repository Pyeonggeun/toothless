package com.mkfactory.toothless.b.ty.staffboard.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mkfactory.toothless.b.dto.StudentboardDto;
import com.mkfactory.toothless.b.dto.StudentboardImageDto;
import com.mkfactory.toothless.b.dto.StudentboardLikeDto;
import com.mkfactory.toothless.b.dto.StudentboardReplyDto;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;

public interface StaffBoardSqlMapper {
		
		public int createBoardPk();
	
		public void insertNotice(StudentboardDto StudentboardDto);
		public List<StudentboardDto> sellectAll(
				@Param("searchType") String searchType,
				@Param("searchWord") String searchWord
//				@param ("") ""안에 jsp에서 쓰이는 단어
				);
		public StaffInfoDto selectById(int id);
		public StudentboardDto selectNoticeId(int id);
		public void deleteNotice(int id);
		public void updateRead(StudentboardDto studentboardDto);
		public void increase(int id);
		
		//댓글
		public void insertReply(StudentboardReplyDto studentboardReplyDto);
		public List<StudentboardReplyDto> selectreply(int id);
		public StudentInfoDto StudentSelectId(int id);
		public void deleteReply(int id);
		public int staffReplyCount(int id);
		public List<StudentboardReplyDto> studentOrStaffId(int id);
		public int readReplyCount(int replyCount);
		
		//좋아요
		public void insertLike(StudentboardLikeDto studentboardLikeDto);
		public StudentboardLikeDto selectLike(StudentboardLikeDto studentboardLikeDto);
		public void deleteLike(StudentboardLikeDto studentboardLikeDto);
		public int likeCount(StudentboardLikeDto studentboardLikeDto);
		public int studentLikeCount(StudentboardLikeDto studentboardLikeDto);
		public int boardLikeCountList(int boardPk);
		
		//Total
		public int totalCount(StudentboardDto studentboardDto);
		
		//베스트 글
		public List<StudentboardDto> maxRead();
		
		//이미지
		public void insertimg(StudentboardImageDto studentboardImageDto);
		public List<StudentboardImageDto> getArticleImageList(int studentboard_pk);
	
}


	

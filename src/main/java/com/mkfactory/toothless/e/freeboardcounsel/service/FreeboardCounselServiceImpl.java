package com.mkfactory.toothless.e.freeboardcounsel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardCommentDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.FreeboardImageDto;
import com.mkfactory.toothless.e.freeboardcounsel.mapper.FreeboardCounselSqlMapper;

@Service
public class FreeboardCounselServiceImpl {

	@Autowired
	FreeboardCounselSqlMapper freeboardCounselSqlMapper;
	
	//글 작성
	public void createFreeboardPostsProcess(FreeboardDto paraFreeboardDto, List<FreeboardImageDto> freeboardImageDtoList) {
		
		int freeboardPk = freeboardCounselSqlMapper.createFreeboardPk();
		
		paraFreeboardDto.setId(freeboardPk);
		freeboardCounselSqlMapper.insertFreeboardPosts(paraFreeboardDto);
		
		for(FreeboardImageDto elementFreeboardImageDto: freeboardImageDtoList) {
			elementFreeboardImageDto.setFreeboard_id(freeboardPk); //외래키 
			freeboardCounselSqlMapper.insertImage(elementFreeboardImageDto);
		}
	}
	
	//전체 게시물 불러오기 
	public List<Map<String, Object>> getfreeboardList(){
			
		List<Map<String, Object>> combinedFreeboardList= new ArrayList<>();
		
		List<FreeboardDto> freeboardList = freeboardCounselSqlMapper.selectfreeboardList();
		System.out.println("selectfreeboardList 실행");
		
		List<FreeboardDto> NewPostList =freeboardCounselSqlMapper.selectNewPost();
		
		for(FreeboardDto elementFreeboardDto : freeboardList) {
			int student_pk = elementFreeboardDto.getStudent_pk();
						System.out.println("int student_pk : " + student_pk);
			StudentInfoDto studentInfo  = freeboardCounselSqlMapper.selectStudentInfo(student_pk);
						System.out.println("StudentInfo.getStudent_id : "+studentInfo.getStudent_id());
			
				Map<String, Object> freeboardMap = new HashMap<>();
			freeboardMap.put("studentInfo", studentInfo);
			freeboardMap.put("elementFreeboardDto", elementFreeboardDto);
			
			
			System.out.println("combinedFreeboardList.add 실행 ");
			combinedFreeboardList.add(freeboardMap);
		}
		return combinedFreeboardList;
	}
	
	//올라온 새 글에 아이콘 붙이는
	public List<FreeboardDto> NewPostList() { 
		List<FreeboardDto> NewPostList =freeboardCounselSqlMapper.selectNewPost();
		
		return NewPostList;
	}
	
	//조회수 기준 베스트 글 
	public List<Map<String, Object>> getBestFreeboardPost(){
		
		List<Map<String, Object>> bestFreeboardPostList= new ArrayList<>();
		List<FreeboardDto> bestfreeboardpost = freeboardCounselSqlMapper.bestFreeboardPost();
		
		for(FreeboardDto elementFreeboardPost : bestfreeboardpost) {
			int student_pk = elementFreeboardPost.getStudent_pk();
			StudentInfoDto studentInfo  = freeboardCounselSqlMapper.selectStudentInfo(student_pk);

			
			Map<String, Object> bestpostMap = new HashMap<>();
			bestpostMap.put("studentInfo", studentInfo);
			bestpostMap.put("elementFreeboardPost",elementFreeboardPost);
			
			bestFreeboardPostList.add(bestpostMap);
		}
		return bestFreeboardPostList;
	}
	
	//댓글 뽑아오기 
	public List<Map<String, Object>> selectFreeboardComment(){
		System.out.println("서비스 댓글 뽑아오기 시작");
		
		List<Map<String, Object>> selectFreeboardCommentList= new ArrayList<>();
		System.out.println("서비스 댓글 new ArrayList");
		List<FreeboardCommentDto> selectFreeboardComment = freeboardCounselSqlMapper.selectFreeboardComment();
			System.out.println("서비스 댓글 리스트 뽑아옴");
			
			for(FreeboardCommentDto elementFreeboardCommentDto : selectFreeboardComment) {
					System.out.println("서비스 댓글 뽑아오기 for문 시작");
				int student_pk= elementFreeboardCommentDto.getStudent_pk();
					System.out.println("student_pk뽑아옴" +student_pk);
				StudentInfoDto studentInfo = freeboardCounselSqlMapper.selectStudentInfoForComment(student_pk);
				
				Map<String, Object> commentMap = new HashMap<>();
				commentMap.put("elementFreeboardCommentDto",elementFreeboardCommentDto);
				commentMap.put("studentInfo",studentInfo);
					System.out.println("commentMap에 넣기 ");
				 
				selectFreeboardCommentList.add(commentMap);	
			}
		return selectFreeboardCommentList;	
	}
	
	//게시물 카운트해서 위에서 보여주려고 함...
	public int selectFreeboardCount(FreeboardDto paraFreeboardDto){
		int CountedPost = freeboardCounselSqlMapper.selectFreeboardCount(paraFreeboardDto);
	return CountedPost;
	}
	
	
	//상담자유게시판 댓글 넣기  
	public void insertFreeboardComment(FreeboardCommentDto paraFreeboardCommentDto) {
			System.out.println("서비스 insertFreeboardComment 실행");
		freeboardCounselSqlMapper.insertFreeboardComment(paraFreeboardCommentDto);
			System.out.println("서비스 insertFreeboardComment 완료");
	}
	
	

	
	//-----------------------------------------------------------------------------//
	//상세 글보기
	public Map<String, Object> pickPost(int id){

		Map<String, Object> combinedMap = new HashMap<>();

		FreeboardDto freeboardPost =  freeboardCounselSqlMapper.selectPostById(id);
		int student_pk =freeboardPost.getStudent_pk();
		StudentInfoDto studentInfo = freeboardCounselSqlMapper.selectByStudentId(student_pk);
		
		//이미지 뽑아오기
		List<FreeboardImageDto> freeboardImageDtoList = freeboardCounselSqlMapper.selectFreeboardImageDto(id);
		
		combinedMap.put("freeboardPost",freeboardPost);
		combinedMap.put("studentInfo", studentInfo);
		combinedMap.put("freeboardImageDtoList ", freeboardImageDtoList);
		
		return combinedMap;
		}
	
	//조회수
	public void readCount(int id) {
		freeboardCounselSqlMapper.readCount(id);
	}
	
	//글 삭제
	public void deleteFreeboardPost(int id) {
		freeboardCounselSqlMapper.deleteFreeboardPost(id);
	}
	
	//글 수정
	public void updateFreeboardPost(FreeboardDto paraFreeboardDto) {		
		freeboardCounselSqlMapper.updateFreeboardPost( paraFreeboardDto);	
	}
}

package com.mkfactory.toothless.e.freeboardcounsel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.freeboardcounsel.mapper.FreeboardCounselSqlMapper;

@Service
public class FreeboardCounselServiceImpl {

	@Autowired
	FreeboardCounselSqlMapper freeboardCounselSqlMapper;
	
	public void createFreeboardPostsProcess(FreeboardDto paraFreeboardDto) {
		freeboardCounselSqlMapper.insertFreeboardPosts(paraFreeboardDto);
	}
	
	public List<Map<String, Object>> getfreeboardList(){
			
		List<Map<String, Object>> combinedFreeboardList= new ArrayList<>();
		
		List<FreeboardDto> freeboardList = freeboardCounselSqlMapper.selectfreeboardList();
		System.out.println("selectfreeboardList 실행");
		
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
	
	//게시물 카운트해서 위에서 보여주려고 함...
	public int selectFreeboardCount(FreeboardDto paraFreeboardDto){
		int CountedPost = freeboardCounselSqlMapper.selectFreeboardCount(paraFreeboardDto);
	return CountedPost;
	}
	

	
	
	
	
	//-----------------------------------------------------------------------------//
	//상세 글보기
	public Map<String, Object> pickPost(int id){

		Map<String, Object> combinedMap = new HashMap<>();

		FreeboardDto freeboardPost =  freeboardCounselSqlMapper.selectPostById(id);
		int student_pk =freeboardPost.getStudent_pk();
		StudentInfoDto studentInfo = freeboardCounselSqlMapper.selectByStudentId(student_pk);

		combinedMap.put("freeboardPost",freeboardPost);
		combinedMap.put("studentInfo", studentInfo);
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

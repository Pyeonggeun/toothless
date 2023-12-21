package com.mkfactory.toothless.e.freeboardcounsel.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import com.mkfactory.toothless.e.dto.FreeboardCommentDto;
import com.mkfactory.toothless.e.dto.FreeboardDto;
import com.mkfactory.toothless.e.dto.FreeboardEmpathyDto;
import com.mkfactory.toothless.e.dto.FreeboardImageDto;
import com.mkfactory.toothless.e.freeboardcounsel.service.FreeboardCounselServiceImpl;

@Controller
@RequestMapping("/tl_e/freeboardCounsel/*")
public class FreeboardCounselController {

	@Autowired
	FreeboardCounselServiceImpl  freeboardCounselService;
	
	//작성글이 리스팅 되야하는 자유게시판 페이지
	@RequestMapping("freeboardCounselPage")
	public String freeboardCounsel(Model model, FreeboardDto paraFreeboardDto,
		
			String searchType,
			String searchWord
			) {
		
		List<Map<String, Object>> combinedFreeboardList = freeboardCounselService.getfreeboardList(searchType,searchWord);
		//게시글 목록
		model.addAttribute("combinedFreeboardList", combinedFreeboardList);
			System.out.println("상담게시판 메인페이지 리스팅 완료 ");
			
		//조회수 기준 베스트 글 목록
		List<Map<String, Object>> bestFreeboardPostList = freeboardCounselService.getBestFreeboardPost();
		model.addAttribute("bestFreeboardPostList",bestFreeboardPostList);
		
		//총게시물 수 뽑아오기 
		int countedPost = freeboardCounselService. selectFreeboardCount(paraFreeboardDto);
		model.addAttribute("countedPost", countedPost);	
			
		//가장 높은 숫자의 글번호 글을 뽑아와서 new아이콘 붙이기 
		List<FreeboardDto> newPostList = freeboardCounselService.NewPostList();
		model.addAttribute("newPostList",newPostList);
		

		return "tl_e/freeboardCounsel/freeboardCounselPage";
	}
	
	//자유게시판 글 작성 페이지
	@RequestMapping("createFreeboardPostsPage")
	public String createFreeboardPostsPage() {
		  
		return "tl_e/freeboardCounsel/createFreeboardPostsPage";
	 }
	
	//자유게시판 글 작성한 내용 dto에 집어넣는 프로세스 
	@RequestMapping("createFreeboardPostsProcess")
	public String createFreeboardPostsProcess(FreeboardDto paraFreeboardDto, MultipartFile[] imgFiles) {
				System.out.println("createFreeboardPostsProcess 시작");
				
			//직접 파라미터 세팅
				List<FreeboardImageDto> freeboardImageDtoList = new ArrayList<>();
				
			//파일저장로직
			if(imgFiles != null) {
				for(MultipartFile multipartFile: imgFiles) {
					if(multipartFile.isEmpty()) {
						continue;
					}
					
				String rootPath ="C:/uploadFiles/";
				
				//날짜별 폴더 생성	
				//simpledateformat은 날짜를 문자로, 문자를 날짜로 바꾸는 api
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd/");
				String todayPath = sdf.format(new Date());
					
				File todayFolderForCreate = new File(rootPath + todayPath);
				
				if(! todayFolderForCreate.exists()) {
					todayFolderForCreate.mkdirs();
				}
				
				String originalFileName = multipartFile.getOriginalFilename();
				
				//파일명 충돌 회피 - 랜덤, 시간 조합
				String uuid = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();
				String fileName= uuid + "_" + currentTime;
				
				//확장자 추출 - 오리지날네임에서 
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
				fileName += ext;
				
				try {
					multipartFile.transferTo(new File(rootPath+ todayPath+ fileName));	
				}catch(Exception e) {
				e.printStackTrace();
				}
				
				FreeboardImageDto freeboardImageDto = new FreeboardImageDto();
				freeboardImageDto.setFreeboard_image_link(todayPath + fileName);

				freeboardImageDtoList.add(freeboardImageDto);
				
				}
			}
			freeboardCounselService.createFreeboardPostsProcess(paraFreeboardDto, freeboardImageDtoList);
				System.out.println("createFreeboardPostsProcess 완료");
			
		return "tl_e/freeboardCounsel/createFreeboardPostsComplete";
	}
	
	//자유게시판 상세 글보기 페이지
	@RequestMapping("readFreeboardPostPage")
	public String readFreeboardPostPage(Model model, int id, FreeboardEmpathyDto paraFreeboardEmpathyDto, HttpSession session) {
			System.out.println("컨트롤 상세글보기 페이지 시작");
			
		//조회수 카운트
		freeboardCounselService.readCount(id);
			System.out.println("컨트롤 readCount시작");
		
		Map<String, Object> pickpostMap = freeboardCounselService.pickPost(id);
		model.addAttribute("pickpostMap", pickpostMap);
			System.out.println("컨트롤 상세글 뽑아와서 모델에 넣음");

		//유저정보와 게시글 정보로 공감 카운트 뽑아오기 
		paraFreeboardEmpathyDto.setFreeboard_id(id);
		StudentInfoDto aa = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		paraFreeboardEmpathyDto.setStudent_pk(aa.getStudent_pk());	
			
			
		Map<String, Object>	countedEmpathy= freeboardCounselService.submitAndSelectEmpathy(paraFreeboardEmpathyDto);
			System.out.println("countedEmpathy : "+countedEmpathy);
		model.addAttribute("countedEmpathy", countedEmpathy);
		
		//댓글
		List<Map<String, Object>> selectFreeboardCommentList= freeboardCounselService.selectFreeboardComment();
			System.out.println("컨트롤 댓글 뽑아옴");
		model.addAttribute("selectFreeboardCommentList",selectFreeboardCommentList);
			System.out.println("컨트롤 댓글 뽑아와서 모델에 넣음");
			
		//이미지
		List<FreeboardImageDto> freeboardImageDtoList = freeboardCounselService.getFreeboardImage(id);
		model.addAttribute("freeboardImageDtoList", freeboardImageDtoList);
		
		return "tl_e/freeboardCounsel/readFreeboardPostPage";
	}
	
	//공감 집어넣기
	@RequestMapping("insertEmpathy")
	public String insertEmpathy(HttpSession session , FreeboardEmpathyDto paraFreeboardEmpathyDto) {
		
		StudentInfoDto studentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		paraFreeboardEmpathyDto.setStudent_pk(studentInfo.getStudent_pk());
		freeboardCounselService.insertEmpathy(paraFreeboardEmpathyDto);
		return "redirect: ./readFreeboardPostPage?id=" + paraFreeboardEmpathyDto.getFreeboard_id();
	}
	
	//공감 삭제하기
	@RequestMapping("deleteEmpathyByIdAndPk")
	public String deleteEmpathyByIdAndPk(HttpSession session, FreeboardEmpathyDto paraFreeboardEmpathyDto) {
		StudentInfoDto studentInfo = (StudentInfoDto)session.getAttribute("sessionStudentInfo");
		paraFreeboardEmpathyDto.setStudent_pk(studentInfo.getStudent_pk());
		
		freeboardCounselService.deleteEmpathyByIdAndPk(paraFreeboardEmpathyDto);
		return "redirect: ./readFreeboardPostPage?id=" + paraFreeboardEmpathyDto.getFreeboard_id();

	}
	
	//댓글 작성하기
	@RequestMapping("insertFreeboardComment")
	public String insertFreeboardComment(FreeboardCommentDto paraFreeboardCommentDto, HttpSession session) {

		StudentInfoDto studentInfoDto = (StudentInfoDto)session.getAttribute("sessionStudentInfo");

		paraFreeboardCommentDto.setStudent_pk(studentInfoDto.getStudent_pk());
		
		System.out.println("insertFreeboardComment 시작");
		freeboardCounselService.insertFreeboardComment(paraFreeboardCommentDto);
			System.out.println("insertFreeboardComment 완료");
		return "redirect: ./readFreeboardPostPage?id=" + paraFreeboardCommentDto.getFreeboard_id();
	}
	
	
	//자유게시판 글 수정 페이지
	@RequestMapping("updateFreeboardPostPage")
	public String updateFreeboardPostPage(Model model, int id) {
		
		model.addAttribute("pickpostMap",freeboardCounselService.pickPost(id));
		
		return "./tl_e/freeboardCounsel/updateFreeboardPostPage";
	}
	
	//자유게시판 글 수정 프로세스
	@RequestMapping("updateFreeboardPostProcess")
	public String updateFreeboardPostProcess(FreeboardDto paraFreeboardDto) {
			
		freeboardCounselService.updateFreeboardPost(paraFreeboardDto);
			
		return "redirect: ./readFreeboardPostPage?id=" + paraFreeboardDto.getId();
	}
	//자유게시판 글 삭제 프로세스
	@RequestMapping("deleteFreeboardPostProcess")
	public String deleteFreeboardPostProcess(int id) {
		
		freeboardCounselService.deleteFreeboardPost(id);
		
		return "redirect:./freeboardCounselPage";
	}
	
	
	// 로그아웃하거나 링크 이동 하는 
	//자유게시판에서 학생계정 로그아웃 하기
		@RequestMapping("logoutProcess")
		public String logoutProcess(HttpSession session) {
			session.invalidate();
			return "redirect:../../another/student/loginPage";
		}
		
	//상담 학생 메인 페이지로 가게 하기 
	@RequestMapping("goCounselStudentPage")
	public String goCounselStudentPage() {
		
		return "redirect:../commons/counselCenterStudentMainPage";
	}

	//학사정보시스템 메인으로 이동하게 하기
	@RequestMapping("goStudentMainPage")
	public String goStudentMainPage() {
		
		return "redirect:../../another/student/mainPage";
	}
	
	
	
}

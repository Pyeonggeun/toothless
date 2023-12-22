package com.mkfactory.toothless.c.guntaek.controller;
// 죄송합니다 서비스에서 List<Map<String,Object>> 아님
// 최소한 Map<String,Object> 엮어서 값을 컨트롤러에 가져왔어야하는데 그걸 나중에 깨달았습니다. --2023년 12월 7일 올림-- (돌이키긴 너무 늦었다)
// 교육 프로그램 부터 단축 시작

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduApplying;
import com.mkfactory.toothless.c.dto.AjdksInternEduProgramDto;
import com.mkfactory.toothless.c.dto.AjdksInternEduReviewDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionImgDto;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStaffServiceImpl;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
import oracle.security.o3logon.a;
@Controller
@RequestMapping("/tl_c/guntaek/student/*")
public class GuntaekStudentController {
	@Autowired
	private GuntaekStudentServiceImpl guntaekStudentService;
	// 학생 서비스
	
	@Autowired
	private GuntaekStaffServiceImpl guntaekStaffService;
	// 교직원 서비스
	
	
	
	// 학생 메인 패이지 포워딩
	@RequestMapping("ajdksStudentMainPage")
	public String ajdksStudentMaingPage() {
		return "tl_c/guntaek/student/ajdksStudentMainPage";
	}
	
	
	
	// 이력서 포워딩
	@RequestMapping("ajdksRegisterSelfIntroduction")
	public String ajdksRegisterSelfIntroduction(HttpSession session,
		Model model, AjdksSelfIntroductionDto ajdksSelfIntroductionDto){
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 되어있는 학생 Dto
		
		model.addAttribute("loginUser",loginUser);
		int introductionCount = guntaekStudentService.countSelfIntroduction(loginUser.getStudent_pk());
		// 현재 로그인 한 학생의 이력서 개수 가져오기
		// 이력서 불러오기 위해 사용되는 쿼리 스트링 이용하여 얻어오는 DTO
		AjdksSelfIntroductionDto studentIntroductionDto = guntaekStudentService.getselfIntroductionDto(ajdksSelfIntroductionDto.getStudent_pk());
		List<AjdksSelfIntroductionDto> ajdksSelfIntroductionDtoList = guntaekStudentService.getSelfIntroductionDtoList();
		model.addAttribute("ajdksSelfIntroductionDtoList",ajdksSelfIntroductionDtoList);
		// 자기소개서 dto 가져오고
		AjdksSelfIntroductionDto selfIntroductionDto = guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk());
		// 만약 로그인한 놈 자기소개서 Dto가 존재한다면 (이미지 파일 예외처리)
		if(selfIntroductionDto != null) {
		// 자기소개서의 img_pk 에 해당하는 이미지 링크 가져오기		
		String imageLink = guntaekStudentService.getSelfIntroductionFile(selfIntroductionDto.getSelf_introduction_img_pk());
		
		model.addAttribute("imageLink",imageLink);
		}
		// 자격증 기능 스타트	
		// 로그인한 학생키를 이용하여 그 로그인 한 학생이 작성한 자격증 DTO 리스트 가져오기 
		List<AjdksCertificationDto> certificationList = 
		guntaekStudentService.getCertificationByStudentPk(loginUser.getStudent_pk());	
		// 현재 학생의 고유키 넣어줌.
		model.addAttribute("student_pk",loginUser.getStudent_pk());
		// 현재 학생 이력서 dto 넣어줌
		model.addAttribute("selfIntroductionDto",
				guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk()));
		// 현재 학생이 작성한 이력서 개수
		model.addAttribute("introductionCount", introductionCount);
		// jsp 에서 쿼리 스트링으로 받아온 학생키로 이력서 dto (불러오기에 사용)
		model.addAttribute("studentIntroductionDto", studentIntroductionDto);
		//  자격증 model 전달
		model.addAttribute("certificationList", certificationList);
	
		
		// 특정학생 학과 불러오기
		String departmentName = guntaekStudentService.getDepartmentName(loginUser.getDepartment_pk());
		
		model.addAttribute("departName",departmentName);
		
		
		
		return "tl_c/guntaek/student/ajdksRegisterSelfIntroduction";
	}
	
	// 이력서 insert
	@RequestMapping("ajdksRegisterSelfIntroductionProcess")
	public String ajdksRegisterSelfIntroductionProcess(HttpSession session, 
	AjdksSelfIntroductionDto selfIntroductionDto, Model model){
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 유저 얻어오기
		int student_pk = loginUser.getStudent_pk();
		selfIntroductionDto.setStudent_pk(student_pk);
		// 현재 학생키 이력서Dto에 할당
		guntaekStudentService.registerSelfIntroduction(selfIntroductionDto);
		// 현재학생 기준 이력서 insert
		
		return "redirect:./ajdksRegisterSelfIntroduction";
	}
	// 특정 학생 이력서 update
	@RequestMapping("ajdksUpdateSelfIntroductionProcess")
	public String ajdksUpdateSelfIntroductionProcess(HttpSession session, AjdksSelfIntroductionDto selfIntroductionDto) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 유저 얻어오기	
		selfIntroductionDto.setStudent_pk(loginUser.getStudent_pk());
		guntaekStudentService.updateSelfIntroductionDto(selfIntroductionDto);
		return "redirect:./ajdksRegisterSelfIntroduction";
	}
	
	// 학생의 특정 자격증 delete
	@RequestMapping("ajdksDeleteCertification")
	public String ajdksDeleteCertification(AjdksCertificationDto certificationDto) {
		guntaekStudentService.deleteCertificationByFile(certificationDto.getCertification_file());
		
		return "redirect:./ajdksRegisterSelfIntroduction";
	}

	// 자격증 추가 프로세스
	@RequestMapping("ajdksRegisterCertificationProcess")
	public String ajdksRegisterCertification(AjdksCertificationDto certificationDto, MultipartFile imageLink
			,HttpSession session) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");

		certificationDto.setStudent_pk(loginUser.getStudent_pk());
		// 자격증 Dto에 로그인 한 학생 pk 저장
		
		// 만약 자격증 파일이 존재한다면
		if(imageLink != null) {
			String rootPath = "C:/Git_imageFile/";	
			// 날짜별 폴더 생성.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayPath = sdf.format(new Date());
				
			File todayFolderForCreate = new File(rootPath + todayPath);
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs(); // 파일 생성 안되어있으면 생성해주고
			}
			String originalMainFileName = imageLink.getOriginalFilename();
			// 파일 명 저장
			//파일명 충돌 회피 - 랜덤, 시간 조합
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			String fileName = uuid + "_" + currentTime;
		
			// 랜덤숫자 + "_" + 최근시간
			// 확장자 추출
			// 맨 뒤에서부터 .을 기준으로 자른다.
			String ext = originalMainFileName.substring(originalMainFileName.lastIndexOf("."));
			fileName += ext;
			// 파일네임에다가 확장자더해줌
			try {
				imageLink.transferTo(new File(rootPath + todayPath + fileName));					
				// 받은거 그대로 저장하겠다는 뜻이다.
				// 예외처리 필요하다. 
			}catch(Exception e) {
				e.printStackTrace();
			}
			certificationDto.setCertification_file(todayPath + fileName);
			// 자격증 파일 이미지 링크 저장해주고	
		}			
		guntaekStudentService.registerCertification(certificationDto);
		// 서비스 호출하여 자격증 Dto Insert 해준다.
		return "redirect:./ajdksRegisterSelfIntroduction";
	}
	// 자격증 추가하는 페이지 포워딩 (이력서 포워딩이랑 똑같음)
	@RequestMapping("ajdksRegisterCertification")
	public String ajdksRegisterCertification(HttpSession session,
			Model model, AjdksSelfIntroductionDto ajdksSelfIntroductionDto){
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 되어있는 학생 Dto
		model.addAttribute("loginUser",loginUser);
		int introductionCount = guntaekStudentService.countSelfIntroduction(loginUser.getStudent_pk());
		// 현재 로그인 한 학생의 이력서 개수 가져오기
		// 이력서 불러오기 위해 사용되는 쿼리 스트링 이용하여 얻어오는 DTO
		AjdksSelfIntroductionDto studentIntroductionDto = guntaekStudentService.getselfIntroductionDto(ajdksSelfIntroductionDto.getStudent_pk());
	
		List<AjdksSelfIntroductionDto> ajdksSelfIntroductionDtoList = guntaekStudentService.getSelfIntroductionDtoList();
		model.addAttribute("ajdksSelfIntroductionDtoList",ajdksSelfIntroductionDtoList);
		// 자기소개서 dto 가져오고
		AjdksSelfIntroductionDto selfIntroductionDto = guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk());
		// 만약 로그인한 놈 자기소개서 Dto가 존재한다면 (이미지 파일 예외처리)
			
		if(selfIntroductionDto != null) {
		// 자기소개서의 img_pk 에 해당하는 이미지 링크 가져오기		
		String imageLink = guntaekStudentService.getSelfIntroductionFile(selfIntroductionDto.getSelf_introduction_img_pk());
		model.addAttribute("imageLink",imageLink);
		}
		// 자격증 기능 스타트	
		// 로그인한 학생키를 이용하여 그 로그인 한 학생이 작성한 자격증 DTO 리스트 가져오기 
		List<AjdksCertificationDto> certificationList = 
		guntaekStudentService.getCertificationByStudentPk(loginUser.getStudent_pk());	
		model.addAttribute("student_pk",loginUser.getStudent_pk());
		model.addAttribute("selfIntroductionDto", guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk()));
		model.addAttribute("introductionCount", introductionCount);
		model.addAttribute("studentIntroductionDto", studentIntroductionDto);
		model.addAttribute("certificationList", certificationList);
		return "tl_c/guntaek/student/ajdksRegisterCertification";
	}
	
	// 자격증 이미지 파일 포워딩
	@RequestMapping("ajdksShowCertification")
	public String ajdksShowImageFile(String imageLink, Model model) {
		model.addAttribute("imageLink",imageLink);
		
		return "tl_c/guntaek/student/ajdksShowCertification";
	}
	// 이력서 조회 포워딩
	
	@RequestMapping("ajdksResumeInquiry")
	public String ajdksResumeInquiry(HttpSession session, Model model) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		
		// 자기소개서 dto 가져오고
		AjdksSelfIntroductionDto selfIntroductionDto = guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk());
		if(selfIntroductionDto != null) {
			// 자기소개서의 img_pk 에 해당하는 이미지 링크 가져오기		
			String imageLink = guntaekStudentService.getSelfIntroductionFile(selfIntroductionDto.getSelf_introduction_img_pk());
			model.addAttribute("imageLink",imageLink);
			
			// 특정 학생 학과 가져오기
			
			
			
		}
		
		
		
		Map<String,Object> Student = new HashMap<String,Object>(); 
			
		int student_pk = loginUser.getStudent_pk();
		//로그인 유저 키

		String departmentName = guntaekStudentService.getDepartmentName(loginUser.getDepartment_pk());
		// 부서이름 부서키를 통해서 가져오기
		
		int semester = guntaekStudentService.getStudentSemester(student_pk);
		
		// 학생 Dto를 가져온다 (로그인한 키를 통하여)
		String proffessorName = guntaekStudentService.getProfessorName(loginUser.getProfessor_pk());

		// 특정 학생의 자격증 Dto List 를 가져온다. 이거 Map에 넣어줄겅미
		List<AjdksCertificationDto> CertificationDtoList = guntaekStudentService.getCertificationByStudentPk(student_pk);
	
		
		Student.put("introductionDto",guntaekStudentService.getselfIntroductionDto(student_pk));
		Student.put("studentDto", loginUser);
		Student.put("departmentName", departmentName);
		Student.put("proffessorName", proffessorName);
		Student.put("semester", semester);
		Student.put("certificationDtoList", CertificationDtoList);
		// 특정 학생의 자격증 Dto 리스트가 필요하다. map이랑 list 엮으면 될거같다.
		
		model.addAttribute("Student",Student);
		
		String departMentName = guntaekStudentService.getDepartmentName(loginUser.getDepartment_pk());
		
		
		
		model.addAttribute("departName", departMentName);
		
		
		
		System.out.println(departMentName);
		
		return "tl_c/guntaek/student/ajdksResumeInquiry";
	}
	
	
	
	
	// 이력서 이미지 insert 
	@RequestMapping("ajdksRegisterIntroductionImage")
	public String ajdksRegisterIntroductionImage(MultipartFile imageLink, AjdksSelfIntroductionImgDto ImageDto
			,HttpSession session) {

		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 로그인한 유저를 얻어온다.
		int student_pk = loginUser.getStudent_pk();		
		if(imageLink != null) {
			String rootPath = "C:/Git_imageFile/";	
			// 날짜별 폴더 생성.
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");
			String todayPath = sdf.format(new Date());
				
			File todayFolderForCreate = new File(rootPath + todayPath);
			if(!todayFolderForCreate.exists()) {
				todayFolderForCreate.mkdirs(); // 파일 생성 안되어있으면 생성해주고
			}
			String originalMainFileName = imageLink.getOriginalFilename();
			// 파일 명 저장
			//파일명 충돌 회피 - 랜덤, 시간 조합
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			String fileName = uuid + "_" + currentTime;	
			// 랜덤숫자 + "_" + 최근시간
			// 확장자 추출
			// 맨 뒤에서부터 .을 기준으로 자른다.
			String ext = originalMainFileName.substring(originalMainFileName.lastIndexOf("."));
			fileName += ext;
		
			// 파일네임에다가 확장자더해줌
			try {
				imageLink.transferTo(new File(rootPath + todayPath + fileName));					
				// 받은거 그대로 저장하겠다는 뜻이다.
				// 예외처리 필요하다. 
			}catch(Exception e) {
				e.printStackTrace();
			}		
			ImageDto.setSelf_introduction_img(todayPath + fileName);		
	}
		guntaekStudentService.registerIntroductionImg(ImageDto, student_pk);	
		return "redirect:./ajdksRegisterSelfIntroduction";
	}
	
	// ---------------------------------------------------------------------------------------------
	// 교육프로그램 기능 구현 시작
	// 프로그램 리스트 보기
	@RequestMapping("ajdksInquiryProgram")
	public String ajdksInquiryProgram(Model model, HttpSession session) {
		// 일단 현장실습 타이틀 이랑 그림이 일렬로 나와야한다.
		
		// 리스트 생성
		Map<String, Object> EduListProgram = guntaekStaffService.allProgram();
		
		//모든 프로그램 리스트를 넣어줬다.
		model.addAttribute("eduListProgram",EduListProgram); // 전체적인 eduDto, staffDto 가 나온다.
		
		return "tl_c/guntaek/student/ajdksInquiryProgram";
	}
	
	// 교육 프로그램 리스트 자세히 보기
	@RequestMapping("ajdksDetailInquiryProgram")
	public String ajdksDetailInquiryProgram(int internedu_program_pk, Model model, HttpSession session) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		model.addAttribute("loginUser",loginUser);
		
		AjdksInternEduProgramDto EduDto = guntaekStaffService.getEduDto(internedu_program_pk);
		StaffInfoDto staffDto = guntaekStaffService.getStaffDto(EduDto.getStaff_pk());
		
		model.addAttribute("EduDto",EduDto); // 현재 프로그램 Dto
		model.addAttribute("staffDto",staffDto); // 현재 프로그램 만든 담당자 Dto 넣어줌		
		
		AjdksInternEduApplying EduApplying = new AjdksInternEduApplying();
		EduApplying.setInternedu_program_pk(internedu_program_pk);
		EduApplying.setStudent_pk(loginUser.getStudent_pk());
		
		model.addAttribute("EduApplying",guntaekStudentService.programToApply(EduApplying));
		// 이미 등록한 프로그램일시 안보이게
		
		// 교육 프로그램 키를 넣어서 마감이 되었다면 그 값을 얻어올 것이고 마감이 아직 안되었다면 그 Dto를 얻어오지 못할 것이다.
		model.addAttribute("DeadProgram", guntaekStudentService.deadProgram(internedu_program_pk));
		return "tl_c/guntaek/student/ajdksDetailInquiryProgram";
	}
	
	
	
	// 학생이 프로그램 신청하기
	@RequestMapping("ajdksRegisterProgramProcess")
	public String ajdksRegisterProgram(AjdksInternEduProgramDto eduDto, Model model,HttpSession session) {
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		model.addAttribute("loginUser",loginUser);
		AjdksInternEduApplying EduApplying = new AjdksInternEduApplying();
		EduApplying.setInternedu_program_pk(eduDto.getInternedu_program_pk());
		EduApplying.setStudent_pk(loginUser.getStudent_pk());
		guntaekStudentService.RegisterProgramProcess(EduApplying);
		// 프로그램 등록하게 하는 서비스	
		return "redirect:./ajdksInquiryProgram";
	}
	
	// 특정 학생이 신청한 프로그램 리스트 볼 수 있는 페이지 (신청 취소가 가능하다는걸 일단 가정하자)
	@RequestMapping("ajdksApplyProgram")
	public String ajdksApplyProgram(HttpSession session, Model model) {
			
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo"); // 로그인 한 학생 유저
		int student_pk=loginUser.getStudent_pk();

		List<Map<String,Object>> applyprogramList = guntaekStudentService.applyprogramListByStudent(student_pk);
		model.addAttribute("applyprogramList",applyprogramList);
		
		
		
		return  "tl_c/guntaek/student/ajdksApplyProgram"; // 페이지 포워딩 
	}
	// 이수 내역 확인 (이미 이수한 것만 나오는 리스트 페이지 포워딩)
	@RequestMapping("ajdksCheckProgramComplete")
	public String ajdksCheckProgramComplete(HttpSession session, Model model) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo"); // 로그인 한 학생 유저

		model.addAttribute("CompleteList",guntaekStudentService.completeProgramList(loginUser.getStudent_pk()));
		
		// 특정 학생이 이수한 것만 리스트로 얻어오기 
		
		return "tl_c/guntaek/student/ajdksCheckProgramComplete";
	}
	
// 리뷰 페이지 포워딩
	@RequestMapping("ajdksRegisterProgramReview")
	public String ajdksRegisterProgramReview(HttpSession session, Model model) {
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo"); // 로그인 한 학생 유저
	
		// 이수 완료 한 것만 갖고와야한다.
		model.addAttribute("ProgramList",guntaekStudentService.programListByStudent(loginUser.getStudent_pk()));
		

		
		return "tl_c/guntaek/student/ajdksRegisterProgramReview";
	}
	// 리뷰 등록
	@RequestMapping("ajdksRegisterProgramReviewProcess")
	public String ajdksRegisterReview(HttpSession session,AjdksInternEduReviewDto review, AjdksInternEduApplying apply) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo"); // 로그인 한 학생 유저
		
		apply.setStudent_pk(loginUser.getStudent_pk());
		
		int app = guntaekStudentService.getApplyKey(apply);
		
		review.setInternedu_applying_pk(app);
		
		guntaekStudentService.registerProgramReview(review);
		
	
		return "redirect:./ajdksRegisterProgramReview";
	}
	
	
	// 이수한 프로그램만 

}

	
	
	
	
	

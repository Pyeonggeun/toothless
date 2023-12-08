package com.mkfactory.toothless.c.guntaek.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mkfactory.toothless.c.dto.AjdksCertificationDto;
import com.mkfactory.toothless.c.dto.AjdksSelfIntroductionDto;
import com.mkfactory.toothless.c.guntaek.service.GuntaekStudentServiceImpl;
import com.mkfactory.toothless.donot.touch.dto.StudentInfoDto;
@Controller
@RequestMapping("/tl_c/guntaek/student/*")

public class GuntaekStudentController {
	@Autowired
	private GuntaekStudentServiceImpl guntaekStudentService;
	// 이력서 포워딩
	@RequestMapping("ajdksRegisterSelfIntroduction")
	public String ajdksRegisterSelfIntroduction(HttpSession session,
			Model model, AjdksSelfIntroductionDto ajdksSelfIntroductionDto){
	
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 되어있는 학생 Dto
		int introductionCount = guntaekStudentService.countSelfIntroduction(loginUser.getStudent_pk());
		// 현재 로그인 한 학생의 이력서 개수 가져오기
		
		// 로그인한 학생키로 SelfIntroductiondto 가져오긴
		guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk());
		
		// 이력서 불러오기 사용되는 쿼리 스트링 이용하여 얻어오는 DTO
		AjdksSelfIntroductionDto studentIntroductionDto = guntaekStudentService.getselfIntroductionDto(ajdksSelfIntroductionDto.getStudent_pk());
	
		List<AjdksSelfIntroductionDto> ajdksSelfIntroductionDtoList = guntaekStudentService.getSelfIntroductionDtoList();

		model.addAttribute("ajdksSelfIntroductionDtoList",ajdksSelfIntroductionDtoList);
	
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
		
		return "redirect:./ajdksRegisterCertification";
	}
	
	
	
	// 자격증 추가 프로세스
	@RequestMapping("ajdksRegisterCertificationProcess")
	public String ajdksRegisterCertification(AjdksCertificationDto certificationDto, MultipartFile imageLink
			,HttpSession session) {
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");

		certificationDto.setStudent_pk(loginUser.getStudent_pk());
		// 자격증 Dto에 로그인 한 학생 pk 저장
		//System.out.println(loginUser.getStudent_pk());
		
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
			//System.out.println(originalMainFileName);
			// 파일 명 저장
			//파일명 충돌 회피 - 랜덤, 시간 조합
			String uuid = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			String fileName = uuid + "_" + currentTime;
			//System.out.println(fileName);
			// 랜덤숫자 + "_" + 최근시간
			// 확장자 추출
			// 맨 뒤에서부터 .을 기준으로 자른다.
			String ext = originalMainFileName.substring(originalMainFileName.lastIndexOf("."));
			fileName += ext;
			//System.out.println(ext);
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

		return "redirect:./ajdksRegisterCertification";
	}
	
	// 자격증 추가하는 페이지 포워딩
	@RequestMapping("ajdksRegisterCertification")
	public String ajdksRegisterCertification(HttpSession session,
			Model model, AjdksSelfIntroductionDto ajdksSelfIntroductionDto){
	
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 현재 로그인 되어있는 학생 Dto
		int introductionCount = guntaekStudentService.countSelfIntroduction(loginUser.getStudent_pk());
		// 현재 로그인 한 학생의 이력서 개수 가져오기
		
		// 로그인한 학생키로 SelfIntroductiondto 가져오긴
		guntaekStudentService.getselfIntroductionDto(loginUser.getStudent_pk());
		
		// 이력서 불러오기 사용되는 쿼리 스트링 이용하여 얻어오는 DTO
		AjdksSelfIntroductionDto studentIntroductionDto = guntaekStudentService.getselfIntroductionDto(ajdksSelfIntroductionDto.getStudent_pk());
	
		List<AjdksSelfIntroductionDto> ajdksSelfIntroductionDtoList = guntaekStudentService.getSelfIntroductionDtoList();

		model.addAttribute("ajdksSelfIntroductionDtoList",ajdksSelfIntroductionDtoList);
	
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
		
		Map<String,Object> Student = new HashMap<String,Object>(); 
		
		StudentInfoDto loginUser = (StudentInfoDto) session.getAttribute("sessionStudentInfo");
		// 로그인한 유저를 얻어온다.
		
		int student_pk = loginUser.getStudent_pk();
		//로그인 유저 키

		String departmentName = guntaekStudentService.getDepartmentName(loginUser.getDepartment_pk());
		// 부서이름 부서키를 통해서 가져오기
		
		int semester = guntaekStudentService.getStudentSemester(student_pk);
		
		// 학생 Dto를 가져온다 (로그인한 키를 통하여)
		String proffessorName = guntaekStudentService.getProfessorName(loginUser.getProfessor_pk());
		
		
		// 특정 학생의 자격증 Dto List 를 가져온다. 이거 Map에 넣어줄겅미
		List<AjdksCertificationDto> CertificationDtoList = guntaekStudentService.getCertificationByStudentPk(student_pk);
		
		
		Student.put("studentDto", loginUser);
		Student.put("departmentName", departmentName);
		Student.put("proffessorName", proffessorName);
		Student.put("semester", semester);
		Student.put("certificationDtoList", CertificationDtoList);
		
		// 특정 학생의 자격증 Dto 리스트가 필요하다. map이랑 list 엮으면 될거같다.
		
		model.addAttribute("Student",Student);
		return "tl_c/guntaek/student/ajdksResumeInquiry";
	
	}

}

	
	
	
	
	

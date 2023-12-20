<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>

<style>
	.shadow {   /* 그림자 효과 */
      box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
    }
    
     .text-over-cut {
        display: block;
        max-width: 500px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
   }

</style>

<script>

	// 바로가기 밑에 숫자 가져오기
	function getAllCount() {
	
		fetch("./getAllOpenLectureInfoList")
		.then(response => response.json())
		.then(response => {

			// 교육과정 리스트
			const lectureCategoryList = response.data.lectureCategoryList;
			document.querySelector("#cntlecture").innerText = lectureCategoryList.length +"개";
			
			// 개설강의 리스트
			const allOpenLectureInfoList = response.data.allOpenLectureInfoList;
			document.querySelector("#cntOpenLec").innerText = allOpenLectureInfoList.length +"개";
			
			// 강사 전체 리스트
			const allTeacherList = response.data.allTeacherList;
			document.querySelector("#cntTeacher").innerText = allTeacherList.length +"명";
			
			// 학생 전체 리스트
			const allStudentInfoList = response.data.allStudentInfoList;
			document.querySelector("#cntStudent").innerText = allStudentInfoList.length +"명";
			
		});
	}
	
	// 페이지의 DOM이 로드되면 실행될 함수 등록!! 
	//	--> 함수가 실행이 안되면 값을 못 가져오는거...
	window.addEventListener("DOMContentLoaded", () => {
		getAllCount();
	});

</script>


</head>
<body>

<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>
	

	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col" style="background-color: #F5F6F6">
			<div class="row justify-content-center mt-5">
				<div class="col-6">
					<div class="row">
						<!-- 마이페이지 -->
						<div class="col shadow bg-white text-center">
							<div class="row border-bottom py-2" style="background-color: #E5EFF6">
								<div class="col">
									<span class="fs-5 fw-bold" style="color:#0061AA">이민지</span>님 환영합니다.
								</div>
							</div>
							<div class="row border-bottom text-secondary py-2" style="background-color: #E5EFF6">
								<div class="col">
									비밀번호 변경 | 인증서 등록
								</div>
							</div>
							<div class="row border-bottom py-2">
								<div class="col">
									<div class="row">
									 	<div class="col">
									 		<i class="bi bi-envelope-at fs-2 fw-light"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">웹메일</div>
									</div>
									<div class="row">
									 	<div class="col fw-bold" style="color:#0061AA">13</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
									 	<div class="col">
									 		<i class="bi bi-envelope-paper fs-2 fw-light"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">쪽지</div>
									</div>
									<div class="row">
									 	<div class="col fw-bold" style="color:#0061AA">25</div>
									</div>
								</div>
								<div class="col">
									<div class="row">
									 	<div class="col">
									 		<i class="bi bi-clipboard2-check fs-2 fw-light"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">업무게시판</div>
									</div>
									<div class="row">
									 	<div class="col fw-bold" style="color:#0061AA">4</div>
									</div>
								</div>
							</div>
							<div class="row pt-2 text-start">
								<div class="col-4">
									<i class="bi bi-dot"></i> 시간
								</div>
								<div class="col">
									시간가져오기
								</div>
							</div>
							<div class="row py-2 text-start">
								<div class="col-4">
									<i class="bi bi-dot"></i> 접속 IP
								</div>
								<div class="col">
									211.244.434.12
								</div>
							</div>
							<div class="row py-4 text-start justify-content-center">
								<div class="col-4 d-grid">
									<button type="button" class="btn rounded-0 text-white" style="background-color: #007AC3; font-size: 0.8em;">마이페이지</button>
								</div>
								<div class="col-4 d-grid">
									<button type="button" class="btn rounded-0 btn-outline-secondary" style="font-size: 0.8em;">로그아웃</button>
								</div>
							</div>
						</div>
						
						<!-- 수강신청 일정 -->
						<div class="col shadow bg-white ms-3">
							<div class="row border-bottom p-2">
								<div class="col fw-bold fs-5">
									수강신청 일정
								</div>
							</div>
							<div class="row p-2 mb-3 text-center">
								<div class="col-1 fs-5">
									<i class="bi bi-chevron-left"></i>
								</div>
								<div class="col fs-5 fw-bold">
									2023.12
								</div>
								<div class="col-1 fs-5 me-2">
									<i class="bi bi-chevron-right"></i>
								</div>
							</div>	
							<!-- 반복문 돌곳 -->
							<div class="row py-2 mx-2 text-start border-bottom mb-2">
								<div class="col">
									<div class="row text-start">
										<div class="col-1">
											<i class="bi bi-dot fw-bold"></i>
										</div>
										<div class="col" style="color: #007AC3">
											12.08 ~ 12.15
										</div>
									</div>
									<div class="row text-start mb-1">
										<div class="col-1">
										</div>
										<div class="col">
											어떠한 수업명
										</div>
									</div>
								</div>
							</div>
							<div class="row py-2 mx-2 text-start border-bottom mb-2">
								<div class="col">
									<div class="row text-start">
										<div class="col-1">
											<i class="bi bi-dot fw-bold"></i>
										</div>
										<div class="col" style="color: #007AC3">
											12.08 ~ 12.15
										</div>
									</div>
									<div class="row text-start mb-1">
										<div class="col-1">
										</div>
										<div class="col">
											어떠한 수업명
										</div>
									</div>
								</div>
							</div>
							<div class="row py-2 mx-2 text-start border-bottom mb-2">
								<div class="col">
									<div class="row text-start">
										<div class="col-1">
											<i class="bi bi-dot fw-bold"></i>
										</div>
										<div class="col" style="color: #007AC3">
											12.08 ~ 12.15
										</div>
									</div>
									<div class="row text-start mb-1">
										<div class="col-1">
										</div>
										<div class="col">
											어떠한 수업명
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 바로가기 -->
				<div class="col-5 shadow bg-white mx-3">
					<div class="row p-2">
						<div class="col fw-bold fs-5">
							바로가기
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row mx-3 pt-3 pb-2" style="background-color: #F5F6F6;">
								<div class="col text-center" onclick="location.href='./manageLecturePage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-book"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">교육과정 목록</div>
									</div>
									<div class="row">
									 	<div id="cntlecture" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
								<div class="col text-center" onclick="location.href='./manageOpenLecturePage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-journals"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">강의 목록</div>
									</div>
									<div class="row">
									 	<div id="cntOpenLec" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
							</div>
							<div class="row mx-3 pb-3 pt-2" style="background-color: #F5F6F6;">
								<div class="col text-center" onclick="location.href='./manageTeacherPage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-person-vcard"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">강사 목록</div>
									</div>
									<div class="row">
									 	<div id="cntTeacher" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
								<div class="col text-center" onclick="location.href='./manageStudentPage2'" style="cursor: pointer;">
									<div class="row">
									 	<div class="col">
									 		<i class="fs-1 bi bi-person"></i>
									 	</div>
									</div>
									<div class="row">
									 	<div class="col">학생 목록</div>
									</div>
									<div class="row">
									 	<div id="cntStudent" class="col fw-bold fs-5" style="color:#007AC3">13</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
			
			<!-- 하단 row -->
			<div class="row justify-content-center mt-4">
				
				<!-- 수강신청 일정 -->
				<div class="col-6 shadow bg-white">
					<div class="row text-center mb-3">
						<div class="col fw-bold py-2" style="border-top: 3px solid #007AC3; font-size: 1.1em;">
							공지사항
						</div>
						<div class="col fw-bold py-2" style="background-color: #F5F6F6; font-size: 1.1em;">
							서식자료실
						</div>
						<div class="col-7 py-2" style="background-color: #F5F6F6;"></div>
					</div>
					
					<div class="row">
						<div class="col">
							<!-- 반복문 돌곳 -->
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[알림]</span>
									 MK대학교 전임교원 교수단체 'MK대 교수그룹' 출범
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.12.05
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[노조소식]</span>
									 2023년도 한국 사립대학 교수노동조합 MK대 지회 정기총회 개최
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.12.01
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[공고]</span>
									2024년 2월말 퇴직교원 정부포상 공개검증
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.24
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[모집]</span>
									2023년 장애청소년 나들이 자원봉사자 모집 안내
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.15
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[공고]</span>
									2023 중앙도서관 온라인 전자정보 박람회 개최
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.12
								</div>
							</div>
							<div class="row py-2">
								<div class="col-1 text-end">
									<i class="bi bi-dot fw-bold"></i>
								</div>
								<div class="col text-start ps-0 text-over-cut">
									<span style="color: #007AC3">[공고]</span>
									2023학년도 신규직원 채용 최종 결과 발표
								</div>
								<div class="col-3 text-center" style="font-size: 0.9em; color: #ADB5BD;">
									23.11.08
								</div>
							</div>
						</div>
					</div>
					
				</div>
				
				<!-- 바로가기 -->
				<div class="col-5 shadow bg-white mx-3">
					<div class="row p-2">
						<div class="col fw-bold fs-5">
							업무알림
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="row text-center py-2 border-top border-bottom">
								<div class="col-3">
									업무
								</div>
								<div class="col">
									내용
								</div>
								<div class="col-2">
									건수
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									교육과정
								</div>
								<div class="col text-start text-over-cut">
									교육과정 '인공지능' 추가 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									강의
								</div>
								<div class="col text-start text-over-cut">
									'Spring 프레임워크 과정' 추가 개설 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									개선요청
								</div>
								<div class="col text-start text-over-cut">
									'C++언어' 평가 점수 관련 문의사항 있습니다.
								</div>
								<div class="col-2">
									2
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									강의
								</div>
								<div class="col text-start text-over-cut">
									'자바(JAVA) 입문 과정' 수강 인원 추가 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
							<div class="row text-center py-2">
								<div class="col-3" style="color: #007AC3">
									강사
								</div>
								<div class="col text-start text-over-cut">
									교육과정 'JAVA' 강사 추가 모집 부탁드립니다.
								</div>
								<div class="col-2">
									1
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
	<jsp:include page="../commons/staff/footer.jsp"></jsp:include>
</div>


 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>
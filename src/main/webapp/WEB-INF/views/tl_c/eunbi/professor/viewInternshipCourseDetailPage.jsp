<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR PROFESSOR </title>
<style>
	/*교수좌측메뉴바설정*/
	.professorleftmenubar input {
	    display: none;
	}
	
	.professorleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.professorleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.professorleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.professorleftmenubar input + label + .content {
	    display: none;
	}
	
	.professorleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

	<div class="row">
		<div class="col">
			<jsp:include page="../../common/ajdksHighestMenubarForProfessor.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
	
		<!-- 좌측메뉴바 -->
		<jsp:include page="../../common/ajdksSideMenubarForProfessor.jsp"></jsp:include>
		
		<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
		<div class="col">
			<div class="row">
				<div class="col mx-5">
				
					<!-- 본문작성공간 -->
					<div class="row mt-5">
						<div class="col fw-semibold" style="font-size:1.3em">
							<span class="text-secondary fs-3">&gt;</span>
							현장실습 진행 관리
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col">
							<div class="row">
								<div class="col fw-semibold" style="font-size:1.1em">
									현장실습과정 상세정보
								</div>
							</div>
							<div class="row mt-2">
								<div class="col border border-secondary border-start-0 border-end-0" style="font-size:0.95em">
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											현장실습명
										</div>
										<div class="col border-start ps-4 fw-semibold">
											${internshipCourseDetail.internshipCourseDto.course_title}
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											산업체명
										</div>
										<div class="col border-start ps-4 border-end">
											${internshipCourseDetail.companyInfoDto.company_name}
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											실습인원
										</div>
										<div class="col border-start ps-4">
											${internshipCourseDetail.countStudentIntern} / ${internshipCourseDetail.internshipCourseDto.internship_total_member}
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											모집학과
										</div>
										<div class="col border-start ps-4 border-end">
											${internshipCourseDetail.departmentDto.name}
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											자격학기
										</div>
										<div class="col border-start ps-4">
											${internshipCourseDetail.internshipCourseDto.semester_qualification}학기 이상
										</div>
									</div>
									<div class="row border-bottom py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											모집기간
										</div>
										<div class="col border-start ps-4 border-end">
											<fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.applying_start_date}" pattern="yyyy.MM.dd"/>
											 - <fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.applying_end_date}" pattern="yyyy.MM.dd"/>
										</div>
										<div class="col-1 ms-3 me-3 text-center text-dark-emphasis fw-semibold">
											결과발표일
										</div>
										<div class="col border-start ps-4">
											<fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.announcement_date}" pattern="yyyy.MM.dd"/>
											학기 이상
										</div>
									</div>
									<div class="row py-2">
										<div class="col-1 mx-3 text-center text-dark-emphasis fw-semibold">
											실습기간
										</div>
										<div class="col border-start ps-4">
											<fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.internship_start_date}" pattern="yyyy.MM.dd"/>
											 - <fmt:formatDate value="${internshipCourseDetail.internshipCourseDto.internship_end_date}" pattern="yyyy.MM.dd"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col">
						<jsp:useBean id="now" class="java.util.Date"/>
						<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
						<c:choose>
							<c:when test="${internshipCourseDetail.internshipCourseDto.applying_start_date < now && internshipCourseDetail.internshipCourseDto.announcement_date > now}">
								<div class="row">
									<div class="col fw-semibold" style="font-size:1.1em">
										현장실습 신청 내역
									</div>
								</div>
								<div class="row mt-2" style="height:20em">
									<div class="col border-secondary border-top border-bottom overflow-y-scroll">
										<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
											<div class="col-1 border-end">
												학번
											</div>
											<div class="col-2 border-end">
												이름
											</div>
											<div class="col-2 border-end">
												학과
											</div>
											<div class="col-2 border-end">
												담당교수
											</div>
											<div class="col-1 border-end">
												수료학기
											</div>
											<div class="col-1 border-end">
												신청상태
											</div>
											<div class="col-2 border-end">
												학생정보
											</div>
											<div class="col-1">
												날짜
											</div>
										</div>
										<c:forEach items="${internshipCourseDetail.applyingStudentInfoList}" var="studentApplying">
										<div class="row text-center py-1 border-bottom" style="font-size:0.95em">
											<div class="col-1 align-self-center fw-semibold border-end">
												${studentApplying.studentInfoDto.student_pk}
											</div>
											<div class="col-2 align-self-center fw-semibold border-end">
												${studentApplying.studentInfoDto.name}
											</div>
											<div class="col-2 align-self-center border-end">
												${studentApplying.studentDepartment.name}
											</div>
											<div class="col-2 align-self-center border-end">
												${studentApplying.studentProfessorInfo.name}
											</div>
											<div class="col-1 align-self-center border-end">
												${studentApplying.countSemester}
											</div>
											<div class="col-1 align-self-center fw-semibold border-end">
												${studentApplying.studentApplyingDto.status}
											</div>
											<div class="col-2 align-self-center border-end d-grid px-4">
												<button class="btn btn-secondary btn-sm rounded-1">상세보기</button>
											</div>
											<div class="col-1 align-self-center">
												<fmt:formatDate value="${studentApplying.studentApplyingDto.created_at}" pattern="yyyy.MM.dd"/>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</c:when>
							
							<c:when test="${internshipCourseDetail.internshipCourseDto.announcement_date <= now && internshipCourseDetail.internshipCourseDto.internship_start_date > now}">
								<div class="row">
									<div class="col fw-semibold" style="font-size:1.1em">
										현장실습 신청 내역
									</div>
								</div>
								<div class="row mt-2" style="height:20em">
									<div class="col border-secondary border-top border-bottom overflow-y-scroll">
										<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
											<div class="col-1 border-end">
												학번
											</div>
											<div class="col-2 border-end">
												이름
											</div>
											<div class="col-2 border-end">
												학과
											</div>
											<div class="col-2 border-end">
												담당교수
											</div>
											<div class="col-1 border-end">
												수료학기
											</div>
											<div class="col-1 border-end">
												신청상태
											</div>
											<div class="col-2 border-end">
												학생정보
											</div>
											<div class="col-1">
												날짜
											</div>
										</div>
										<c:forEach items="${internshipCourseDetail.applyingStudentInfoList}" var="studentApplying">
										<c:choose>
											<c:when test="${studentApplying.studentApplyingDto.status eq '합격' || studentApplying.studentApplyingDto.status eq '불합격'}">
												<div class="row text-center py-1 border-bottom" style="font-size:0.95em">
													<div class="col-1 align-self-center fw-semibold border-end">
														${studentApplying.studentInfoDto.student_pk}
													</div>
													<div class="col-2 align-self-center fw-semibold border-end">
														${studentApplying.studentInfoDto.name}
													</div>
													<div class="col-2 align-self-center border-end">
														${studentApplying.studentDepartment.name}
													</div>
													<div class="col-2 align-self-center border-end">
														${studentApplying.studentProfessorInfo.name}
													</div>
													<div class="col-1 align-self-center border-end">
														${studentApplying.countSemester}
													</div>
													<c:choose>
														<c:when test="${studentApplying.studentApplyingDto.status eq '합격'}">
															<div class="col-1 align-self-center fw-semibold border-end">
																${studentApplying.studentApplyingDto.status}
															</div>
														</c:when>
														<c:when test="${studentApplying.studentApplyingDto.status eq '불합격'}">
															<div class="col-1 align-self-center text-secondary fw-semibold border-end">
																${studentApplying.studentApplyingDto.status}
															</div>
														</c:when>
													</c:choose>
													<div class="col-2 align-self-center border-end d-grid px-4">
														<button class="btn btn-secondary btn-sm rounded-1">상세보기</button>
													</div>
													<div class="col-1 align-self-center">
														<fmt:formatDate value="${studentApplying.studentApplyingDto.created_at}" pattern="yyyy.MM.dd"/>
													</div>
												</div>
											</c:when>
										</c:choose>
										</c:forEach>
									</div>
								</div>
								</div>
							</c:when>
							
							<c:when test="${internshipCourseDetail.internshipCourseDto.internship_start_date < now && internshipCourseDetail.internshipCourseDto.internship_end_date > now}">
								<div class="row">
									<div class="col fw-semibold" style="font-size:1.1em">
										실습생 내역
									</div>
								</div>
								<div class="row mt-2" style="height:20em">
									<div class="col border-secondary border-top border-bottom overflow-y-scroll">
										<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
											<div class="col-1 border-end">
												학번
											</div>
											<div class="col-2 border-end">
												이름
											</div>
											<div class="col-2 border-end">
												학과
											</div>
											<div class="col-2 border-end">
												담당교수
											</div>
											<div class="col-1 border-end">
												학생정보
											</div>
											<div class="col-2 border-end">
												출결
											</div>
											<div class="col-2">
												업무일지
											</div>
										</div>
										<c:forEach items="${internshipCourseDetail.studentInternList}" var="studentIntern">
										<div class="row text-center py-1 border-bottom" style="font-size:0.95em">
											<div class="col-1 align-self-center fw-semibold border-end">
												${studentIntern.studentInfoDto.student_pk}
											</div>
											<div class="col-2 align-self-center fw-semibold border-end">
												${studentIntern.studentInfoDto.name}
											</div>
											<div class="col-2 align-self-center border-end">
												${studentIntern.studentDepartment.name}
											</div>
											<div class="col-2 align-self-center border-end">
												${studentIntern.studentProfessorInfo.name}
											</div>
											<div class="col-1 align-self-center border-end d-grid px-3">
												<button class="btn btn-outline-secondary btn-sm rounded-1">상세보기</button>
											</div>
											<div class="col-2 align-self-center border-end" style="font-size:0.9em">
												출근 ${studentIntern.countAttendance}&nbsp;
												지각 ${studentIntern.countLate}&nbsp;
												조퇴 ${studentIntern.countEarlyleave}&nbsp;
												결근 ${studentIntern.countAbsent}
											</div>
											<div class="col-2 align-self-center d-grid px-4">
												<button class="btn btn-secondary btn-sm rounded-1">업무일지확인</button>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</c:when>
							
							<c:when test="${internshipCourseDetail.internshipCourseDto.internship_end_date < now}">
								<div class="row">
									<div class="col fw-semibold" style="font-size:1.1em">
										실습생 내역
									</div>
								</div>
								<div class="row mt-2" style="height:20em">
									<div class="col border-secondary border-top border-bottom overflow-y-scroll">
										<div class="row text-center bg-body-secondary border-bottom border-secondary py-1 fw-semibold">
											<div class="col-1 border-end">
												학번
											</div>
											<div class="col-2 border-end">
												이름
											</div>
											<div class="col-1 border-end">
												학과
											</div>
											<div class="col-1 border-end">
												담당교수
											</div>
											<div class="col-1 border-end">
												학생정보
											</div>
											<div class="col-2 border-end">
												출결
											</div>
											<div class="col-2">
												업무일지
											</div>
											<div class="col-2">
												성적산출
											</div>
										</div>
										<c:forEach items="${internshipCourseDetail.studentInternList}" var="studentIntern">
										<div class="row text-center py-1 border-bottom" style="font-size:0.95em">
											<div class="col-1 align-self-center fw-semibold border-end">
												${studentIntern.studentInfoDto.student_pk}
											</div>
											<div class="col-2 align-self-center fw-semibold border-end">
												${studentIntern.studentInfoDto.name}
											</div>
											<div class="col-1 align-self-center border-end">
												${studentIntern.studentDepartment.name}
											</div>
											<div class="col-1 align-self-center border-end">
												${studentIntern.studentProfessorInfo.name}
											</div>
											<div class="col-1 align-self-center border-end d-grid px-3">
												<button class="btn btn-outline-secondary btn-sm rounded-1">상세보기</button>
											</div>
											<div class="col-2 align-self-center border-end" style="font-size:0.9em">
												출근 ${studentIntern.countAttendance}&nbsp;
												지각 ${studentIntern.countLate}&nbsp;
												조퇴 ${studentIntern.countEarlyleave}&nbsp;
												결근 ${studentIntern.countAbsent}
											</div>
											<div class="col-2 align-self-center d-grid px-4 border-end">
												<button class="btn btn-outline-secondary btn-sm rounded-1">업무일지확인</button>
											</div>
											<div class="col-2 align-self-center d-grid px-4">
												<c:choose>
													<c:when test="${studentIntern.didEvaluateIntern == 0}">
														<button class="btn btn-secondary btn-sm rounded-1" data-bs-toggle="modal" data-bs-target="#insertProfessorEvaluation">성적 입력하기</button>
														
														<div class="modal fade" id="insertProfessorEvaluation" tabindex="-1" aria-labelledby="#insertProfessorEvaluation" aria-hidden="true">
															<div class="modal-dialog">
																<div class="modal-content rounded-0 px-3">
																	<div class="modal-header border-dark pt-4 pb-2">
																		<span class="modal-title fw-semibold fs-5" id="insertProfessorEvaluation">학생 평가 입력</span>
																		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body text-start">
																		<div class="row">
																			<div class="col">
																				<div class="row">
																					<div class="col fw-semibold" style="font-size:1.05em">
																						성실성
																					</div>
																				</div>
																				<div class="row mt-2">
																					<div class="col" style="font-size:0.9em">
																						 <input class="form-check-input" type="radio" name="diligence_score" value="5"> 매우 높음
																						 <input class="form-check-input ms-3" type="radio" name="diligence_score" value="4"> 높음
																						 <input class="form-check-input ms-3" type="radio" name="diligence_score" value="3"> 중간
																						 <input class="form-check-input ms-3" type="radio" name="diligence_score" value="2"> 낮음
																						 <input class="form-check-input ms-3" type="radio" name="diligence_score" value="1"> 매우 낮음
																					</div>
																				</div>
																				<div class="row">
																					<div class="col fw-semibold" style="font-size:1.05em">
																						책임감
																					</div>
																				</div>
																				<div class="row mt-2">
																					<div class="col" style="font-size:0.9em">
																						 <input class="form-check-input" type="radio" name="responsibility_score" value="5"> 매우 높음
																						 <input class="form-check-input ms-3" type="radio" name="responsibility_score" value="4"> 높음
																						 <input class="form-check-input ms-3" type="radio" name="responsibility_score" value="3"> 중간
																						 <input class="form-check-input ms-3" type="radio" name="responsibility_score" value="2"> 낮음
																						 <input class="form-check-input ms-3" type="radio" name="responsibility_score" value="1"> 매우 낮음
																					</div>
																				</div>
																				<div class="row">
																					<div class="col fw-semibold" style="font-size:1.05em">
																						협조성
																					</div>
																				</div>
																				<div class="row mt-2">
																					<div class="col" style="font-size:0.9em">
																						 <input class="form-check-input" type="radio" name="coorporation_score" value="5"> 매우 높음
																						 <input class="form-check-input ms-3" type="radio" name="coorporation_score" value="4"> 높음
																						 <input class="form-check-input ms-3" type="radio" name="coorporation_score" value="3"> 중간
																						 <input class="form-check-input ms-3" type="radio" name="coorporation_score" value="2"> 낮음
																						 <input class="form-check-input ms-3" type="radio" name="coorporation_score" value="1"> 매우 낮음
																					</div>
																				</div>
																			</div>
																		</div>
																		
																	</div>
																	<div class="modal-footer border-top-0">
																		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">평가 입력</button>
																	</div>
																</div>
															</div>
														</div>
													</c:when>
													<c:when test="${studentIntern.didEvaluateIntern > 0}">
														<span class="fw-semibold text-secondary">성적 입력완료</span>
													</c:when>
												</c:choose>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</c:when>					
						</c:choose>	
						</div>
					</div>
					
					
					
					
				</div>
			</div>
		</div>
		

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
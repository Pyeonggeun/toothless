<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					
					<div class="row mt-5">
						<div class="col fw-semibold" style="font-size:1.3em">
							<span class="text-secondary fs-3">&gt;</span>
							담당 학과생 조회
						</div>
					</div>
					
					<div class="row mt-3">
						<div class="col">
							<div class="row">
								<div class="col bg-body-secondary border border-secondary border-start-0 border-end-0 border-1 mx-2 px-3 py-4">
									<div class="row">
										<div class="col-3">
											<select class="form-select rounded-1" aria-label="selectSemester">
												<option selected>입학년도</option>
												<c:forEach items="${studentSearchFilters.selectSemester}" var="semester">
													<option>${semester.semester_year}년 ${semester.semester}학기</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-3 mx-5">
											<select class="form-select rounded-1" aria-label="selectDepartment">
												<option selected>학과</option>
												<c:forEach items="${studentSearchFilters.selectDepartment}" var="department">
													<option>${department.name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-3">
											<select class="form-select rounded-1" aria-label="selectStatus">
												<option selected>현장실습 진행상태</option>
													<option value="신청완료">신청완료</option>
													<option value="합격">합격</option>
													<option value="불합격">불합격</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col px-2">
									<table class="table table-bordered text-center align-middle">
										<thead class="table-light">
											<tr>
												<th scope="col">학번</th>
												<th scope="col">이름</th>
												<th scope="col">학과</th>
												<th scope="col">성별</th>
												<th scope="col">연락처</th>
												<th scope="col">입학년도</th>
												<th scope="col">현장실습 신청/진행 상태</th>
												<th scope="col">상세</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${studentsInfo}" var="studentInfo">
											<tr>
												<th scope="row">${studentInfo.studenInfoDto.student_pk}</th>
												<td>${studentInfo.studenInfoDto.name}</td>
												<td>${studentInfo.departmentDto.name}</td>
												<td>
													<c:choose>
														<c:when test="${studentInfo.studenInfoDto.gender eq 'M'}">
															남성
														</c:when>
														<c:when test="${studentInfo.studenInfoDto.gender eq 'F'}">
															여성
														</c:when>
													</c:choose>
												</td>
												<td>${studentInfo.studenInfoDto.phone}</td>
												<td>
													<fmt:formatDate value="${studentInfo.studenInfoDto.entered_at}" pattern="yyyy.MM"/>
												</td>
												<td>
													<c:choose>
														<c:when test="${studentInfo.studentApplyingPk == 0}">
															없음
														</c:when>
														<c:when test="${studentInfo.studentApplyingPk != 0}">
															${studentInfo.latestStudentApplyingDto.status}
														</c:when>
													</c:choose>
												</td>
												<td>
													<c:choose>
														<c:when test="${studentInfo.studentApplyingPk == 0}">
															-
														</c:when>
														<c:when test="${studentInfo.studentApplyingPk != 0}">
															<button type="button" class="btn btn-secondary rounded-1" style="font-size:0.8em">상세보기</button>
														</c:when>
													</c:choose>
												</td>
											</tr>
											</c:forEach>
										</tbody>
										</table>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
			
		</div>
	
		
	</div>


</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
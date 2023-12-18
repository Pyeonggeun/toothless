<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<title>ResumeManagementPage</title>
</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col-1">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
				<div class="row">
					<div class="col fs-5 fw-bold mt-5">이력서 목록</div>
				</div>
				
				<div class="row border-bottom border-dark"></div>
				<div class="row border border-top">
					<div class="col p-3 ms-2">
						<div class="row border-bottom border-gray">
							<div class="col fs-3">메인 이력서</div>
						</div>
						<div class="row border-bottom border-gray">
							<div class="col-6 fs-5">제목</div>
							<div class="col fs-5 text-center">작성일</div>
							<div class="col fs-5 text-center">공개 선택</div>
							<div class="col fs-5 text-center">공개 여부</div>
							<div class="col fs-5 text-center">이력서 삭제</div>
						</div>
						<div class="row mt-1">
							
							<div class="col-6 fs-6 fw-bold">
								<a href="./resumeDetailPage?resume_pk=${resumeDto.resume_pk }"style="text-decoration: none;">${resumeDto.resume_title }</a>
							</div>
							<div class="col text-center">
								<fmt:formatDate value="${resumeDto.created_at}" pattern="yyyy-MM-dd"/>
							</div>
							<div class="col text-center">
								<c:choose>
									<c:when test="${resumeDto.is_public==null }">
									
									</c:when>
									<c:when test="${resumeDto.is_public=='N'}">
										<form action="./changeResumeStatus" method="post">
											<input type="hidden" name="resume_pk" value="${resumeDto.resume_pk }">
											<input type="hidden" name="is_public" value="${resumeDto.is_public }">
											
											<button type="submit" class="btn btn-primary">공개하기</button>
										</form>
									</c:when>
									<c:otherwise>
										<form action="./changeResumeStatus" method="post" >
											<input type="hidden" name="resume_pk" value="${resumeDto.resume_pk }">
											<input type="hidden" name="is_public" value="${resumeDto.is_public }">
											
										<button type="submit" class="btn btn-danger">비공개하기</button>
										</form>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col text-center">
								<c:choose>
									<c:when test="${resumeDto.is_public==null }">
									</c:when>
									<c:when test="${resumeDto.is_public=='N' }">
										<button type="button" class="btn btn-danger" disabled>비공개중</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-primary" disabled>공개중</button>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col text-center">
								
								<c:choose>
									<c:when test="${resumeDto.resume_pk.equals(0) || resumeDto==null}">
									</c:when>
									<c:otherwise>
										<form action="./resumeDeleteProcess">
											<input type="hidden" name="resume_pk" value="${resumeDto.resume_pk }">
											<button type="submit" class="btn btn-danger">삭제</button>			
										</form>
									</c:otherwise>
								</c:choose>
								
							</div>	
						</div>	
					</div>
				</div>
				
				
				<div class="row border border-top mt-2">
					<div class="col p-3 ms-2">
						<div class="row border-bottom border-gray">
							<div class="col fs-3">이력서</div>
						</div>
						<div class="row border-bottom border-gray">
							<div class="col-7 fs-5">제목</div>
							<div class="col fs-5 text-center">작성일</div>
							<div class="col-2 fs-5 text-center">메인이력서로 변경</div>
							<div class="col fs-5 text-center">이력서 삭제</div>
						</div>
						
						<div class="row mt-1">
							<div id="resumeListBox" class="col">
								<%-- 이력서 목록 출력될 위치 --%>
								<c:forEach items="${resumeList }" var="list">
									<form action="changeMainResumeProcess" method="post">
									<input type="hidden" name="resume_pk" value="${list.resume_pk }">
									<input type="hidden" name="main_resume" value="${list.main_resume }">
									<input type="hidden" name="student_pk" value="${sessionStudentInfo.student_pk }">
										<div class="row mt-2">
											<div class="col-7">
												<a class="navbar-brand" href="./resumeDetailPage?resume_pk=${list.resume_pk }">${list.resume_title }</a>
											</div>
											<div class="col text-center">
												<fmt:formatDate value="${list.created_at}" pattern="yyyy-MM-dd"/>
											</div>
											<div class="col-2 text-center">
												<button type="submit" class="btn btn-primary">선택</button>
											</div>
											<div class="col text-center">
												<a class="btn btn-danger" href="./resumeDeleteProcess?resume_pk=${list.resume_pk }" role="button">삭제</a>
											</div>
										</div>
									</form>
								</c:forEach>
							</div>						
						</div>
						
					</div>	
				</div>
				
				<div class="row mt-2">
					<div class="col-9"></div>
					<div class="col">
						<form action="../common/studentMyPage" method="post">
							<input type="hidden" name="student_pk" value="${sessionStudentInfo.student_pk }">
							<button type="submit" class="btn btn-secondary">돌아가기</button>
						</form>
					</div>
					<div class="col">
						<form action="./resumeRegistrationPage" method="post">
							<button type="submit" class="btn btn-primary">이력서 추가</button>
						</form>
					</div>
				</div>
				
				
			</div>
			
			<div class="col-2"></div>
		</div>
			
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>
	
	

	
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
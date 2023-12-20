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
<title>ResumeDtailView</title>
</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			
			<div class="col-2">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<div class="col">
				
				<div class="row">
					<div class="col fs-5 fw-bold mt-5">이력서 상세보기</div>
				</div>	
				<div class="row border-bottom border-dark"></div>
				<div class="row border border-top">
					<div class="col p-3 ms-2">
						<div class="row border-bottom border-gray">
							<div class="col fs-1">${resumeDto.resume_title }</div>
						</div>
						<div class="row ms-2 mt-1">
							
							<div class="col">이름 : ${sessionStudentInfo.name }</div>
							<div class="col">성별 : ${sessionStudentInfo.gender }</div>
							<div class="col">
								생일 : <fmt:formatDate value="${sessionStudentInfo.birth }" pattern="yyyy-MM-dd"/>
							</div>
							
							<div class="col-1"></div>
						</div>
						<div class="row ms-2 mt-2">
							<div class="col">핸드폰 번호 : ${sessionStudentInfo.phone }</div>
							<div class="col">이메일 주소 : ${sessionStudentInfo.email }</div>
							<div class="col"></div>
							<div class="col-1"></div>
						</div>
						<div class="row ms-2 mt-2 mb-2">
							<div class="col">주소 : ${sessionStudentInfo.address }</div>
							<div class="col-1"></div>
						</div>
					</div>
				</div>
				
				<div class="row mt-4 border border-top">
					<div class="col p-3 ms-2">
						<div class="row border-bottom border-gray">
							<div class="col fs-3">자소서</div>
							<div class="col-1"><a href="./resumeUpdatePage?resume_pk=${resumeDto.resume_pk }">수정</a></div>
						</div>
						<div class="row">
							<div class="col">${resumeDto.cover_letter }</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-4 border border-top">
					<div class="col p-3 ms-2">
						<div class="row border-bottom border-gray">
							<div class="col fs-3">경력</div>
							<div class="col-1"><a href="./careerDetailPage?resume_pk=${resumeDto.resume_pk }">수정</a></div>
						</div>
						<div class="row  border-bottom text-light" style="background-color: #133369">
							<div class="col fs-5">카테고리</div>
							<div class="col-10  border-start fs-5 text-center">내용</div>
						</div>
						<c:choose>
							<c:when test="${empty careerList }">
								<div class="row">
									<div class="col text-center fs-4">
										등록된 경력이 없습니다.
									</div>
								</div>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${careerList }" var="list">
								<div class="row">
									<div class="col">${list.careerName.career_category_name }</div>
									<div class="col-10 border-start">${list.careerDto.career_contents }</div>
								</div>
								</c:forEach>
							</c:otherwise>
							
						</c:choose>
						
						
					</div>
				</div>
				
				<div class="row mt-4 border border-top">
					<div class="col p-3 ms-2">
						<div class="row border-bottom border-gray">
							<div class="col fs-3">자격증</div>
							<div class="col-1"><a href="./licenseDetailPage?resume_pk=${resumeDto.resume_pk }">수정</a></div>
						</div>
						<div class="row  border-bottom text-light" style="background-color: #133369">
							<div class="col">자격증 명</div>
							<div class="col">취득 년도</div>
							<div class="col">취득 월</div>
							<div class="col">발급 기관</div>
						</div>
						
						<c:choose>
							<c:when test="${empty licenseList }">
								<div class="row">
									<div class="col text-center fs-4">
										등록된 자격증이 없습니다.
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${licenseList }" var="list">
									<div class="row">
										<div class="col">${list.lic_name }</div>
										<div class="col">${list.lic_gain_year } 년</div>
										<div class="col">${list.lic_gain_month }월</div>
										<div class="col">${list.lic_center }</div>
									</div>
								</c:forEach>
							</c:otherwise>
							
						</c:choose>
						

					</div>
				</div>
				
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-2">
						<form action="./resumeManagementPage" method="post">
							<input type="hidden" name="resume_pk" value="${resumeDto.student_pk }">
							<button type="submit" class="btn btn-secondary">돌아가기</button>
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
	<div class="row">
		<div class="col">
			<jsp:include page="../common/futter.jsp"></jsp:include>
		</div>
	</div>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
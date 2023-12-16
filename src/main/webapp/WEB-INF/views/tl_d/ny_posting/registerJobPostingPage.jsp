<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 왼쪽 여백--%>
			<div class="col-1"></div>
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-1 me-5">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 border-start"></div>
			<%-- 채용공고 등록 양식 --%>
			<div class="col">
				<form action="./registerJobPostingProcess" method="post" enctype="multipart/form-data">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">채용공고등록</div>
				</div>
				<!-- 공고 제목 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="posting_name" type="text" placeholder="공고제목">
					</div>
				</div>
				<!-- 사업자번호 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="business_number" type="text" placeholder="사업자번호 000-00-00000">
					</div>
				</div>
				<!-- 채용분야 -->
				<div class="row mt-3">
					<div class="col">
						<select class="form-select py-0 border-dark" name="job_field_category_pk">
							<option selected>채용분야</option>
						    <c:forEach items="${jobFieldCategory}" var="jobField">
						        <option value="${jobField.job_field_category_pk}">${jobField.job_field_category_name}</option>
						    </c:forEach>
						</select>
					</div>
					<div class="col-7"></div>
				</div>
				<!-- 구인직무 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="job_position" type="text" placeholder="구인직무">
					</div>
				</div>
				<!-- 메인이미지 -->
				<div class="row my-4">
					<div class="col">
						<input class="form-control border-dark" name="imageFile" type="file" accept="image/*">
					</div>
				</div>
				<!-- 채용내용 -->
				<div class="row mt-3">
					<div class="col fw-bold">
						채용내용
					</div>
				</div>
				<div class="row mt-2">
					<div class="col d-grid">
						<textarea class="form-control border-dark" name="posting_contents" rows="10"></textarea>						
					</div>
				</div>
				<!-- 우대사항 -->
				<div class="row mt-3">
					<div class="col fw-bold">
						우대사항
					</div>
				</div>
				<div class="row mt-2">
					<div class="col d-grid">
						<textarea class="form-control border-dark" name="preference" rows="10"></textarea>						
					</div>
				</div>
				<!-- 채용인원 -->
				<div class="row mt-3">
					<div class="col fw-bold">
						채용인원
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<div class="row">
							<div class="col-9 pe-0">
								<input class="form-control form-control-sm border-black" name="hire_number" type="text">
							</div>
							<div class="col pt-1">명</div>
						</div>
					</div>
					<div class="col-8"></div>
				</div>
				<!-- 채용마감일 -->
				<div class="row mt-3">
					<div class="col fw-bold">
						채용마감일
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="posting_deadline" type="date">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col"><a class="btn btn-secondary" href="./jobPostingListPage">목록으로</a></div>
					<div class="col-8"></div>
					<div class="col">
						<c:choose>
							<c:when test="${empty sessionStaffInfo}">
								<input class="btn btn-dark d-grid" type="submit" value="공고등록" disabled>
							</c:when>
							<c:otherwise>
								<input class="btn btn-dark d-grid" type="submit" value="공고등록">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col"></div>
				</div>
				</form>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col"></div>	
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
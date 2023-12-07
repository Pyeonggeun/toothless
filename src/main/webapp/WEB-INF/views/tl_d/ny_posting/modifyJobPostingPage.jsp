<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<form action="./modifyJobPostingProcess" method="post" enctype="multipart/form-data">
				<input name="job_posting_pk" type="hidden" value="${modifyJobPosting.jobPostingDto.job_posting_pk}">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">채용공고수정</div>
				</div>
				<!-- 공고 제목 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="posting_name" type="text" value="${modifyJobPosting.jobPostingDto.posting_name}">
					</div>
				</div>
				<!-- 채용분야 -->
				<div class="row mt-3">
					<div class="col">
						<select class="form-select py-0 border-dark" name="job_field_category_pk">
						    <c:forEach items="${jobFieldCategory}" var="jobField">
						        <option value="${jobField.job_field_category_pk}" ${jobField.job_field_category_pk eq modifyJobPosting.jobFieldCategoryDto.job_field_category_pk ? 'selected' : ''}>
						            ${jobField.job_field_category_name}
						        </option>
						    </c:forEach>
						</select>
					</div>
					<div class="col-9"></div>
				</div>
				<!-- 구인직무 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="job_position" type="text" value="${modifyJobPosting.jobPostingDto.job_position}">
					</div>
				</div>
				<!-- 메인이미지 -->
				<div class="row my-4">
					<div class="col">
						<input class="form-control border-dark" name="modifyimage" type="file" accept="image/*">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<img src="../../resources/img/employment/${modifyJobPosting.jobPostingDto.posting_mainimage}">
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
						<textarea class="form-control border-dark" name="posting_contents" rows="10">${modifyJobPosting.jobPostingDto.posting_contents}</textarea>						
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
						<textarea class="form-control border-dark" name="preference" rows="10">${modifyJobPosting.jobPostingDto.preference}</textarea>						
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
								<input class="form-control form-control-sm border-black" name="hire_number" type="text" value="${modifyJobPosting.jobPostingDto.hire_number}">
							</div>
							<div class="col pt-1">명</div>
						</div>
					</div>
					<div class="col-9"></div>
				</div>
				<!-- 채용 마감일 -->
				<div class="row mt-3">
					<div class="col">
						<span class="fw-bold">기존 채용마감일</span> &nbsp;&nbsp;<fmt:formatDate value="${modifyJobPosting.jobPostingDto.posting_deadline}" pattern="yyyy-MM-dd"/>
					</div>
				</div> 
				<!-- 채용마감일 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="posting_deadline" type="date" value="<fmt:formatDate value="${modifyJobPosting.jobPostingDto.posting_deadline}" pattern="yyyy-MM-dd"/>">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-9"></div>
					<div class="col ms-4 ps-3">
						<c:choose>
							<c:when test="${empty sessionStaffInfo}">
								<input class="btn btn-dark d-grid" type="submit" value="공고수정" disabled>
							</c:when>
							<c:otherwise>
								<input class="btn btn-dark d-grid" type="submit" value="공고수정">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<!-- 채용공고 리스트 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">채용공고리스트</div>
				</div>
				<div class="row mt-5 pb-3 border-bottom">
					<div class="col-9 pt-1">
						총 <span class="fw-bold">${postingCount}</span>건
					</div>
					<div class="col">
						<select class="form-select form-select-sm">
						    <option selected>정확도순</option>
						    <option value="1">등록일순</option>
						    <option value="2">마감임박순</option>
						    <!-- <option value="3"></option> -->
						</select>
					</div>
				</div>
				<c:forEach items="${jobPostingList}" var="jobPosting">
				<div class="row mt-3">
					<!-- 기업명 -->
					<div class="col-2 pe-0">
						${jobPosting.companyDto.com_name} &nbsp;<i class="text-danger bi bi-suit-heart"></i>
					</div>
					<!-- 공고제목 -->
					<div class="col-7 ps-0 pt-1">
						${jobPosting.jobPostingDto.posting_name}
					</div>
					<!-- 공고찜 -->
					<div class="col fs-5 text-warning">
						<i class="bi bi-star"></i>
					</div>
				</div>
				<div class="row mt-1 pb-3 border-bottom">
					<!-- 가족기업여부 -->
					<div class="col-2  ms-1">
						<c:if test="${jobPosting.companyDto.is_family_company ne null and jobPosting.companyDto.is_family_company eq 'Y'}">
							<h5><span class="badge text-bg-primary">Family</span></h5>
						</c:if>						
					</div>
					<!-- 분야/지역/기간 태그  -->
					<div class="col-7 ps-0">
						<span class="text-primary">#&nbsp;${jobPosting.jobFieldCategoryDto.job_field_category_name} #&nbsp;${jobPosting.companyDto.com_address}
						 #&nbsp;<fmt:formatDate value="${jobPosting.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
					</div>
					<div class="col">
						<button class="btn btn-outline-success">수정</button>
						<button class="btn btn-danger">삭제</button>
					</div>
				</div>
				</c:forEach>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
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
<title>postApplyListPage</title>
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
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">공고지원리스트</div>
				</div>
				<div class="row mt-5 pb-3 border-bottom">
					<div class="col-9 pt-1">
						총 <span class="fw-bold">${applyCount}</span>건
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
				<c:choose>
					<c:when test="${applyCount == 0}">
						
						<div class="row p-3">
							<div class="col text-center fw-bold fs-4">
								지원한 공고가 없습니다.	
							</div>
						</div>
						
						
					</c:when>
					
					<c:otherwise>
					
						<c:forEach items="${postAndCompanyList }" var="list">
						<div class="row my-3 border-bottom">
							<div class="col-2">
								<!-- 회사 이름 -->
								<div class="row">
									<div class="col ms-2">${list.companyDto.com_name }</div>
								</div>
								<!-- 가족기업여부 -->
								<div class="row mb-2">
									<div class="col ms-2">
										<c:if test="${list.companyDto.is_family_company ne null and list.companyDto.is_family_company eq 'Y'}">
											<span class="badge text-bg-info text-white">Family</span>
										</c:if>						
									</div>
								</div>
							</div>
							<div class="col-8">
								<!-- 공고 제목 -->
								<div class="row">
									<div class="col">
										<a class="navbar-brand" href="../ny_posting/jobPostingDetailForStudentPage?id=${list.postDto.job_posting_pk }">
										${list.postDto.posting_name }
										</a>
									</div>
								</div>
								<!-- #카테고리 #콘텐츠 #주소 지역 #마감일 -->
								<div class="row mb-3">
									<div class="col">
										<span class="text-secondary">#&nbsp;${list.jfcDto.job_field_category_name} #&nbsp;${list.postDto.job_position}
										#&nbsp;${list.companyDto.com_address} #&nbsp;<fmt:formatDate value="${list.postDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
									</div>
								</div>
							</div>
							<div class="col">
								<form action="./cancleApplyProcess" method="get">
									<input type="hidden" name="job_posting_pk" value="${list.postDto.job_posting_pk }">
									<button type="submit" class="btn btn-danger">지원 취소</button>
								</form>
							</div>
						</div>
					</c:forEach>
					
					
					</c:otherwise>
				</c:choose>
				
				
				


						


			</div>
			<%-- 내용 끝 --%>				
			<div class="col-3"></div>
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
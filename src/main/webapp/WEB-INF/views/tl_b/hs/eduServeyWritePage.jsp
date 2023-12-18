<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
	<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    	<title>만족도 작성</title>
    </head>
	<body>
	<div class="container-fluid">
		<jsp:include page="../hs/eduStudentTopBanner.jsp"></jsp:include>
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col"></div>
					<div class="col-8 text-start">
						<a class="btn btn-sm fw-bold" href="./eduMainPageForStudent"
						role="button" style="color: #4c4a4c;">메인페이지</a>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col-8"> <!--교육목록-->
				<div class="row">
					<div class="col">
					</div>
					<div class="col text-center fw-bold" style="font-size: 1.5em;">
						나의 교육 프로그램
					</div>
					<div class="col-4 text-end">
						<input name="name" type="text" style="height: 25px;">
						<i class="bi bi-search-heart"></i>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<div class="row fw-bold pb-1 border-bottom border-dark">
							<div class="col fw-bold" style="text-align: center;" >
								<span>프로그램명</span>
							</div>
							<div class="col-3 fw-bold" style="text-align: center;" >
								<span>신청기간</span>
							</div>
							<div class="col fw-bold" style="text-align: center;" >
								<span>교육일</span>
							</div>
							<div class="col-1 fw-bold" style="text-align: center;" >
								<span>교육정원</span>
							</div>
							<div class="col fw-bold" style="text-align: center;" >
								<span>신청일</span>
							</div>
							<div class="col fw-bold" style="text-align: center;" >
								<span>상태</span>
							</div>
						</div>
						<c:forEach items="${eduApplyList }" var="edu">
							<div class="row py-1 border-bottom">
								<div class="col align-self-center text-center">
									${edu.eduDto.name }
								</div>
								<div class="col-3 align-self-center text-center">
									<span><fmt:formatDate
									value="${edu.eduDto.apply_start_date}"
									pattern="yy년 MM월 dd일"/></span>
									~
									<span><fmt:formatDate
									value="${edu.eduDto.apply_end_date}"
									pattern="yy년 MM월 dd일"/></span>
								</div>
								<div class="col align-self-center text-center"> 
									<span><fmt:formatDate value="${edu.eduDto.edu_date}"
									pattern="yy년 MM월 dd일"/></span>
								</div>
								<div class="col-1 align-self-center text-center">
									<span>${edu.eduDto.capacity }</span>
								</div>
								<div class="col align-self-center text-center">
									<span><fmt:formatDate value="${edu.eduApplyDto.created_at}"
									pattern="yy년 MM월 dd일"/></span>
								</div>
								<!-- 여긴 상태-->
								
								<div class="col align-self-center text-center">
									<c:choose>

										<c:when test="${edu.eduApplyDto.status eq 'N'}">
											<div class="row">
												<div class="col d-grid pe-1">
													<a class="btn btn-sm fw-bold text-white" href=#
													role="button" style="background-color: #34A853;">신청완료</a>
												</div>
												<div class="col d-grid ps-0">
													<a class="btn btn-sm  fw-bold text-white" href="./updateStatusCProcessForStudent?edu_apply_pk=${edu.eduApplyDto.edu_apply_pk}"
													role="button" style="background-color: #EA4335;">신청취소</a>
												</div>
											</div>
										</c:when>

										<c:when test="${edu.eduApplyDto.status eq 'Y'}">
											<div class="row">
												<div class="col d-grid pe-1">
													<a class="d-grid btn btn-sm fw-bold text-white" href="./updateStatusNProcessForStudent?edu_apply_pk=${edu.eduApplyDto.edu_apply_pk}"
													role="button" style="background-color: #4285F4;">수료완료</a>
												</div>
												<div class="col d-grid ps-0">
													<a class="btn btn-sm  fw-bold text-white" href= #
													role="button" style="background-color: #FBBC05; font-size: 0.8em;">만족도작성</a>
												</div>
											</div>
										</c:when>
										
										<c:when test="${edu.eduApplyDto.status eq 'D'}">
											<div class="row">
												<div class="col d-grid pe-1">
													<a class="d-grid btn btn-sm fw-bold text-white" href=#
													role="button" style="background-color: #4285F4;">수료완료</a>
												</div>
												<div class="col d-grid ps-0">
													<a class="btn btn-sm  fw-bold" href= #
													role="button" style="background-color: #F3F3F3; font-size: 0.8em; color: #C4C3C4;">만족도작성</a>
												</div>
											</div>
										</c:when>

										<c:otherwise>
											<a class="d-grid btn btn-sm fw-bold" href=#
											role="button" style="background-color: #F3F3F3; color: #C4C3C4;">취소완료</a>
										</c:otherwise>

									</c:choose>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div> 
			<div class="col"></div>
		</div>
		<!-- 만족도 작성 -->
		<!-- <ul class="nav nav-underline">
			<li class="nav-item">
			  <a class="nav-link active" aria-current="page" href="#">Active</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" href="#">Link</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link" href="#">Link</a>
			</li>
			<li class="nav-item">
			  <a class="nav-link disabled" aria-disabled="true">Disabled</a>
			</li>
		  </ul> -->

		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-8">
				<div class="row">
					<div class="col">
						<div class="row  fw-bold pb-1 border-bottom border-dark">
							<div class="col" style="font-size: 1.3em;">
								만족도 작성
							</div>
						</div>
						<form action="./writeEduServeyProcess" method="get">
						<div class="row fw-bold">
							<div class="col-2">프로그램명</div>
							<div class="col-3">별점</div>
							<div class="col">평가내용</div>
						</div>
						<div class="row">
							<!-- 프로그램명 -->
							<div class="col-2 align-self-center">
									<c:set  var="pk" value="${edu_apply_pk }" ></c:set>
									<c:forEach items="${eduApplyList }" var="edu">
										<c:if test="${edu.eduApplyDto.edu_apply_pk eq pk}">
									 		${edu.eduDto.name }
										 </c:if>
									</c:forEach>
									
									<!-- <input name="star_rated" type="text"> -->
							</div>
							<!-- 별점 -->
							<div class="col-3 align-self-center">
								<select name="star_rated" class="form-select form-select-sm" aria-label="Default select example">
									<option selected value="5">⭐⭐⭐⭐⭐</option>
									<option value="4">⭐⭐⭐⭐</option>
									<option value="3">⭐⭐⭐</option>
									<option value="2">⭐⭐</option>
									<option value="1">⭐</option>
								  </select>
							</div>
							<!-- 평가내용 -->
							<div class="col align-self-center">
								<textarea name="content" class="mt-1" rows="1" cols="80" placeholder="악플은 안돼용" style="border-color: #C4C3C4;"></textarea>
								<input name="edu_apply_pk" type="hidden" value="${edu_apply_pk }">
								<!-- <input type="submit" value="만족도 등록" role="button"
								 style="background-color: #FBBC05; font-size: 0.8em;"> -->
							</div>
							<div class="col ms-0">
								<button type="submit" class="mt-1 d-grid btn btn-sm fw-bold text-white"
								style="background-color: #FBBC05; font-size: 0.8em;">만족도 등록</button>
							</div>
						</div>
						</form>
					</div>
				</div>
				<div class="row"></div>
			</div>
			<div class="col"></div>
		</div> 
		<!-- 만족도 작성 끝 -->


		<!-- 만족도 내역 -->
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-8">
				<div class="row">
					<div class="col">
						<div class="row fw-bold pb-1 border-bottom border-dark">
							<div class="col" style="font-size: 1.3em;">
								만족도 내역
							</div>
						</div>
						<div class="row fw-bold border-bottom my-1">
							<!-- 프로그램명 -->
							<div class="col">
									프로그램명
							</div>
							<!-- 별점 -->
							<div class="col">
								별점
							</div>
							<!-- 평가내용 -->
							<div class="col">
								평가내용
							</div>
							<!-- 평가일 -->
							<div class="col">
								평가일
							</div>
						</div>
						<!-- 만족도 내역 리스트 -->
						<c:forEach items="${MyServeyList}" var="myser">
						<div class="row border-bottom my-1">
							<div class="col">
								${myser.name}
							</div>
							<div class="col">
								<c:choose>
									<c:when test="${myser.eduStsfcSurveyDto.star_rated eq 5}">
										⭐⭐⭐⭐⭐
									</c:when>
									<c:when test="${myser.eduStsfcSurveyDto.star_rated eq 4}">
										⭐⭐⭐⭐
									</c:when>
									<c:when test="${myser.eduStsfcSurveyDto.star_rated eq 3}">
										⭐⭐⭐
									</c:when>
									<c:when test="${myser.eduStsfcSurveyDto.star_rated eq 2}">
										⭐⭐
									</c:when>
									<c:when test="${myser.eduStsfcSurveyDto.star_rated eq 1}">
										⭐
									</c:when>
								</c:choose>
								
							</div>
							<div class="col">
								${myser.eduStsfcSurveyDto.content }
							</div>
							<div class="col">
								<fmt:formatDate value="${myser.eduStsfcSurveyDto.created_at}"
								pattern="yy년 MM월 dd일"/>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="row"></div>
			</div>
			<div class="col"></div>
		</div> 
		<!-- 만족도 내역 끝 -->
		
		
		
		<jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
	</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	</body>
</html>
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
    	<title>학생 마이페이지(교육프로그램)</title>
    </head>
	<body>
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
					<div class="col text-center fw-bold" style="font-size: 1.3em;">
						나의 교육 프로그램
					</div>
					<div class="col-4 text-end">
						<input name="name" type="text" style="height: 25px;">
						<i class="bi bi-search-heart"></i>
					</div>
				</div>
				<div class="row mt-3">
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
							<div class="col fw-bold" style="text-align: center;" >
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
								<div class="col align-self-center text-center">
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
			</div> <!--교육목록 끝-->
			<div class="col"></div>
		</div>
		
		
		
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	</body>
</html>
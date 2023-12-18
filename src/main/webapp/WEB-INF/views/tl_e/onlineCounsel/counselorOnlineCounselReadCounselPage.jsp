<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../commons/counselorTopArea.jsp"></jsp:include>
	
	<div class="row mt-4">
		<div class="col border border-warning-emphasis border-1"></div>
	</div>
	<div class="container">
		<div class="row my-2">
			<div class="col"></div>
		</div>
		<div class="row">
			<div class="col mt-2" style="font-size: 1.9em; font-weight: bold; text-align: center; ">작성자 : ${targetCounselDto.studentInfo.name } </div>
			<div class="col-2"></div>
			<div class="col-2"></div>
			<div class="col-3"></div>
			<div class="col mt-4" style="font-size: 1.2em; font-weight: bold; text-align: right; ">
				작성시간 : <fmt:formatDate value="${targetCounselDto.counselDto.created_at}" pattern="yy.MM.dd"/>	
			</div>
			<div class="col-4"></div>
		</div>
		<div class="row">
			<div class="col mt-5" style="font-size: 1.2em; font-weight: bold;">카테고리 : ${targetCounselDto.category.name }</div>
		</div>
		<div class="row">
			<div class="col mt-5" style="font-size: 1.2em; font-weight: bold;" >제목 : ${targetCounselDto.counselDto.title }</div>
		</div>
		<div class="row">
			<div class="col mt-4"> 
			<span style="font-size: 1.2em; font-weight: bold;"> 상담 내용 : </span></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col mt-3" style="font-weight: bold; font-size: 0.9em;">
				<span style="font-size: 1.4em;">
					${targetCounselDto.counselDto.text }
				</span>
			</div>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col border border-warning-emphasis border-1"></div>
	</div>
	<div class="container">
		<div class="row mt-4">
			<div class="col" style="font-size: 1.9em; font-weight: bold; text-align: left ;">답변</div>
		</div>
		<div class="row mt-4" style="font-size: 1.4em; font-weight: bold;">
			<div class="col">작성자</div>
			<div class="col">답변내용</div>
			<div class="col">작성시간</div>
		</div>
		<c:forEach items="${replyDtoList }" var="replyDtoList">
			<div class="row" style="text-align: left; font-weight: bold; font-size: 1.1em;">				
				<div class="col">
					${replyDtoList.counselorDto.name }
				</div>
				<div class="col">
					${replyDtoList.replyDto.text }
				</div>
				<div class="col">
					<fmt:formatDate value="${replyDtoList.replyDto.created_at }" pattern="yy.MM.dd"/>
				</div>
			</div>
		</c:forEach>
		<c:choose>
			<c:when test="${targetCounselDto.isSurveyed == 0 }">
				<form action="./writeOnlineCounselReplyProcess" method="post">
					<div class="row mt-5">
						<div class="col">
							<div class="form-floating">
								<textarea name="text" class="form-control rounded-4" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
								<label for="floatingTextarea2">답변 작성</label>
							</div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col"></div>
						<div class="col-10">
							<button type="submit" value="Done" class="btn btn-dark d-grid gap-2 col-6 mx-auto">Done</button>								
						</div>
						<div class="col"></div>
					</div>
					<input name="counselor_id" type="hidden" value="${sessionExternalInfo.external_pk }">
					<input name="online_counsel_board_id" type="hidden" value="${targetCounselDto.counselDto.id }">
				</form>
			</c:when>
			<c:otherwise>
				<div class="row mt-4">
					<div class="col-3  mb-3 fw-bold">
						<div class="form-floating">
							<textarea class="form-control " placeholder="Leave a comment here" id="floatingTextareaDisabled" disabled></textarea>
							<label for="floatingTextareaDisabled">
								상담 평가 점수 :
								<c:if test="${targetCounselDto.surveyDto.score == 0}">
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:if>
								<c:if test="${targetCounselDto.surveyDto.score == 1}">
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:if>
								<c:if test="${targetCounselDto.surveyDto.score == 2}">
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:if>
								<c:if test="${targetCounselDto.surveyDto.score == 3}">
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star"></i>
									<i class="bi bi-star"></i>
								</c:if>
								<c:if test="${targetCounselDto.surveyDto.score == 4}">
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star"></i>
								</c:if>
								<c:if test="${targetCounselDto.surveyDto.score == 5}">
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
									<i class="bi bi-star-fill" style="color: deepblue;"></i>
								</c:if>
							</label>
						</div>
					</div>
					<div class="col mb-3 fw-bold">
						<div class="form-floating">
							<textarea class="form-control " placeholder="Leave a comment here" id="floatingTextareaDisabled" disabled></textarea>
							<label for="floatingTextareaDisabled">
								상담 평가 내용 : ${targetCounselDto.surveyDto.text }
							</label>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-4">
						<span class="fw-bold" style="font-size: 0.7em;">상담 평가가 <span class="text-danger">완료</span>되어 더 이상 답변을 등록할 수 없습니다.</span>
					</div>
					<div class="col"></div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="row mt-2">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col-1" style="text-align: right;">
					<a class="btn btn-dark" href="./counselorOnlineCounselMainPage" class="link-dark link-offset-2 link-underline link-underline-opacity-0">Back</a>
			</div>
		</div>
	</div>
	
</body>
</html>


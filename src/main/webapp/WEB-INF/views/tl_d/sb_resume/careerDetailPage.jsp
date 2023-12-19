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
<title>CareerDetailPage</title>
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
			<%-- 내용 시작 --%>
			<div class="col">
				<div class="row">
						<div class="col fs-5 fw-bold mt-5">경력</div>
				</div>
				<div class="row border-bottom border-dark"></div>
				<div class="row border border-top">
					<div class="col">
						<div class="row  border-bottom">
							<div class="col fs-5 text-center">카테고리</div>
							<div class="col-8  border-start fs-5 text-center">내용</div>
							<div class="col-2"></div>
						</div>
						
						<c:forEach items="${careerList }" var="list">
							<div class="row border-bottom border-gray">
								<div class="col text-center my-2">${list.careerName.career_category_name }</div>
								<div class="col-8 m-2 border-start">${list.careerDto.career_contents }</div>
								<div class="col-2">
									<div class="row p-1">
										<div class="col border-start">
											<form action="./careerUpdatePage">
												<input type="hidden" name="career_pk" value="${list.careerDto.career_pk }">
												<input type="hidden" name="resume_pk" value="${list.careerDto.resume_pk }">
												<button type="submit">수정</button>
											</form>
										</div>
										<div class="col">
											<form action="./careerDeleteProcess">
												<input type="hidden" name="career_pk" value="${list.careerDto.career_pk }">
												<input type="hidden" name="resume_pk" value="${list.careerDto.resume_pk }">
												<button type="submit">삭제</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						
					</div>	
				</div>
				
				<div class="row">
						<div class="col fs-5 fw-bold mt-5">경력 추가</div>
				</div>
				<div class="row border-bottom border-dark"></div>
				<form action="./careerRagistrationProcess" method="post">
				<div class="row border border-top">
					<div class="col-2 mt-2">
						<input name="resume_pk" type="hidden" value="${resumeDto.resume_pk }">
						<select name="career_category_pk" class="form-select" aria-label="경력 카테고리">
							<option selected>경력 선택</option>
							<c:forEach items="${careerCategoryList }" var="careercategory">
								<option  value="${careercategory.career_category_pk }">${careercategory.career_category_name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-8 my-2">
						<textarea name="career_contents" rows="8" cols="70"></textarea>
					</div>
					<div class="col-2 mt-5"><button type="submit">추가</button></div>
					
				</div>
				</form>
				
				
				
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-2">
						<form action="./resumeDetailPage" method="post">
							<input type="hidden" name="resume_pk" value="${resumeDto.resume_pk }">
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
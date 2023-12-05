<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1>경력 수정 관리 페이지</h1>
	
	<div class="container">
		<div class="row">
			<div class="col">
				
				<div class="row">
					<div class="col">
						이력서 제목 : ${resumeDto.resume_title }
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col">
						자소서 내용 : <br>
						${resumeDto.cover_letter }
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col">경력 카테고리</div>
					<div class="col">경력 내용</div>
					<div class="col">작성일</div>
					<div class="col"></div>
				</div>
				
				<div class="row">
					<div class="col">
						<form action="./careerUpdateProcess">
						<c:forEach items="${careerList}" var="career">
							<c:choose>
								<c:when test="${career.careerDto.career_pk == careerDto.career_pk  }">
									<div class="row">
										<div class="col">
											<select name="career_category_pk" class="form-select" aria-label="경력 카테고리">
												<option selected>경력 선택</option>
												<c:forEach items="${careerCategoryList }" var="careercategory">
													<option  value="${careercategory.career_category_pk }">${careercategory.career_category_name }</option>
												</c:forEach>
											</select>
										</div>
										<div class="col">
											<textarea name="career_contents" rows="10" cols="60" >${career.careerDto.career_contents }</textarea>
										</div>
										<div class="col">
											<fmt:formatDate value="${career.careerDto.created_at}" pattern="yyyy-MM-dd"/>
										</div>
										<div class="col">
											<input type="hidden" name="career_pk" value="${careerDto.career_pk }">
											<input type="hidden" name="resume_pk" value="${career.careerDto.resume_pk }">
											<button type="submit">수정완료</button>
										</div>
									</div>				
								</c:when>
								<c:otherwise>
									<div class="row">
										<div class="col">${career.careerName.career_category_name }</div>
										<div class="col">${career.careerDto.career_contents }</div>
										<div class="col"><fmt:formatDate value="${career.careerDto.created_at}" pattern="yyyy-MM-dd"/></div>
										<div class="col"></div>
									</div>
									
								</c:otherwise>
							</c:choose>
					
			    		</c:forEach>
			    
			    		</form>	
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>
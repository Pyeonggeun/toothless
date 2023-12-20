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
<title>readPage</title>
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
					<div class="col fs-4 fw-bold mt-5 pb-3" style="color:navy;">공지사항</div>
				</div>
				
				<div class="row">
				
					<div class="col">
					
						<div class="row">
							<div class="col">
								<div class="row border-top border-black bg-body-secondary ">
									<div class="col my-2 border-bottom fw-bold fs-5">${hoho.noBoardDto.notice_title }</div>	
								</div>
								<div class="row bg-body-secondary">
									<div class="col  fs-6" style="color: graytext;">
										<span class="ps-2">${hoho.staffInfoDto.name}</span>
									</div>
								<div class="row">
									<div class="col  pt-1 text-start"  style="color: graytext;">
									
								
									<span class="ps-1 fs-6">
									<fmt:formatDate value="${hoho.noBoardDto.created_at}" pattern="yyyy-MM-dd hh:mm:ss"/>
									</span>	
									</div>
									
								</div>
								</div>
							</div>
						</div>
			
						<div class="row ">
							<div class="col">
								<div class="row mt-3">
									<div class="col fw-bold">
										
									</div>
								</div>
								<div class="row mt-2 ">
									<div class="col">
										${hoho.noBoardDto.notice_contents}
									</div>
								</div>
								<div class="row"></div>
							
								<pre>
						
						
						
						
						
						
						
								</pre>
						  </div>
						</div>
						
					</div>
				</div>
				<div class="row border-top border-black pt-3 mt-1">
					<c:choose>
						<c:when test="${sessionStaffInfo.staff_pk == hoho.staffInfoDto.staff_pk }">	
							<div class="col text-end">
								<a class="navbar-brand" href="./noticeMainPageForStudent">
									<button type="submit" class="btn btn-primary">
										<i class="bi bi-list"></i>목록
									</button>
								</a>
							</div>
							
						</c:when>
						<c:otherwise>
							<div class="col text-center">
								<i class="bi bi-list"></i>
								<a class="navbar-brand" href="./noticeMainPageForStudent">목록</a>
							</div>
						</c:otherwise>	
					</c:choose>
				</div>
			</div>
			
			<div class="col-2"></div>
		</div>
			
	</div>
	
	<div class="container">
		<div style="height: 200px;"></div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
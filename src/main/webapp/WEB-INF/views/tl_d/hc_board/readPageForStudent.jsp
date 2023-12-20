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
					<div class="col fs-4 fw-bold border-bottom border-dark mt-5 pb-3" style="color:navy;">자주 묻는 Q&A</div>
				</div>
				
				<div class="row">
					<div class="col">
					
						<div class="row">
							<div class="col">
								<div class="row border-top border-black bg-body-secondary">
									<div class="col my-2 border-bottom fw-bold fs-5">${roman.qnABoardDto.board_title}</div>	
								</div>
								<div class="row bg-body-secondary">
									<div class="col" style="color: graytext;">
										${roman.staffInfoDto.name}
									</div>
								</div>
								<div class="row">
									<div class="col  pt-1 bg-body-secondary fs-6"  style="color: graytext;">
									<fmt:formatDate value="${roman.qnABoardDto.created_at}" pattern="yyyy-MM-dd hh:mm:ss"/>							
									</div>
								</div>
							</div>
						</div>
			
						<div class="row ">
							<div class="col">
								<div class="row mt-3">
									<div class="col fw-bold">
										내용
									</div>
								</div>
								<div class="row mt-2 ">
									<div class="col">
										${roman.qnABoardDto.board_contents}
									</div>
								</div>
								<div class="row"></div>
								<div class="row mt-3 pt-5">
									<div class="col fw-bold">
										답변내용
									</div>
								</div>
								<div class="row mt-2">
									<div class="col">
										${roman.qnABoardDto.board_answer}
									</div>
								</div>
							
								<pre>
						
						
						
						
						
						
						
								</pre>
						  </div>
						</div>
						
					</div>
				</div>
				<div class="row border-top border-black pt-3 mt-1">
					<c:choose>
						<c:when test="${sessionStaffInfo.staff_pk == roman.staffInfoDto.staff_pk }">	
							<div class="col text-end">
								<a class="navbar-brand" href="./QnABoardPageForStudent">
									<button type="submit" class="btn btn-primary">
									<i class="bi bi-list"></i>목록
								</button>
								</a>	
							</div>
							
						</c:when>
						<c:otherwise>
							<div class="col text-center">
							<a class="navbar-brand" href="./QnABoardPageForStudent">
								<button type="submit" class="btn btn-primary">
									<i class="bi bi-list"></i>
									목록
								</button>
							</a>
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
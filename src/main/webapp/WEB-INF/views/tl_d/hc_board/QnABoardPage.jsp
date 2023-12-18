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
<title>NoticeMainPage</title>
</head>
<body>
	

	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<!-- 
		1.row밑에 또 row를 쓰려면 그 전에 col을 닫고 다시 row열어야함
		2.규격의 마지막은 무조건 col로, row끝내기 X
	
		 -->
		<%-- 예시
		<div class="row">
			<div class="row></div> <--안됨
			<div class="col"></div>
			<div class="col">
				<div class="row">
					<div class="col"></div>
					<div class="col"></div>
					<div class="col"></div>
				</div>
			</div>
		</div>
		 --%>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col-1 me-5">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
			<%-- 공지사항 칸 --%>
				<div class="row  border-bottom border-4 border-dark mb-5 pt-3 ">
					<div class="col fw-bold fs-3">QnA게시판</div>															
				</div>
				<div class="row border-4 border-bottom border-black">
					<div class="col mb-1 fw-bold">글번호</div>
					<div class="col fw-bold ps-3 text-center">제목</div>
					<div class="col fw-bold text-end pe-5">작성자</div>
					<div class="col fw-bold">작성일</div>
				</div>
				
				<div class="row border">
					<div class="col">
						<c:forEach items="${list }" var="map">
							<div class="row">
								<div class="col-1 border-end mb-2">
									${map.qnaBoardDto.board_pk }	
								</div>
								<div class="col border-end">
								<td><a class="navbar-brand" href="./readPage?board_pk=${map.qnaBoardDto.board_pk }">
								${map.qnaBoardDto.board_title }</a></td>
								</div>
								<div class="col-2 border-end">
									${map.staffInfoDto.name}
								</div>
								<div class="col-3">
								<fmt:formatDate value="${map.qnaBoardDto.created_at }" pattern="yyyy-MM-dd"/>	
								</div>
							</div>
						</c:forEach>	
					</div>
				</div>
				
				<div class="row pt-3">
					<div class="col">
						<div class="row text-end">
							<div class="col ">
							</div>
							<div class="col">									
								<form action="./BoardWritePage">
									<button type="submit" class="btn btn-primary">
										<i class="bi bi-pencil-fill"></i> 글작성
									</button>
									<!-- <input type="submit" value="글작성"> -->
								</form>
							</div>
						</div>
					</div>
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
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
<title>BasePage</title>
</head>
<body>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<div class="col-1"></div>
			<div class="col-1 me-5">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<div class="col-1 border-start"></div>
			<%-- 내용 시작 --%>
			<div class="col">
				<div class="row border-bottom border-4 border-dark mb-3 pt-3">
					<div class="col fw-bold fs-3">글 수정</div>
				</div>
				
				<div class="row">
					<div class="col my-2 text-secondary" style="font-size: small;">
						작성자:${sessionStaffInfo.name}
					</div>
				</div>
				
				<form action="./updateProcess">
					<div class="row mb-4">
						<div class="col">
								<textarea name="board_title"  class="form-control form-control-sm" >${soso.qnABoardDto.board_title}</textarea>
								
						</div>
					</div>
				
					<div class="row ">
						<div class="col mb-3">
						<textarea name="board_contents" class="form-control" rows="20">${soso.qnABoardDto.board_contents}</textarea>
						</div>
					</div>

					<div class="row ">
						<div class="col">
						<textarea name="board_answer" class="form-control" rows="20">${soso.qnABoardDto.board_answer}</textarea>
						</div>	
					</div>
							
					<div class="row mt-3">
						<div class="col"></div>
						<div class="col text-end">
							<button type="submit" class="btn btn-primary">
								<i class="bi bi-pencil-fill">글수정</i>
							</button>
						</div>	
					</div>
					<input name="board_pk" type="hidden" value="${soso.qnABoardDto.board_pk}">
					<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk}">
				</form>
				
				
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
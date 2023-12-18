<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-2">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 border-start"></div>
			<%-- 채용공고 등록 양식 --%>
			<div class="col">
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
				<div class="row mt-5">
					<div class="col py-3">
						<div class="row">
							<div class="col text-center">
								<i class="fs-4 bi bi-check2-circle"></i>
							</div>
						</div>
						<div class="row mt-2">
							<div class="col fs-3 fw-bold text-center">
								채용 공고등록이 완료되었습니다
							</div>
						</div>
						<div class="row mt-5 pb-2" >
							<div class="col ms-5">
								<input class="btn btn-outline-secondary d-grid" type="submit" value="목록확인">
							</div>
							<div class="col"></div>
							<div class="col">
								<input class="btn btn-info d-grid" type="submit" value="추가등록하기">
							</div>
						</div>
					</div>
				</div>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col"></div>	
		</div>
		<div class="row mb-5 pb-5"><div class="col"></div></div>
		<!-- futter -->
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>	
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
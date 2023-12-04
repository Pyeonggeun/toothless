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
			<%-- 왼쪽 여백--%>
			<div class="col-1"></div>
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-1 me-5">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 border-start"></div>
			<%-- 채용공고 등록 양식 --%>
			<div class="col">
				<form action="./registerJobPostingProcess" method="post" enctype="multipart/form-data">
				<input name="com_pk" type="hidden" value="">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">채용공고</div>
				</div>
				<!-- 공고 제목 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="posting_name" type="text" placeholder="공고제목">
					</div>
				</div>
				<!-- 채용분야 -->
				<div class="row mt-3">
					<div class="col">
						<!-- forEach예정  -->
						<input name="job_field_category_pk" type="checkbox" value="">
					</div>
				</div>
				<!-- 구인직무 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="job_position" type="text" placeholder="구인직무">
					</div>
				</div>
				<!-- 메인이미지 -->
				<div class="row mt-3">
					<div class="col">
						<input name="imageFile" type="file" accept="image/*">
					</div>
				</div>
				<!-- 채용내용 -->
				<div class="row mt-3">
					<div class="col">
						<textarea name="posting_contents" rows="10" cols="80" style="resize: both;"></textarea>						
					</div>
				</div>
				<!-- 우대사항 -->
				<div class="row mt-3">
					<div class="col">
						<textarea name="preference" rows="10" cols="80" style="resize: both;"></textarea>						
					</div>
				</div>
				<!-- 채용인원 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-sm border-black" name="hire_number" type="text">명
					</div>
				</div>
				<!-- 채용마감일 -->
				<div class="row mt-3">
					<div class="col">
						<input class="form-control form-control-sm border-black" name="posting_deadline" type="date">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-10"></div>
					<div class="col">
						<!-- <input class="btn btn-primary" type="submit" value="공고등록"> -->
					</div>
				</div>
				</form>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col"></div>	
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
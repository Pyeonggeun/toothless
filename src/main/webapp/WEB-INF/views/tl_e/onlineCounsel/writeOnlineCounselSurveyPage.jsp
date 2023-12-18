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
	<div class="row">
		<div class="col-2"></div>
		<div class="col text-center" style="font-size: 2.2em; color: dark; font-weight: bold">상담 센터</div>
		<div class="col-2 mt-3 d-flex justify-content-around">
			<span class="fw-bold" style="font-size: 1.3em;"> 상담사 ${sessionExternalInfo.external_id }님</span>
		</div>
	</div>
	<div class="row mt-2 align-items-center" style="font-weight: bold; font-size: 1.4em; background-color: blue; color: beige; text-align: center;"  >
		<div class="col-1"></div>		
		<div class="col">
			Home
		</div>
		<div class="col">
			공지사항
		</div>
		<div class="col">
			상담
		</div>
		<div class="col">
			<div class="dropdown">
				<button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    	<span style="font-size: 1.4em; font-weight: bold; color: beige;">내 정보</span>
				</button>
				<ul class="dropdown-menu" style="background-color: #333;">
				    <li><a class="dropdown-item" href="#" style="color: beige;">답변 완료 상담</a></li>
				    <li><a class="dropdown-item" href="#" style="color: beige;">채택 된 상담</a></li>
				    <li><a class="dropdown-item" href="./logoutProcess" style="color: beige;">로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="row mt-4">
		<div class="col border border-warning-emphasis border-1"></div>
	</div>
	<div class="container">
		<div class="row mt-4">
			<div class="col fs-2 fw-bold">만족도 조사</div>							
		</div>
		<form action="./writeOnlineCounselSurveyProcess" method="post">
			<div class="row mt-4">
				<div class="col-4 d-grid">
					<div class="row">
						<div class="col">
							<ul>
								<li>
								<div class="col">
									<div class="form-floating fw-bold text-secondary">
										<label for="floatingTextarea" style="font-size: 0.7em;">점수를 입력해주세요! <span class="text-danger">(0~5)</span></label>
										<input name="score" class="form-control rounded-4" type="number" min="0" max="5">
									</div> 
								</div>
							</ul>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="row">
						<div class="col">
							<div class="row mt">
								<ul>
									<li>
									<div class="col">
										<div class="form-floating fw-bold text-secondary">
											<textarea name="text" class="form-control rounded-4" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
											<label for="floatingTextarea" style="font-size: 0.7em;">리뷰를 작성해주세요!</label>
										</div>
									</div>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-2"></div>
				<div class="col d-grid">
					<input name="online_counsel_board_id" type="hidden" value="${online_counsel_board_id }">
					<input type="submit" value="Done" class="btn btn-dark">
				</div>
				<div class="col-2"></div>
			</div>
			
		</form>
	</div>
	<div class="row mt-4">
		<div class="col border border-warning-emphasis border-1"></div>
	</div>
</body>
</html>


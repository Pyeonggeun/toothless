<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>AJDKS TEMPLATE FOR STAFF</title>
<style>
/*교직원좌측메뉴바설정*/
.staffleftmenubar input {
	display: none;
}

.staffleftmenubar label {
	display: block;
	cursor: pointer;
	background: #0C2145;
	transition: ease .1s;
}

.staffleftmenubar label:hover {
	background: #0C2145;
	opacity: 50%;
}

.staffleftmenubar .content {
	background: #091933;
	transition: ease .5s;
}

.staffleftmenubar input+label+.content {
	display: none;
}

.staffleftmenubar input:checked+label+.content {
	display: block;
}

/*a태그기본설정제거*/
.nolinenoblue>a {
	text-decoration: none;
	color: #000000;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- 전체 container 입구 -->

		<div class="row">
			<div class="col">
				<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
			</div>
		</div>
		<div class="row">

			<!-- 좌측메뉴바 -->
			<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>

			<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
			<div class="col">
				<div class="row">
					<div class="col mx-5">

						<div class="row mt-3 mb-3 ">
							<div class="col">
								<div class="row">
								</div>
							</div>
							
							<div class="col">
							
								<form class="row row-cols-lg-auto g-3 align-items-center">
								  <div class="col-12">
								    <label class="visually-hidden" for="inlineFormInputGroupUsername">Username</label>
								    <div class="input-group">
								      <div class="input-group-text">@</div>
								      <input type="text" class="form-control" id="inlineFormInputGroupUsername" placeholder="Username">
								    </div>
								  </div>
								
								  <div class="col-12">
								    <label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
								    <select class="form-select" id="inlineFormSelectPref">
								      <option selected>Choose...</option>
								      <option value="1">One</option>
								      <option value="2">Two</option>
								      <option value="3">Three</option>
								    </select>
								  </div>
								
								  <div class="col-12">
								    <div class="form-check">
								      <input class="form-check-input" type="checkbox" id="inlineFormCheck">
								      <label class="form-check-label" for="inlineFormCheck">
								        Remember me
								      </label>
								    </div>
								  </div>
								
								  <div class="col-12">
								    <button type="submit" class="btn btn-dark">Submit</button>
								  </div>
								</form>
							</div>
						
						</div>

						<!-- 본문작성공간 -->
						<form class="row g-3">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Password</label>
								<input type="password" class="form-control" id="inputPassword4">
							</div>
							<div class="col-12">
								<label for="inputAddress" class="form-label">Address</label> <input
									type="text" class="form-control" id="inputAddress"
									placeholder="1234 Main St">
							</div>
							<div class="col-12">
								<label for="inputAddress2" class="form-label">Address 2</label>
								<input type="text" class="form-control" id="inputAddress2"
									placeholder="Apartment, studio, or floor">
							</div>
							<div class="col-md-6">
								<label for="inputCity" class="form-label">City</label> <input
									type="text" class="form-control" id="inputCity">
							</div>
							<div class="col-md-4">
								<label for="inputState" class="form-label">State</label> <select
									id="inputState" class="form-select">
									<option selected>Choose...</option>
									<option>...</option>
								</select>
							</div>
							<div class="col-md-2">
								<label for="inputZip" class="form-label">Zip</label> <input
									type="text" class="form-control" id="inputZip">
							</div>
							<div class="col-12">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="gridCheck">
									<label class="form-check-label" for="gridCheck"> Check
										me out </label>
								</div>
							</div>
							<div class="col-12">
								<button type="submit" class="btn btn-dark">Sign in</button>
							</div>
						</form>

						
						<div class="row mt-3 mb-3 ">
							<div class="col">
								<div class="row">
								</div>
						</div>
						
						<form class="row g-3">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									type="email" class="form-control" id="inputEmail4">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Password</label>
								<input type="password" class="form-control" id="inputPassword4">
							</div>
							<div class="col-12">
								<label for="inputAddress" class="form-label">Address</label> <input
									type="text" class="form-control" id="inputAddress"
									placeholder="1234 Main St">
							</div>
							<div class="col-12">
								<label for="inputAddress2" class="form-label">Address 2</label>
								<input type="text" class="form-control" id="inputAddress2"
									placeholder="Apartment, studio, or floor">
							</div>
							<div class="col-12">
								<button type="submit" class="btn btn-dark">Sign in</button>
							</div>
							
							<div class="mb-3">
							  <label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
							  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
							</div>

							
						</form>
						
						
						
						
						


					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- 전체 container 출구 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
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

			<!-- 좌측 메뉴바 -->
			<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>

			<!-- 본문 -->
			<div class="col mx-5">

				<!-- 여백 -->
				<div class="row mt-3 mb-3 ">
					<div class="col"></div>
				</div>


				<!-- 상단 헤더 -->
				<div class="row mt-3 mb-3 ">
					<div class="col">
						<div class="row">
							<div class="col">


								<h3>
									<i class="bi bi-box-arrow-in-down-right"></i> 현장 실습 등록
								</h3>


							</div>
						</div>
					</div>
				</div>

				<!-- 본문 작성 공간 -->
				<form class="row g-3">

					<div class="col-12">
						<label class="visually-hidden" for="inlineFormInputGroupUsername"></label>
						<div class="input-group">
							<div class="input-group-text">담당자 입력</div>
							<input type="text" class="form-control"
								id="inlineFormInputGroupUsername"
								placeholder="담당자 명의를 작성해주시기 바랍니다.">
						</div>
					</div>
					<div class="col-md-8">
						<label for="inputCity" class="form-label"> 글 제목</label> <input
							type="text" class="form-control" id="inputCity"
							placeholder="50자 내외의 글 제목을 작성해주시기 바랍니다.">
					</div>
					<div class="col-md-4">
						<label for="inputState" class="form-label"> 인원 수 </label> <select
							id="inputState" class="form-select">
							<option selected>1</option>
							<option selected>2</option>
							<option selected>3</option>
							<option selected>4</option>
							<option selected>5</option>
						</select>
					</div>

				</form>


				<div class="row mt-2 mb-3 ">

					<div class="col">
						<div class="row"></div>
					</div>

				</div>

				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">글
						내용</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="8" placeholder="공고 모집사항 및 자격 조건을 작성해주시기 바랍니다."></textarea>
				</div>




				<form class="row g-3">

					<table class="table">

						<thead class="table table-sm">
							<tr>
								<th scope="col"></th>
								<th scope="col"></th>

							</tr>
						</thead>


							<!-- 기능 고도화 시 사용될 항목 -->
						<tbody class="table-group-divide table-sm">
							<tr>
								<td scope="row">마감일</td>
								<td scope="row"><input type="text" class="form-control"
									id="inputCity"></td>
							</tr>
							<tr>
								<td scope="row">직무</td>
								<td scope="row"><input type="text" class="form-control"
									id="inputCity"></td>

							</tr>
							<tr>
								<td scope="row">고용형태</td>
								<td scope="row"><input type="text" class="form-control"
									id="inputCity"></td>

							</tr>
						</tbody>
					</table>

				</form>


				<!-- 여백용도 -->
				<div class="row mt-2 mb-2 ">
					<div class="col">
						<div class="row"></div>
					</div>
				</div>


				<!-- 하단 -->

				<div class="col-12 d-flex justify-content-end">

					<form class="row row-cols-lg-auto g-3 align-items-center">

						<div class="col">
							<button type="submit" class="btn btn-dark">등록</button>
						</div>

						<div class="col">
							<button type="submit" class="btn btn-dark">목록으로</button>
						</div>

						<div class="col">
							<button type="submit" class="btn btn-dark">임시저장</button>
						</div>

					</form>

				</div>

			</div>
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
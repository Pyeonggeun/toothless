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
body {
	font-family: "Noto Sans CJK KR";
}

.jb-700 {
	font-weight: 700;
}

.jb-bolder {
	font-weight: bolder;
}

.jb-x-small {
	font-size: x-small;
}

.jb-small {
	font-size: small;
}

.jb-medium {
	font-size: medium;
}

.labelcolor {
	color: white;
	background: #2B3D77;
}

.fontcolor {
	color: $blue-800;
}

.fontcolor2 {
	color: #2B3D77;
}

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

								<!-- 상단 텍스트 -->
								<h3 class="jb-700 fontcolor2">
									<i class="bi bi-box-arrow-in-down-right "></i> 관리자 현장실습 등록
								</h3>

							</div>
						</div>
					</div>
				</div>

				<form name="frm" id="frm" action="./ajdksInternshipReg" method="post">

					<!-- 본문 작성 공간 -->

					<!-- 고도화 진행 시 담당자 이름 삽입 -->
					<!--<div class="col-12">
						<label class="visually-hidden" for="inlineFormInputGroupUsername"></label>
						<div class="input-group">
							<div class="input-group-text jb-700">담당자 입력</div>
							<input type="text" class="form-control"
								id="inlineFormInputGroupUsername"
								placeholder="담당자 명의를 작성해주시기 바랍니다. 아직 글 넣으면 안 되므로 유의하기.">
						</div>
					</div>-->

					<div class="col-md-7">
						<label for="inputCity" class="form-label jb-700"> 글 제목 </label> <input
							name="course_title" type="text" class="form-control"
							style="font-size: 0.9em;" id="inputCity"
							placeholder="50자 내외의 글 제목을 작성해주시기 바랍니다.">
					</div>

					<div class="col-md-5">
						<label for="inputState" class="form-label jb-700"> 인원 수 </label> <select
							id="inputState" class="form-select">
							<option selected>1</option>
							<option selected>2</option>
							<option selected>3</option>
							<option selected>4</option>
							<option selected>5</option>
						</select>
					</div>

					<div class="row mt-2 mb-3 ">

						<div class="col">
							<div class="row"></div>
						</div>

					</div>

					<!-- 고도화 진행 시 글내용 삽입 -->
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label jb-700">글
							내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="7" style="font-size: 0.9em;"
							placeholder="공고 모집사항 및 자격 조건을 작성해주시기 바랍니다. 아직 글 넣으면 안 되므로 유의하기."></textarea>
					</div>

					<table class="table">

						<thead class="table table-sm ">
							<tr>
								<th scope="col"><i class="bi bi-check-circle-fill"></i> 필수
									날짜 입력 항목</th>
								<th scope="col"><i class="bi bi-calendar3"></i> 날짜 입력</th>

							</tr>
						</thead>


						<!-- 기능 고도화 시 사용될 항목 -->
						<tbody class="table table-sm align-middle">
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 모집기간시작</td>
								<td scope="row"><input name="applying_start_date" type="date" class="form-control" style="font-size: 0.9em;"></td>
							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 모집기간종료</td>
								<td scope="row"><input name="applying_end_date" type="date" class="form-control"  style="font-size: 0.9em;"></td>

							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 실습기간시작</td>
								<td scope="row"><input name="internship_start_date" type="date" class="form-control" style="font-size: 0.9em;"></td>
							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 실습기간종료</td>
								<td scope="row"><input name="internship_end_date" type="date" class="form-control" style="font-size: 0.9em;"></td>

							</tr>
							<tr>
								<td scope="row" style="font-size: 0.9em;">- 선발결과발표일</td>
								<td scope="row"><input name="announcement_date" type="date" class="form-control" style="font-size: 0.9em;"></td>
							</tr>

						</tbody>
					</table>
					<!--  팝업이 완성되면 아래 것들 지우고 다시 정리 -->
					<input type="hidden" name="company_pk" value="2">
					<input type="hidden" name="professor_pk" value="1">
				    <input type="hidden" name="department_pk" value="1">				
					
				</form>


				<!-- 여백용도 -->
				<div class="row mt-2 mb-2 ">
					<div class="col">
						<div class="row"></div>
					</div>
				</div>


				<!-- 하단 버튼 -->
				<div class="col-12 justify-content-end">

					<div class="row">
					<div class="col">
						<button onclick="javascript:fn_reg();" class="btn labelcolor"><i
							class="bi bi-pencil-square"></i> 등록</button>
					</div>

					<div class="col">
						<a href="./ajdksInternshipList" class="btn labelcolor"><i
							class="bi bi-list-ul"></i> 목록으로</a>
					</div>
				</div>
					<!-- 고도화 진행시 사용 -->

					<div class="col">
						<a href="" type="button" class="btn labelcolor"
							data-bs-toggle="modal" data-bs-target="#exampleModal"> <i
							class="bi bi-file-earmark-arrow-down"></i> 임시저장
						</a>

						<!-- Modal test -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">
											현장실습 안내 페이지 저장 완료</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body jb-small">임시 저장이 완료되었습니다. 연속 저장할
										경우 기존 임시 저장 내역으로부터 덮어 씌워지므로 유의해주시기 바랍니다.</div>
									<div class="modal-footer">
										<a type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">닫기</a> <a href="" type="button"
											class="btn labelcolor">저장 완료</a>
									</div>
								</div>
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
		
 	<script>
 	function fn_reg() {
		const frm = document.getElementById("frm");
		
		if(frm.course_title.value == "") {
			alert("제목을 입력하여 주십시오.");
			frm.course_title.focus();
			return;
		}
		
		if(frm.applying_start_date.value == "") {
			alert("모집기간 시작 일자를 입력하여 주십시오.");
			frm.applying_start_date.focus();
			return;
		}
		if(frm.applying_end_date.value == "") {
			alert("모집기간종료 일자를 입력하여 주십시오.");
			frm.applying_end_date.focus();
			return;
		}
		if(frm.internship_start_date.value == "") {
			alert("실습기간시작 일자를 입력하여 주십시오.");
			frm.internship_start_date.focus();
			return;
		}
		if(frm.internship_end_date.value == "") {
			alert("실습기간종료 일자를 입력하여 주십시오.");
			frm.internship_end_date.focus();
			return;
		}
		if(frm.announcement_date.value == "") {
			alert("선발결과발표일 일자를 입력하여 주십시오.");
			frm.announcement_date.focus();
			return;
		}
		
		frm.submit();
 	}
 	
 	</script>
</body>
</html>
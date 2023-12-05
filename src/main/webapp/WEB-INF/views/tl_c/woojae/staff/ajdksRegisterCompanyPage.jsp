<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title> AJDKS TEMPLATE FOR STAFF </title>
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
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

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
			<div class="col mx-4">
			
			<!-- 본문작성공간 -->
				<form action="./registerCompanyProcess">
				<div class="row mt-5">
					<div class="col fw-bold">
						산업체 등록
					</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-2"></div>
				</div>
				<div class="row mt-5">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						사업자등록번호
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="company_id" type="text" placeholder="예시) 1234-587-1122" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						업체명
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="company_name" type="text" placeholder="예시) 빵계홍빵집" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						업종
					</div>
					<div class="col-6 d-flex mt-2" style="font-size: 0.8em;">
						<c:forEach items="${list}" var="companyCategoryList">
							<input class="form-check-input"  name="company_category_pk" type="radio" value="${companyCategoryList.company_category_pk}">
							&nbsp;${companyCategoryList.company_category_name}&nbsp;
						</c:forEach>
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						대표명
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="ceo_name" type="text" placeholder="예시) 빵계홍" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						주소
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="address" type="text" placeholder="예시) 경기도 안양시" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						전화번호
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="phone" type="text" placeholder="예시) 010-0000-0000" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						홈페이지 주소
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="url" type="text" placeholder="예시) www.ddd.com" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						산업체 아이디
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="external_id" type="text" placeholder="업체에 부여할 아이디를 입력해주세요. 예시) abc123" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col mt-2 me-2 d-flex justify-content-end" style="font-size: 0.9em;">
						산업체 비밀번호
					</div>
					<div class="col-6 d-grid">
						<input class="form-control" name="password" type="password" placeholder="업체에 부여할 비밀번호를 입력해주세요. 예시) 123456!" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk}">
				<div class="row mt-2">
					<div class="col-8"></div>
					<div class="col-1 mt-2 me-2 d-flex justify-content-end">
						<input class="btn btn-secondary" type="submit" value="등록하기" style="font-size: 0.9em;" style="font-size: 0.9em;">
					</div>
					<div class="col"></div>
				</div>
				</form>
			</div>
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>


<%--
		<form action="./registerCompanyProcess">
				<div class="row mt-5">
					<div class="col fw-bold">
						산업체 등록
					</div>
				</div>
				<div class="row mt-2">
					<div class="col border-bottom border-3"></div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<c:forEach items="${list}" var="companyCategoryList">
							<input name="company_category_pk" type="radio" value="${companyCategoryList.company_category_pk}">
							${companyCategoryList.company_category_name}
						</c:forEach>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="company_id" type="text" placeholder="사업자등록번호를 입력해주세요">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="company_name" type="text" placeholder="업체명을 입력해주세요">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="ceo_name" type="text" placeholder="대표명을 입력해주세요">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="address" type="text" placeholder="주소를 입력해주세요">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="phone" type="text" placeholder="전화번호를 입력해주세요">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="url" type="text" placeholder="홈페이지 주소를 입력해주세요">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="external_id" type="text" placeholder="업체에 부여할 아이디">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="form-control" name="password" type="text" placeholder="업체에 부여할 비밀번호">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center d-grid">
						<input class="btn btn-secondary" type="submit" value="등록하기">
					</div>
				</div>
				<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk}">
				</form>
 --%>
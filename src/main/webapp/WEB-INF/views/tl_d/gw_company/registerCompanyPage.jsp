<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>기업 등록 페이지</title>
</head>
<body>

	<div class="container-fluid"> 
		<div class="row">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>	
		</div>
		
		<!-- 기업 정보 입력 -->
		<div class="row mt-5 mb-2">
			<div class="col text-center fw-bold">기업 소재</div>
		</div>
		
		<form action="./registerCompanyProcess" method="post">
			<div class="row">
				<div class="col"></div>
				<div class="col mt-3 border-top border-bottom border-light-subtle">
					
					<!-- 기업 규모 입력 -->
					<div class="row mt-3"> 
						<div class="col"> 
							<div class="row mb-1">기업규모</div>
							<select class="form-select" name="com_scale_category_pk" >
							  <option disabled selected>기업규모를 선택해주세요</option>
							  <c:forEach items="${comScaleList}" var="scale">
							  	<option value="${scale.com_scale_category_pk}">${scale.com_scale_category_name}</option>
							  </c:forEach>
							</select>
						</div>
					</div>
					
					<!-- 사업자 등록번호 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row mb-1">
								사업자 등록번호 
							</div>
							<div class="row">
								<input type="text" name="business_number" class="form-control" placeholder="사업자 등록번호를 입력해주세요.">
							</div>
						</div>
					</div>
					
					<!-- 회사명 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row mb-1">
								회사명
							</div>
							<div class="row">
								<input type="text" name="com_name" class="form-control" placeholder="회사명을 입력해주세요.">
							</div>
						</div>
					</div>
					
					<!-- 대표자 명 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row mb-1">
								대표자 명 
							</div>
							<div class="row">
								<input type="text" name="com_bossname" class="form-control" placeholder="대표자명을 입력해주세요.">
							</div>
						</div>
					</div>
					
					<!-- 기업 주소 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row">
								주소 
							</div>
							<div class="row mb-3">
								<input type="text" name="com_address" class="form-control" placeholder="주소를 입력해주세요.">
							</div>
						</div>
					</div>
					
				</div>
				
				
				<div class="col"></div>
			</div>
			
			<!-- 기업 담당자 입력 -->
			<div class="row mt-3 mb-2">
				<div class="col text-center fw-bold">기업 담당자 등록</div>
			</div>
			
			
			<div class="row">
				<div class="col"></div>
				<div class="col mt-3 border-top border-bottom border-light-subtle">
					
					<!-- 담당자 이름 입력 -->
					<div class="row mt-3">
						<div class="col">
							담당자 이름 <input type="text" name="com_manager_name" class="form-control" placeholder="담당자 명을 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 이메일 입력 -->
					<div class="row mt-3">
						<div class="col">
							이메일 <input type="text" name="com_manager_email" class="form-control" placeholder="이메일을 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 부서명 입력 -->
					<div class="row mt-3">
						<div class="col">
							부서명 <input type="text" name="com_manager_department" class="form-control" placeholder="주소를 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 직위 입력 -->
					<div class="row mt-3">
						<div class="col">
							직위 <input type="text" name="com_manager_position" class="form-control" placeholder="직위를 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 사무실 전화번호 입력 -->
					<div class="row mt-3">
						<div class="col">
							사무실 전화번호 <input type="text" name="com_direct_number" class="form-control" placeholder="사무실 전화번호를 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 휴대폰번호 입력 -->
					<div class="row mt-3">
						<div class="col mb-3">
							핸드폰번호 <input type="text" name="com_manager_phone" class="form-control" placeholder="휴대폰 번호를 입력해주세요.">
						</div>
					</div>
					
				</div>
				
				<div class="col"></div>
			</div>
			
			<!-- 여백 줄려고 -->
			<div class="row"></div>
			
			<!-- 취업지원센터에서 사용할 아이디, 비밀번호 입력 -->
			<div class="row mt-3 mb-2">
				<div class="col text-center fw-bold">기업 계정 가입 정보</div>
			</div>
			
			<div class="row">
				<div class="col"></div>
				<div class="col mt-3 border-top border-bottom border-light-subtle">
					
					<div class="row mt-2">
						
						<div class="row">
							ID <input type="text" name="external_id" class="form-control" placeholder="로그인시 사용할 ID를 입력해주세요.">
						</div>
					</div>
					<div class="row mt-3">
						<div class="row mb-3">
							PW <input type="text" name="password" class="form-control" placeholder="로그인시 사용할 password를 입력해주세요.">
						</div>
					</div>
					
				</div>
				
				<div class="col"></div>
			</div>
			
			<div class="row mt-3 mb-2">
			
				
				<div class="col"></div>
				<div class="col d-grid"><input class="btn btn-primary" type="submit" value="가입하기"></div>
				<div class="col"></div>
				
			</div>
			
		</form>
		
	</div>
	
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>
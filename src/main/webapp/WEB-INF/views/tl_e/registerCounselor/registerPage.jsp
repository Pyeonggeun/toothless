<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<%-- 부트스트랩 아이콘 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%-- 구글폰트(Quicksand, Dongle, Gowun Dodum --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
<style>
*{
	/* font-family: 'Dongle', sans-serif; */
	font-family: 'Gowun Dodum', sans-serif;
	/* font-family: 'Quicksand', sans-serif; */
}
</style>
<title>상담원 등록 페이지</title>
</head>
<body>
	
	<div class="container">
	
		<div class="row border-bottom">
			<div class="col-10"></div>
			<div class="col py-2 me-0 pe-0 text-center dropdown nav-item">
			  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    <span class="fw-bold">${sessionStaffInfo.name}</span>님
			  </a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">정보 수정</a></li>
			    <li><a class="dropdown-item" href="#">마이페이지</a></li>
			    <li><hr class="dropdown-divider"></li>
			    <li><a class="dropdown-item" href="#"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			  </ul>
			</div>
		</div>

		<div class="row"></div>
		<div class="row">
			<div class="col ms-4">
				<div class="row pt-5">
					<div class="col fw-bold fs-3">
						<a href="../commons/counselCenterStaffMainPage" role="button" class="btn btn-white">
							<span class="fw-bold fs-3">MENU</span>
						</a>
					</div>
				</div>
				<div class="row pt-5">
					<div class="col fs-5">
						<div class="dropend">
							<button class="btn btn-white dropdown-toggle navbar-brand" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							상담원 관리
							</button>
							<ul class="dropdown-menu">
							    <li><a class="dropdown-item" href="../registerCounselor/registerPage">상담원 등록</a></li>
						   		<li><a class="dropdown-item" href="../registerCounselor/counselorInfo">상담원 조회</a></li>
						   		<li><a class="dropdown-item" href="../registerCounselor/managementCounselor">상담원 관리(JS)</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col fs-5">
						<a class="navbar-brand" href="#">공지사항</a>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col fs-5">
						<a class="navbar-brand" href="#">집단상담</a>
					</div>
				</div>
			</div>
			<div class="col-10">
				<div class="row mt-5">
					<div class="col">
						<span class="fw-bold fs-2">상담원 등록</span>
					</div>
				</div>
				
				<form action="./registerProcess" class="needs-validation was-validated" method="post" enctype="multipart/form-data">				
				<div class="row mt-5">
					<div class="col">
					
						<!-- 외부상담사아이디/비번 -->
						<div class="row mt-3">
							<!-- 아이디 -->
							<div class="col-auto">
								<div class="row">
									<div class="col">
										<label for="external_id" class="form-label">상담원아이디</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="external_id" type="text" id="external_id" class="form-control" required>
										<div class="valid-feedback">
								    		Check!
									    </div>
									    <div class="invalid-feedback">
									    	상담원아이디를 입력해주세요.
									    </div>	
									</div>																		
								</div>								
							</div>
							
							<!-- 비밀번호 -->
							<div class="col-auto">
								<div class="row">
									<div class="col">
										<label for="password" class="form-label">상담원비밀번호</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="password" type="password" id="password" class="form-control" required>
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	상담원비밀번호를 입력해주세요.
									    </div>	
									</div>
								</div>								
							</div>
						</div>
						
						<div class="row mt-3">	
							<!-- 상담원카테고리 -->
							<div class="col-auto">
								<div class="row">
									<div class="col">
										<label for="type_category_id" class="form-label">상담카테고리</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<c:forEach items="${typeCategoryList}" var="typeCategoryList">										
										<div class="form-check form-check-inline" id="type_category_id" required>
											<input name="type_category_id" class="form-check-input" type="checkbox" id="typeCategory${typeCategoryList.id}" value="${typeCategoryList.id}">
											<label class="form-check-label" for="typeCategory${typeCategoryList.id}">${typeCategoryList.name}</label>
										</div>
										</c:forEach>										
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	담당 카테고리를 선택해주세요
									    </div>	
									</div>
								</div>								
							</div>							
						</div>	
						
						<!-- 상담사 이름/나이/성별 -->
						<div class="row mt-3">
							<!-- 이름 -->
							<div class="col-auto">
								<div class="row">
									<div class="col">
										<label for="name" class="form-label">이름</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="name" type="text" id="name" class="form-control" required>
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	이름을 입력해주세요.
									    </div>
									</div>																		
								</div>								
							</div>
							
							<!-- 나이 -->
							<div class="col-auto">
								<div class="row">
									<div class="col">
										<label for="age" class="form-label">나이</label>	
									</div>									
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="age" id="age" type="number" class="form-control" min="0" required>
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	나이를 입력해주세요.
									    </div>	
									</div>															
								</div>								
							</div>
							
							<!-- 성별 -->
							<div class="col">
								<div class="row">
									<div class="col">
										<label for="gender" class="form-label">성별</label>
									</div>
								</div>
								<div class="row ">
									<div class="col">
										<input name="gender" type="radio" id="Male" class="form-check-input align-middle" value="M" checked>
										<label class="form-check-label align-middle" for="Male">남</label>
										<input name="gender" type="radio" id="Female" class="form-check-input align-middle" value="F">
										<label class="form-check-label align-middle" for="Female">여</label>
									</div>
								</div>								
							</div>
						</div>
						
						
						<!-- 상담원 전화번호/이메일 -->
						<div class="row mt-3">
							<!-- 전화번호 -->
							<div class="col-auto">
								<div class="row">
									<div class="col">
										<label for="phonenumber" class="form-label">전화번호</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="phonenumber" id="phonenumber" type="text" class="form-control" required>
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	전화번호를 입력해주세요.
									    </div>
									</div>									
								</div>								
							</div>
							
							<!-- 이메일 -->
							<div class="col">
								<div class="row">
									<div class="col">
										<label for="email" class="form-label">이메일</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="email" id="email" type="text" class="form-control" required>
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	이메일을 입력해주세요.
									    </div>
									</div>																	
								</div>
							</div>							
						</div>
						
						
						<!-- 주소 -->
						<div class="row mt-3">
							<div class="col">
								<div class="row">
									<div class="col">
										<label for="address" class="form-label">주소</label>
									</div>
								</div>
								<div class="row">
									<div class="col-6">
										<input name="address" id="address" type="text" class="form-control" required>
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	주소를 입력해주세요
									    </div>
									</div>																		
								</div>
							</div>
						</div>
						
						<!-- 경력사항 -->
						<div class="row mt-3">
							<div class="col">
								<div class="row">
									<div class="col">
										<label for="career" class="form-label">경력사항</label>
									</div>
								</div>
								<div class="row">
									<div class="col-8">
										<textarea name="career" id="career" class="form-control" rows="10" required></textarea>
										<div class="valid-feedback">
									    	Check!
									    </div>
									    <div class="invalid-feedback">
									    	경력사항을 입력해주세요.
									    </div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 증명사진 -->
						<div class="row mt-3">
							<div class="col">
								<div class="row">
									<div class="col">
										<label for="profile_Image" class="form-label">증명사진</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="profile_Image" type="file" id="profile_Image" class="form-control">
									</div>
									<!-- <div class="valid-feedback">
								    	Check!
								    </div>
								    <div class="invalid-feedback">
								    	경력사항은 필수 입력 항목입니다.
								    </div> -->									
								</div>
							</div>
						</div>
						
						<!-- 자격증 -->
						<div class="row mt-3">
							<div class="col">
								<div class="row">
									<div class="col">
										<label for="license" class="form-label">자격증</label>
									</div>
								</div>
								<div class="row">
									<div class="col-auto">
										<input name="license" accept="image/*" type="file" id="license" class="form-control" multiple>
									</div>																	
								</div>
							</div>
						</div>
						
						<div class="row mt-5">
							<div class="col">
								<div class="row">
									<div class="col-auto">
										<input type="submit" class="btn btn-primary" value="등록">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
				</form>
			</div>
		</div>
	</div>
	
	
     

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>
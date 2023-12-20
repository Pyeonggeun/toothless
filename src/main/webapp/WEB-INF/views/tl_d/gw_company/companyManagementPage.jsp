<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>기업 목록,관리 페이지</title>

<script>
	function reloadCompanyList(){
		
		const url="./getCompanyList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const companyListBox=document.getElementById("companyListBox");
			companyListBox.innerHTML="";
			
			for(e of response.data){
				const comWrapper=document.querySelector("#templete .comWrapper").cloneNode(true);
				
				const comPk=comWrapper.querySelector(".comPk");
				comPk.innerText=e.companyDto.com_pk;
				
				const comName = comWrapper.querySelector(".comName");
				comName.innerText=e.companyDto.com_name;
				comName.setAttribute("href", "./companyViewDetailsPage?com_pk="+e.companyDto.com_pk);
		        
		        
				const comManagerName=comWrapper.querySelector(".comManagerName");
				comManagerName.innerText=e.companyDto.com_pk;
				
				const isFamilyCompany=comWrapper.querySelector(".isFamilyCompany");
				isFamilyCompany.innerText=e.companyDto.is_family_company;
				
				
                comName.addEventListener("click", () => {
                    
                    window.location.href = comName.getAttribute("href");
                });
				
				companyListBox.appendChild(comWrapper);
			}
			
		});
	}
	
	//얘 하면 실행하고 뭐 안해도 바로 출력되게 하는거임!!
	window.addEventListener("DOMContentLoaded", () => {
		reloadCompanyList();
		
	});
</script>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<!-- 취업팀 상단 네비 바 -->
			<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="row">
			<!-- 취업팀 메뉴 바 -->
			<div class="col-2 border-end pb-0">
				<jsp:include page="../common/staffMenu.jsp"></jsp:include>
			</div>
			
			<div class="col">
				
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">기업 목록</div>
						<!-- 검색 -->
						<!--<form action="./companyManagementPage" method="get">
				
							<div class="row mt-4">
								<div class="col-2">
									<select name="searchType" class="form-select">
										<option value="title" ${searchType == 'title' ? 'selected' : null}>회사 명</option>
										<option value="content" ${searchType == 'content' ? 'selected' : null}>담당자 명</option>
										<option value="nickname" ${searchType == 'nickname' ? 'selected' : null}>가족기업 여부</option>
									</select>				
								</div>
								<div class="col-8">
									<input name="searchWord" type="text" class="form-control" value="${searchWord}">
								</div>
								<div class="col-2 d-grid">
									<button class="btn btn-primary">검색</button>
								</div>
							</div>
						</form>-->
						<div class="row border-bottom border-2 border-black pb-3 mb-3 mt-5">
							      <div class="col-1 text-center fw-bold">기업번호</div>
							      <div class="col text-center fw-bold">기업명</div>
							      <div class="col-3 text-center fw-bold">담당자명</div>
							      <div class="col-2 text-center fw-bold">가족기업 여부</div>
						</div>
						
						<div class="row">
							<div id="companyListBox" class="col"></div>
						</div>
						
						<div id="templete" class="d-none">
							<div class="comWrapper row border-bottom border-bs-border pb-3 mb-3">
								<div class="comPk col-1 text-center fw-bold pt-1">회사번호</div>
								<div class="comName col">회사 이름</div>
								<div class="comManagerName col-3 text-center pt-1">담당자명</div>
								<div class="isFamilyCompany col-2 text-center pt-1">가족기업 여부</div>
							</div>
						</div>
						
						<!--<c:forEach items="${companyList}" var="list">
							<div class="row border-bottom border-bs-border pb-3 mb-3">
								<div class="col-1 text-center fw-bold pt-1">${list.companyDto.com_pk}</div>
								<div class="col"><a class="btn ms-4" href="./companyViewDetailsPage?com_pk=${list.companyDto.com_pk}">${list.companyDto.com_name}</a></div>
								<div class="col-3 text-center pt-1">${list.companyManagerDto.com_manager_name}</div>
								<div class="col-3 text-center pt-1">${list.companyDto.is_family_company}</div>
							</div>
						</c:forEach> -->
						
					</div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>
		<!-- 여백용 -->
			<div class="row">
				<div class="col p-5">
				</div>
			</div>
		
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
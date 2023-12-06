<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<!-- 최상단 -->
	<jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>
	
	<!-- 기숙사관리 탭 페이지 -->
<jsp:include page="../commons/staff/topNavi2.jsp"></jsp:include>
	
	
	<!-- 내용시작 -->
	<div class="row">
		<!-- 좌측 카테고리 -->
		<jsp:include page="../commons/staff/leftCategory.jsp"></jsp:include>
		
		<!-- 우측내용 -->
		<div class="col mx-5">
			<!-- 카테고리명 -->
			<div class="row my-3">
				<div class="col fs-4 fw-bold">
					납부 관리
				</div>
			</div>
			
			<!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active text-black" href="./mj_readApplyDormInfoPage">납부 현황</a>
					  </li>
					</ul>
				</div>
			</div>

			<!-- 세부내용 시작 -->			
			<div class="row">
				<div class="col">
				
					<!-- 미니맵 -->
					<div class="row">
						<div class="col border py-4 mx-2 rounded">
							<div class="row">
								<div class="col ms-2">
									<a href="./mj_managePaymentPage" class="text-black" style="text-decoration: none;">
									전체
									</a>
								</div>
							</div>
							
							<div class="row mt-2">
								<div class="col ms-2">
									<a href="./mj_managePaymentPage" class="text-black" style="text-decoration: none;">
									<span class="fs-5 fw-bold">
										<c:set var="dormSelectedListSize" value="${fn:length(dormSelectedList)}" />
										${dormSelectedListSize}
									</span>건
									</a>
								</div>
							</div>
						</div>
						<div class="col border py-4 mx-2 rounded">
							<div class="row">
								<div class="col ms-2">
									<a href="./mj_managePaymentYesPage" class="text-black" style="text-decoration: none;">
									납부 완료
									</a>
								</div>
							</div>
							
							<div class="row mt-2">
								<div class="col ms-2">
									<a href="./mj_managePaymentYesPage" class="text-black" style="text-decoration: none;">
									<span class="fs-5 fw-bold">
										<c:set var="yesCount" value="0" />
										<c:forEach items="${dormSelectedList}" var="item">
										    <c:if test="${item.selectedDto.payment_status eq 'Y'}">
										        <c:set var="yesCount" value="${yesCount + 1}" />
										    </c:if>
										</c:forEach>
										${yesCount }
									</span>건
									</a>
								</div>
							</div>
						</div>
						<div class="col border bg-primary py-4 mx-2 rounded">
							<div class="row">
								<div class="col ms-2">
									<a href="./mj_managePaymentNoPage" class="text-white" style="text-decoration: none;">
									미납부
									</a>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col ms-2">
									<a href="./mj_managePaymentNoPage" class="text-white" style="text-decoration: none;">
									<span class="fs-5 fw-bold">
										<c:set var="noCount" value="0" />
										<c:forEach items="${dormSelectedList}" var="item">
										    <c:if test="${item.selectedDto.payment_status eq 'N'}">
										        <c:set var="noCount" value="${noCount + 1}" />
										    </c:if>
										</c:forEach>
										${noCount }
									</span>건
									</a>
								</div>
							</div>
						</div>					
						<div class="col-7"></div>
					</div>
					
					
					<!-- 상품목록 -->
					<div class="row mt-4 py-3 justify-content-between">
						<div class="col-6">
							검색결과 (총 <c:set var="noCount" value="0" />
										<c:forEach items="${dormSelectedList}" var="item">
										    <c:if test="${item.selectedDto.payment_status eq 'N'}">
										        <c:set var="noCount" value="${noCount + 1}" />
										    </c:if>
										</c:forEach>
										${noCount }개)
							<button type="button" class="ms-5 px-3 border-secondary-subtle rounded-0 px-0 fw-bold btn btn-sm btn-light">
		           				<i class="bi bi-download"></i>
		           				미납부 목록 다운로드
		           			</button>
						</div>
						<div class="col-2 me-1 justify-content-end">
							<select class="form-select mx-1 form-select-sm rounded-0" aria-label="Default select example">
							  <option selected>내림차순</option>
							  <option value="1">오름차순</option>
							</select>
						</div>
					</div>
					
					<!-- 표 -->
					<table class="table table-bordered p-0 text-center align-middle">
					  <thead>
					    <tr class="align-middle border-bottom border-2">
					      <th scope="col" class="col text-bg-light"></th>
					      <th scope="col" class="col-2 text-bg-light">학년도/학기</th>
					      <th scope="col" class="col-1 text-bg-light">이름</th>
					      <th scope="col" class="col-1 text-bg-light">학년</th>
					      <th scope="col" class="col-2 text-bg-light">학번</th>
					      <th scope="col" class="col-1 text-bg-light">학과</th>
					      <th scope="col" class="col-2 text-bg-light">주소</th>
					      <th scope="col" class="col-1 text-bg-light">우선선발</th>
					      <th scope="col" class="col-2 text-bg-light">납부여부</th>
					    </tr>
					  </thead>
					  
					  <c:forEach items="${paymentNoList }" var="item">
					  <tbody>
					    <tr>
					      <td class="p-0 pt-1 text-center">
						    <div class="form-check m-0 px-1 d-inline-block">
						        <input class="form-check-input m-0 p-0" type="checkbox" value="" id="flexCheckDefault">
						        <label class="form-check-label" for="flexCheckDefault">
						        </label>
						    </div>
						  </td>
						  <td>${thisSemesterJoinDormInfo.thisSemesterDto.semester_year }년도 
						  ${thisSemesterJoinDormInfo.thisSemesterDto.semester }</td>
						  <td>${item.studentInfo.name }</td>
						  <td>
						  	${item.studentYear }학년
						  </td>
						  <td>${item.studentInfo.student_id }</td>
						  <td>${item.departmentInfo.name }</td>
						  <td>${item.studentInfo.address }</td>
						  <td>${item.paymentNoDto.priority_select}</td>
						  <td>
						  	<c:choose>
						  		<c:when test="${item.paymentNoDto.payment_status == 'N'}">
						  			<a href="./mj_updatePaymentStatusProcess?page=3&payment_status=Y&dorm_application_pk=${item.paymentNoDto.dorm_application_pk}" class="text-black d-grid mx-2" style="text-decoration: none;">
							      		<button type="button" class="fw-bold rounded-0 btn btn-primary btn-sm mb-1">납부확인</button>
							      	</a>
						  		</c:when>
						  		<c:otherwise>
						  			<a href="#" class="text-black d-grid mx-2" style="text-decoration: none;">
							      		<button disabled type="button" class="fw-bold rounded-0 btn btn-secondary btn-sm mb-1">납부완료</button>
							      	</a>
						  		</c:otherwise>
						  	</c:choose>
						  
						  	
						  </td>
					    </tr>		    
					  </tbody>
					  </c:forEach>
					</table>
					
				</div>
			</div>
			
		</div> <!-- 우측내용 col 끝 -->
            
        
	</div> <!-- main row 끝 -->
	

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>
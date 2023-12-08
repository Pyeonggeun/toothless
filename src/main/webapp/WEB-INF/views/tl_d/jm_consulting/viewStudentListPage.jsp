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
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col">
			<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col-3">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>
				</div>
				
				<div class="col-9">
					<div class="row">
						<div class="col">
							<div class="row mt-5">
								<div class="col">
									<table class="table">
									  <thead>
									    <tr>
									      <th scope="col">신청번호</th>
									      <th scope="col">학생 이름</th>
									      <th scope="col">학번</th>
									      <th scope="col">신청 날짜</th>
									      <th scope="col">미답변 온라인상담</th>
									      <th scope="col">이동하기</th>
									    </tr>
									  </thead>
									  <tbody>
									  	<c:forEach items="${hopeJobInfoList}" var="e">
									    <tr>
									      <th scope="row">${e.hopeJobDto.hope_job_pk }</th>
									      <td>${e.studentInfoDto.name }</td>
									      <td>${e.studentInfoDto.student_id}</td>
									      <td><fmt:formatDate value="${e.hopeJobDto.created_at }" pattern="yyyy-MM-dd"/></td>
									      <td> ${e.unAnsweredHJF}건</td>
									      <td> 
									      <a  href="./viewDetailStudentInfoPage?hope_job_pk=${e.hopeJobDto.hope_job_pk}">
									    	<span style="height:50% ; width:50%;"> <button  type="button" class="btn btn-info">이동</button></span>
										
									      </a>
									      </td>
									     


									      
									    </tr>
									   
									    </c:forEach>
									 </tbody>
									</table>    							
								</div>
							</div>
						</div>
					</div>
					
					<div class="row mt-2 ps-0">
						<div class="col">
							<a href="./jmTempStaffMainPage"><button type="button" class="btn btn-primary">목록</button></a>
						</div>
					</div>						
					
				</div>
								
			</div>
		</div>
	</div>
	
</div>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
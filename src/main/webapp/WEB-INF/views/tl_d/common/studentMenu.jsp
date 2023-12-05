<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="row mt-3">
	<div class="col"></div>
</div>
<div class="row">
	<c:if test="${!empty sessionStudentInfo}">
		<div class="col ps-5 mt-2">${sessionStudentInfo.name} <span class="fs-5 fw-bold">&nbsp;님</span></div>	
	</c:if> 
</div>
<div class="row">
	<div class="col mt-3"></div>
</div>
<div class="row">
	<a class="col fs-5 fw-bold ps-3 mt-3 navbar-brand"
		href="#">마이페이지</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 navbar-brand" 
		href="#">이력서등록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 navbar-brand" 
		href="#">이력서관리</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 navbar-brand" 
		href="#">관심공고/기업</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 navbar-brand" 
		href="#">지원공고목록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 navbar-brand" 
		href="#">나의프로그램</a>
</div>
<div class="row">
	<a class="col fs-5 fw-bold ps-3 mt-3 navbar-brand"
		href="#">구직희망</a>
</div>

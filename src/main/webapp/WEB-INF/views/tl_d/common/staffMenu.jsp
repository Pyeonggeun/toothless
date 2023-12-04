<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="row mt-3">
	<div class="col"></div>
</div>
<div class="row">
	<c:if test="${!empty sessionStaffInfo}">
		<div class="col ps-5 mt-2">${sessionStaffInfo.name} <span class="fs-5 fw-bold">&nbsp;님</span></div>	
	</c:if> 
</div>
<div class="row">
	<div class="col mt-3"></div>
</div>
<div class="row">
	<a class="col fs-5 fw-bold ps-3 mt-3 text-dark link-offset-2 link-underline link-underline-opacity-0"
		href="#">공지사항</a>
</div>
<div class="row">
	<a class="col fs-5 fw-bold ps-3 mt-3 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">구직희망학생</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">학생목록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">만족도조사</a>
</div>
<div class="row">
	<a class="col ps-3 mt-3 fs-5 fw-bold text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">기업관리</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">기업목록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">채용공고등록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">채용공고목록</a>
</div>
<div class="row">
	<a class="col ps-3 mt-3 fs-5 fw-bold text-dark link-offset-2 link-underline link-underline-opacity-0"
		href="#">프로그램</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">프로그램등록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">프로그램목록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">신청학생목록</a>
</div>
<div class="row">
	<a class="col ps-4 mt-2 text-dark link-offset-2 link-underline link-underline-opacity-0" 
		href="#">만족도조사</a>
</div>

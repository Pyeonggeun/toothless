<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="row py-1 d-flex justify-content-between align-self-center" style="background-color:white">
	<div class="col-2">
		<div class="row">
			<div class="col-10">
				
			</div>
		</div>
   	</div>
   	<div class="col-4 align-self-center">
   		<div class="row">
   			<div class="col text-center border-end align-self-center">
   				<a href="#" style="text-decoration: none; color: black; font-size: 0.8em">업무 게시판</a>
    		</div>
    		<div class="col text-center border-end align-self-center">
    			<a href="#" style="text-decoration: none; color: black; font-size: 0.8em">기숙사 정보</a>
    		</div>
    		<div class="col text-center border-end align-self-center">
    			<a href="#" style="text-decoration: none; color: black; font-size: 0.8em">기숙사 관리</a>
    		</div>
    		<div class="col-4 text-center align-self-center">
				<div class="row text-center align-self-center">
					<div class="col text-center px-0 ms-4">
						<!-- 가능하면 알림 기능 -->
						<i class="fs-5 bi bi-bell"></i>
					</div>
	
					<!-- 교직원정보 -->
					<div class="col-6 fs-5 me-4 text-start align-self-center nav-item dropdown ms-auto">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					    <c:choose>
					    	<c:when test="${!empty sessionSeller }">
					    		${sessionSeller.sellerid } 
					    	</c:when>
					    	<c:otherwise>
					    		GUEST
					    	</c:otherwise>
					    </c:choose>					    
					    <span class="fs-6" style="font-size: 0.8em">님</span></a>
					
					  <ul class="dropdown-menu">
					    <li class="dropdown-item">교번 MJ19980704</li>
					    <li><hr class="dropdown-divider"></li>
					    <li><a class="dropdown-item" href="./myPage">마이페이지</a></li>
					    <li><a class="dropdown-item" href="#">어떠한</a></li>
					    <li><a class="dropdown-item" href="#">기능들?</a></li>
					    <li><hr class="dropdown-divider"></li>
						<li><a href="./logoutProcess" class="dropdown-item">로그아웃</a></li>
					  </ul>
					</div>
                    <div class="col-1"></div>
                          								
				</div>
			<!-- 원래 choose공간 -->
    		</div> 	
   		</div>
   	</div>
</div>
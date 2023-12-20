<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="row d-flex justify-content-between border-bottom align-self-center sticky-top" style="background-color:white">
	<div class="col-2 align-self-center">
		<div class="row ms-1">
            <div class="col-2 p-0">
            <a href="./mainPage" style="text-decoration: none;" class="text-black">
            <img src="../../resources/img/another/logo_black.png" alt="" class="img-fluid">
            </a>
            </div>
            <div class="col p-0 align-self-center text-black fw-bold fs-4">
            <a href="./mainPage" style="text-decoration: none;" class="text-black">
                MK<span class="fs-5">대학교</span> <span style="font-size: 0.6em;"> | </span> <span style="font-size: 0.6em;"> 평생교육원관리</span> 
            </a>
            </div>
        </div>
   	</div>
   	<div class="col-3 align-self-center">
   		<div class="row">
   			<div class="col text-center border-end align-self-center">
   				<a href="#" style="text-decoration: none; color: black; font-size: 0.8em">업무 게시판</a>
    		</div>
    		<div class="col text-center border-end align-self-center">
    			<a href="./mainPage" style="text-decoration: none; color: black; font-size: 0.8em">메인 페이지</a>
    		</div>
    		<div class="col-5 mx-2 text-center align-self-center">
				<div class="row text-center align-self-center">
					<div class="col align-self-center text-center px-0">
						<!-- 가능하면 알림 기능 -->
						<i class="fs-5 bi bi-bell"></i>
					</div>
	
					<!-- 교직원정보 -->
					<div class="col-6 fs-5 me-4 px-0 text-start align-self-center nav-item dropdown ms-auto">
						<!-- 로그인/회원가입 -->
	                   <div class="col text-end">
	                       <c:choose>
	                           <c:when test="${!empty sessionStaffInfo }">
	                           <a class="fw-bold nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                   ${sessionStaffInfo.name }<span class="fs-6" style="font-size: 0.8em">님</span></a>
	                           	 
	                           	
	                           	<ul class="dropdown-menu">
                                  <li><a class="dropdown-item" href="#">마이페이지</a></li>
                                  <li><hr class="dropdown-divider"></li>
                                  <li><a href="./logoutProcess" class="dropdown-item">로그아웃</a></li>
                                </ul>
	                           	
	                           </c:when>
	                           <c:otherwise>
		                           <a class="fw-bold text-black dropdown-toggle" role="button" href="./loginPage" style="text-decoration: none;">
				                   GUEST<span class="fs-6" style="font-size: 0.8em">님</span></a>
	                           </c:otherwise>
	                       </c:choose>
						</div>
					</div>
                    <div class="col-1"></div>
			<!-- 원래 choose공간 -->
    		</div> 	
   		</div>
   	</div>
  </div>
</div>
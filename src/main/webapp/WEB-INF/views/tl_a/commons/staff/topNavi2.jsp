<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 공고~납부 + 임원관리 -->
<div class="row mt-4 py-1 border-bottom align-self-center" style="background-color:white">
	<div class="col-2 align-self-center">
		<div class="row">
            <div class="col-2 p-0">
                <img src="../../resources/img/another/logo_black.png" alt="" class="img-fluid">
            </div>
            <div class="col p-0 align-self-center text-black fw-bold fs-3">
                MK <span class="fs-4">대학교</span> <span class="fs-6"> | </span> <span class="fs-6"> 기숙사 관리</span> 
            </div>
        </div>
   	</div>
   	<div class="col align-self-center">
   		<!-- 카테고리 -->
		<div class="row">
			<div class="col">
				<div class="row fw-bold">
					<ul class="nav">
					  <li class="nav-item mx-1">
					    <a class="nav-link active fs-5" aria-current="page" style="text-decoration: none; color: black;" 
					    href="./mj_registerJoinInfoPage">공고 관리</a>
					  </li>
					  <li class="nav-item mx-2">
					    <a class="nav-link fs-5" style="text-decoration: none; color: black;"
					    href="./mj_readApplyDormInfoPage">선발 관리</a>
					  </li>
					  <li class="nav-item mx-2">
					    <a class="nav-link fs-5" style="text-decoration: none; color: black;"
					    href="./mj_managePaymentPage">납부 관리</a>
					  </li>
					  <li class="nav-item mx-2">
					    <a class="nav-link fs-5" style="text-decoration: none; color: black;"
					    href="./dm_roomAssignment">배정 관리</a>
					  </li> 
					  <li class="nav-item mx-2">
					    <a class="nav-link fs-5" style="text-decoration: none; color: black;"
					    href="./jw_exitSituationPage">사생 관리</a>
					  </li>
					  <li class="nav-item mx-2">
					    <a class="nav-link fs-5" style="text-decoration: none; color: black;"
					    href="./jw_pointCategoryPage">상벌점 관리</a>
					  </li>
					  <li class="nav-item mx-2">
					    <a class="nav-link fs-5" style="text-decoration: none; color: black;"
					    href="./jw_executiveAssignmentPage">임원 관리</a>
					  </li>
					</ul>
				</div>
			</div>
		</div>
   	</div>
</div>
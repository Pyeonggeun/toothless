<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 최상단정보바 : 사이트 및 session 정보 -->
<div class="row py-1" style="font-size: 0.9em;">
	<div class="col me-4 text-start">
		<!-- 공백 -->
	</div>
	<div class="col ms-5 ps-5 text-center">
		<div onclick="location.href='../../woojae/staff/ajdksStaffMainPage'" class="row" style="cursor: pointer;">
			<div class="col-3 pe-2 text-end mt-2">
			    <img src="/toothless/resources/img/another/logo_black.png" alt="" style="height: 2em;">
			 </div>
			 <div class="col-9 ps-0 fw-bold fs-3 text-start align-self-center ">
			    MK University 
			 </div>
		</div>		
	</div>
	<div class="col text-end nolinenoblue pt-3">
		${sessionStaffInfo.name } 님 환영합니다 | <a href="../../taeho/staff/ajdksStaffLogoutProcess">로그아웃</a>
	</div>
</div>

<!-- 상단메뉴바 : 다른 팀으로 이동하는 메뉴-->
<div class="row py-2" style="background-color: #133369; box-shadow: 2px 2px 2px gray;">
	<div class="col text-center text-white fw-bold">
		<span class="mx-4" style="cursor: pointer;" onclick="location.href='../../../tl_c/woojae/staff/ajdksStaffMainPage'">현장실습지원센터</span>
		<span class="mx-4" style="cursor: pointer;" onclick="location.href='../../../tl_d/common/staffMainPage'">취업지원센터</span>
		<span class="mx-4" style="cursor: pointer;" onclick="location.href='../../../tl_e/commons/counselCenterStaffMainPage'">상담지원센터</span>
		<span class="mx-4" style="cursor: pointer;" onclick="location.href='../../../tl_a/staff/mj_mainPage'">생활관관리센터</span>
		<span class="mx-4" style="cursor: pointer;" onclick="location.href='../../../tl_b/common/staffMainPage'">학생보건센터</span>
		<span class="mx-4" style="cursor: pointer;" onclick="location.href='../../../tl_x/mj/mainPage'">평생교육센터</span>
	</div>
</div>
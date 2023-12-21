<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 최상단정보바 : 사이트 및 session 정보 -->
<div class="row py-1" style="font-size: 0.9em;">
	<div class="col text-start">
		MKU
	</div>
	<div class="col text-center">
		MK UNIVERSITY 사이트 로고
	</div>
	<div class="col text-end nolinenoblue">
		${sessionStaffInfo.name } 님 환영합니다 | <a href="../../taeho/staff/ajdksStaffLogoutProcess">로그아웃</a>
	</div>
</div>

<!-- 상단메뉴바 : 다른 팀으로 이동하는 메뉴-->
<div class="row py-2" style="background-color: #133369; box-shadow: 2px 2px 2px gray;">
	<div class="col text-center text-white fw-bold">
		<span class="mx-4" style="cursor: pointer;">현장실습지도관리</span>
		<span class="mx-4" style="cursor: pointer;">산학협력연구</span>
		<span class="mx-4" style="cursor: pointer;">보건센터</span>
		<span class="mx-4" style="cursor: pointer;">지도학생관리</span>
		<span class="mx-4" style="cursor: pointer;">학과홈페이지</span>
		<span class="mx-4" style="cursor: pointer;">알잘딱깔센터</span>
	</div>
</div>
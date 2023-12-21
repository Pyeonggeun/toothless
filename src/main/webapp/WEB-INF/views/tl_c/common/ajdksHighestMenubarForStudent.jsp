<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 최상단정보바 : 사이트 및 session 정보 -->
<div class="row pt-1 pb-0" style="font-size: 0.9em;">
	<div class="col text-start">
		<!-- 공백 -->
	</div>
	<div class="col text-center">
		<!-- 공백 -->
	</div>
	<div class="col text-end nolinenoblue">
		${sessionStudentInfo.name } 님 환영합니다 | <a href="../../taeho/student/ajdksStudentLogoutProcess">로그아웃</a>
	</div>
</div>

<div class="row">
	<div class="col">
		<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
	</div>
</div>

<!-- 상단메뉴바 : 다른 팀으로 이동하는 메뉴-->
<div class="row py-2 mt-2" style="background-color: #133369; box-shadow: 2px 2px 2px gray;">
	<div class="col text-center text-white fw-bold">
		<span class="mx-4" style="cursor: pointer;">현장실습지도관리</span>
		<span class="mx-4" style="cursor: pointer;">산학협력연구</span>
		<span class="mx-4" style="cursor: pointer;">보건센터</span>
		<span class="mx-4" style="cursor: pointer;">지도학생관리</span>
		<span class="mx-4" style="cursor: pointer;">학과홈페이지</span>
		<span class="mx-4" style="cursor: pointer;">알잘딱깔센터</span>
	</div>
</div>
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
<title> AJDKS TEMPLATE FOR STAFF </title>
<style>
	/*담당자좌측메뉴바설정*/
	.staffleftmenubar input {
	    display: none;
	}
	
	.staffleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.staffleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.staffleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
	    display: block;
	}	

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<!-- 최상단정보바 : 사이트 및 session 정보 -->
<div class="row py-1">
	<div class="col text-start">
		MKU
	</div>
	<div class="col text-center">
		MK UNIVERSITY 사이트 로고
	</div>
	<div class="col text-end">
		김바덕 님 환영합니다 | 로그아웃
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
		<span class="mx-4" style="cursor: pointer;">알잘딱깔센하게</span>
	</div>
</div>

<!-- 메인화면 : 좌측메뉴바 + 본문 -->
<div class="row">
<!-- 좌측메뉴바 -->
<div class="col-2 text-white px-0 staffleftmenubar" style="background-color: #0C2145; height: 125dvh; box-shadow: 2px 2px 2px gray;">

	<!-- 접속자 정보 묶음 -->
	<div class="row text-center my-3">
		<div class="col">
			<!-- 접속자 사진 -->
			<div class="row">
				<div class="col">
					<i class="bi bi-person-circle" style="font-size: 5em;"></i>
				</div>	
			</div>
			<!-- 접속자 정보 -->
			<div class="row mt-2">
				<div class="col" style="font-size: 0.9em;">
					간단한 접속자 정보
				</div>
			</div>
		</div>	
	</div>

	<!-- 검색창 -->
	<div class="row px-4 mt-4 mb-3">
		<div class="col border-bottom border-white py-1">
			<div class="row">
				<div class="col" style="font-size: 0.9em;">검색창</div>
				<div class="col text-end"><i class="bi bi-search" style="font-size: 0.9em; cursor: pointer;"></i></div>
			</div>
		</div>
	</div>
	
	<!-- 메뉴리스트 -->
	<div class="row">
		<div class="col">
			<input type="checkbox" id="title1"/>
			<label class="pt-3 pb-2 ps-3" for="title1"><i class="bi bi-pencil-square"></i>&nbsp;산업체 관리</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;산업체 등록</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;산업체 조회</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title2"/>
			<label class="pt-3 pb-2 ps-3" for="title2"><i class="bi bi-signpost-2"></i>&nbsp;현장실습과정 관리</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;현장실습과정 등록</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;현장실습과정 조회</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title3"/>
			<label class="pt-3 pb-2 ps-3" for="title3"><i class="bi bi-reception-3"></i>&nbsp;통계</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;학생 통계</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;산업체 통계</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title4"/>
			<label class="pt-3 pb-2 ps-3" for="title4"><i class="bi bi-building-exclamation"></i>&nbsp;현장실습 교육프로그램</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;교육프로그램 등록</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;교육프로그램 조회</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;이수내역 관리</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;리뷰 관리</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title5"/>
			<label class="pt-3 pb-2 ps-3" for="title5"><i class="bi bi-chat-left-quote"></i>&nbsp;커뮤니티 관리</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;공지사항 등록</span>
					</div>
				</div>
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;공지사항 수정</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='#'">&gt;&nbsp;Q&A 답변 등록</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div><!-- 좌측메뉴바 출구 -->

<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
<div class="col">
	여기가 바로 본문
</div>

</div><!-- 메인화면 출구 -->

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
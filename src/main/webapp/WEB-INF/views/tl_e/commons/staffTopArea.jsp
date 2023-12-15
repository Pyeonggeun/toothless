<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<div class="row py-2">
		<div class="col-1 pe-2 text-end">
			<img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
		</div>
		<div class="col-3 ps-0 pt-2 fw-bold fs-3 text-start ">
			MK University<span class="fs-6"> | </span> <span class="fs-5">상담센터</span> 
		</div>
		<div class="col ps-0 pt-4 text-start" style="font-size: 1.1em; font-weight: bold;">상담원 관리</div>
		<div class="col ps-0 pt-4 text-start" style="font-size: 1.1em; font-weight: bold;">집단상담</div>
		<div class="col ps-0 pt-4 text-start" style="font-size: 1.1em; font-weight: bold;">공지사항</div>
		
		<div class="col-1 pt-4 me-0 pe-0 text-end dropdown nav-item">
			<a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				<span class="fw-bold" style="font-size: 1.1em;">${sessionStaffInfo.name }</span>님
			</a>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="#">정보 수정</a></li>
				<li><a class="dropdown-item" href="#">마이페이지</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="../../another/staff/logoutProcess"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
			</ul>
		</div>
		<div class="col-1"></div>
	</div>
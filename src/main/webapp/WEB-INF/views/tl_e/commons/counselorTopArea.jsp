<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row py-2 border-bottom">
           <div class="col-4 ps-5 text-start">
               <a class="navbar-brand" href="../commons/counselCenterCounselorMainPage"><img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
               <span class="fw-bold fs-3 text-start align-middle">MK University</span><span class="fs-6t align-middle">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="fs-5 fw-bold align-middle">상담센터</span></a>
           </div>
           <div class="col-1"></div>
           <div class="col">
           	<div class="row pt-3 align-items-center">
				<div class="col pt-1 pe-4 text-end fs-5">
					<span class="fw-bold"><a class="navbar-brand" href="../offlineCounsel/offlineCounselReservationCheckPage">오프라인 상담</a></span><span class="fs-5 text-body-tertiary">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
					<span class="fw-bold"><a class="navbar-brand" href="../onlineCounsel/counselorOnlineCounselMainPage">온라인 상담</a></span><span class="fs-5 text-body-tertiary">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
					<span class="fw-bold"><a class="navbar-brand" href="">집단 상담</a></span><span class="fs-5 text-body-tertiary">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
					<span class="fw-bold"><a class="navbar-brand" href="../offlineCounsel/offlineCounselStatisticsPage">통계 자료</a></span>
				</div>
           	</div>
           </div>
		<div class="col-1 pt-3 me-4 text-center dropdown nav-item">
		  <a class="nav-link pt-2 dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		    <span class="checkSession fw-bold"></span>님
		  </a>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="#">마이페이지</a></li>
		    <li><hr class="dropdown-divider"></li>
		    <li><a class="dropdown-item" href="/toothless/another/external/logoutProcess"><span><i class="bi bi-power"></i></span>&nbsp;로그아웃</a></li>
		  </ul>
		</div>
	</div>
	
</body>
</html>
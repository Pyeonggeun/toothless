<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="row mt-3">
	<div class="col"></div>
</div>
<div class="row mt-3">
	<div class="col"></div>
</div>
<div class="row pb-3" style="background-color: #9badca;">
	<a class="col pt-3 fs-4 ms-5 text-white text-center navbar-brand" href="../common/employmentMainPage"> 
		<i class="bi bi-house-fill"></i>&nbsp;메인페이지로
	</a>
</div>
<div class="row mt-3">
	<div class="col">
		<div class="row">
			<a class="col fs-5 fw-bold ps-5 ms-5 mt-3 navbar-brand"
				href="../common/studentMyPage"><span class="border-bottom border-3 pb-2 pe-5 me-2"> 마이페이지</span></a>
		</div>
	</div>
</div>
<div class="row mt-1">
	<a class="col ps-5 mt-3 ms-5 navbar-brand"
		href="../sb_resume/resumeRegistrationPage">&nbsp;이력서등록</a>
</div>
<div class="row">
	<a class="col ps-5 mt-2 ms-5 navbar-brand" 
		href="../sb_resume/resumeManagementPage">&nbsp;이력서관리</a>
</div>
<div class="row">
	<a class="col ps-5 mt-2 ms-5 navbar-brand" 
		href="../gw_company/interestCompanyListForStudentPage">&nbsp;관심기업</a>
</div>
<div class="row">
	<a class="col ps-5 mt-2 ms-5 navbar-brand" 
		href="../ny_posting/interestPostingListForStudentPage">&nbsp;관심공고</a>
</div>
<div class="row">
	<a class="col ps-5 mt-2 ms-5 navbar-brand" 
		href="../sb_resume/postApplyListPage">&nbsp;지원공고목록</a>
</div>
<div class="row">
	<a class="col ps-5 mt-2 ms-5 navbar-brand" 
		href="../gw_program/applyProgramListForStudentPage">&nbsp;나의프로그램</a>
</div>
<%--true면 등록가능 --%>


<c:choose>
	<c:when test="${checkOverlapHopejob}">
		<div class="row mt-1">
			<a class="col fs-5 fw-bold ps-5 mt-3 ms-5 navbar-brand"
				href="../jm_consulting/applyHopeJobPage"><span class="border-bottom border-3 pb-2 pe-5 me-2"> 구직희망&nbsp;&nbsp;</span></a>
		</div>	
	</c:when>
	
	<c:otherwise>
		<div class="row mt-1">
			<a class="col fs-5 fw-bold ps-5 mt-3 ms-5 navbar-brand"
				href="../jm_consulting/hopeJobConsultingPage"><span class="border-bottom border-3 pb-2 pe-5 me-2"> 구직희망&nbsp;&nbsp;</span></a>
		</div>		
	</c:otherwise>

</c:choose>

<div class="row mt-2"> 
	<a class="col fs-5 fw-bold ps-5 ms-5 mt-3 navbar-brand"
		href="../ny_posting/jobPostingListForStudentPage"><span class="border-bottom border-3 pb-2 pe-5 me-2"> 채용공고&nbsp;&nbsp;</span></a>
</div>
<div class="row mt-2">
	<a class="col fs-5 fw-bold ps-5 ms-5 mt-3 navbar-brand"
		href="../gw_program/programListForStudentPage"><span class="border-bottom border-3 pb-2 pe-5 me-2"> 프로그램&nbsp;&nbsp;</span></a>
</div>
<div class="row mt-2">
	<div class="col fs-5 fw-bold ps-5 ms-5 mt-3 navbar-brand"><span class="border-bottom border-3 pb-2 pe-5 me-2"> 공지사항&nbsp;&nbsp;</span></div>
</div>
<div class="row mt-1">
	<a class="col ps-5 mt-3 ms-5 navbar-brand" 
		href="../hc_board/noticeMainPageForStudent">&nbsp;공지사항</a>
</div>
<div class="row">
	<a class="col ps-5 mt-2 ms-5 navbar-brand" 
		href="../hc_board/QnABoardPageForStudent">&nbsp;QnA게시판</a>
</div>
<c:choose>
	<c:when test="${empty sessionStudentInfo}">
		<div class="row mt-4">
			<a class="col ps-5 mt-2 ms-5 navbar-brand text-secondary" style="font-size : 0.8rem;"
				href="../../another/student/loginPage">&nbsp;MK대학 홈페이지<i class="ps-1 bi bi-box-arrow-up-right"></i></a>
		</div>
	</c:when>
	<c:otherwise>
		<div class="row mt-4">
			<a class="col ps-5 mt-2 ms-5 navbar-brand text-secondary" style="font-size : 0.8rem;"
				href="../../another/student/mainPage">&nbsp;MK대학 홈페이지<i class="ps-1 bi bi-box-arrow-up-right"></i></a>
		</div>
	</c:otherwise>
</c:choose>


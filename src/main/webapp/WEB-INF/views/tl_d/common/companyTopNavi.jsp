<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 인크루드 없앨까 고민중 -->
<div class="row">
	<div class="col">
		<div class="row bg-body-white border-bottom mt-4 pb-0">
			<a class="col-1 pe-2 text-end navbar-brand" href="./companyMainPage">
                <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
            </a>
            <a class="col-4 ps-0 fw-bold fs-1 text-start navbar-brand" href="./employmentMainPage">
                MK University<span class="fs-6"> | </span> <span class="fs-5">취업지원센터</span> 
            </a>
	    	<div class="col"></div>
	    	<div class="col-1 mt-5 pb-2 pe-0 text-secondary text-end">
				<%-- mainPage --%>
				<c:choose>
					<c:when test="${!empty sessionExternalInfo}">
						<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
							class="fw-bold nav-link dropdown-toggle" href="../../another/external/loginPage" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${sessionExternalInfo.external_id} 님</a>
							<ul class="dropdown-menu">
								<li><a href="../common/companyLogoutProcess"
									class="dropdown-item">로그아웃</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li style="list-style-type: none;" class="nav-item"><a href="../../another/external/loginPage"
							class="nav-link">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</div>
	    	<div class="col-1 px-0"></div>
   		</div>
   		<div class="row text-center py-2 fw-bold text-light" style="background-color: #8fc2db">
            <div class="col-2"></div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../ny_posting/jobPostingListForStudentPage">채용공고</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="./mainpage">프로그램</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../../tl_e/commons/counselCenterStudentMainPage">취업컨설팅</a>
            </div>
            <!-- 드롭다운 만들 예정 -->
            <div class="col align-self-center">
                <a class="navbar-brand" href="../../tl_a/student/jw_mainPage">게시판</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../../tl_a/student/jw_mainPage">공지사항</a>
            </div>
            <div class="col-2"></div>
        </div>
	</div>	
</div>
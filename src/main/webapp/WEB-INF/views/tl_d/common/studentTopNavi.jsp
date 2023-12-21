<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="row">
	<div class="col">
		<div class="row bg-body-white mt-4 mb-2">
			<%-- <c:choose>
				<c:when test="${empty sessionStudentInfo}">
					<a class="col-1 pe-2 text-end navbar-brand" href="../../another/student/loginPage">
                		<img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
            		</a>
            	</c:when>
            	<c:otherwise>
					<a class="col-1 pe-2 text-end navbar-brand" href="../../another/student/mainPage">
                		<img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
            		</a>
            	</c:otherwise>
            </c:choose>
            <a class="col-4 ps-0 fw-bold fs-1 text-start navbar-brand" href="../common/employmentMainPage">
                MK University<span class="fs-6"> | </span> <span class="fs-5">취업지원센터</span> 
            </a> --%>
            <div class="col">
            <jsp:include page="../../another/commons/studentNaviLogo.jsp"/>
            </div>
            
	    	<%-- <div class="col"></div>
	    	<div class="col-1 mt-5 pb-2 pe-0 text-secondary text-end">
				mainPage
				<c:choose>
					<c:when test="${!empty sessionStudentInfo}">
						<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
							class="fw-bold nav-link dropdown-toggle" href="../../another/student/loginPage" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${sessionStudentInfo.name} 님</a>
							<ul class="dropdown-menu">
								<li><a href="../common/studentMyPage"
									class="dropdown-item">마이페이지</a></li>							
								<li><a href="../common/studentLogoutProcess"
									class="dropdown-item">로그아웃</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li style="list-style-type: none;" class="nav-item"><a href="../../another/student/loginPage"
							class="nav-link">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</div> 
	    	<div class="col-1"></div> --%>
   		</div>
   		<%-- 상단부 메뉴 --%>
   		<div class="row text-center py-2 fw-bold text-light" style="background-color: #133369">
            <div class="col-2"></div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../ny_posting/jobPostingListForStudentPage">채용공고</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../gw_program/programListForStudentPage">프로그램</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../jm_consulting/hopeJobConsultingPage">취업컨설팅</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../hc_board/noticeMainPageForStudent">공지사항</a>
            </div>
            <div class="col align-self-center">
                <a class="navbar-brand" href="../hc_board/QnABoardPageForStudent">QnA게시판</a>
            </div>
            

            <div class="col-1"></div>
            <div class="col-1 align-self-center  text-end">
				
				<c:choose>
					<c:when test="${!empty sessionStudentInfo}">
						<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
							class="fw-bold nav-link dropdown-toggle" href="../../another/student/loginPage" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${sessionStudentInfo.name} 님</a>
							<ul class="dropdown-menu">
								<li><a href="../common/studentMyPage"
									class="dropdown-item">마이페이지</a></li>							
								<li><a href="../common/studentLogoutProcess"
									class="dropdown-item">로그아웃</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li style="list-style-type: none;" class="nav-item"><a href="../../another/student/loginPage"
							class="nav-link">로그인</a></li>
					</c:otherwise>
				</c:choose>
				
			</div> 
			<div class="col-1"></div>

        </div>
   		
	</div>	
</div>
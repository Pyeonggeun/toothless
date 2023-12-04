<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<div class="row">
	<div class="col">
		<div class="row bg-body-white border-bottom mt-4 pb-0">
			<div class="col-1"></div>
			<div class="col-1 pe-2 text-end">
                <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
            </div>
            <div class="col-3 ps-0 fw-bold fs-1 text-start ">
                MK University<span class="fs-6"> | </span> <span class="fs-5">취창업지원센터</span> 
            </div>
	    	<div class="col"></div>
	    	<div class="col-1 mt-5 pb-2 text-secondary text-end">
				<%-- mainPage --%>
				<c:choose>
					<c:when test="${!empty sessionStaffInfo}">
						<li style="list-style-type: none;" class="nav-item dropdown ms-auto"><a
							class="fw-bold nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
								${sessionStaffInfo.name} 님</a>
							<ul class="dropdown-menu">
								<li><a href="../buyer/buyerLogoutProcess"
									class="dropdown-item">로그아웃</a></li>
							</ul>
						</li>
					</c:when>
					<c:otherwise>
						<li style="list-style-type: none;" class="nav-item"><a href="../buyer/buyerLoginPage"
							class="nav-link">로그인</a></li>
					</c:otherwise>
				</c:choose>
			</div>
	    	<div class="col-1"></div>
   		</div>
	</div>	
</div>
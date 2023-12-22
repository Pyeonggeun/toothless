<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<div class="row py-2 my-1 d-flex justify-content-between align-self-center" style="background-color:white">
	 <div class="col-2 align-self-center">
		<div class="row">
			
            <div class="col-2 p-0">
            <a href="./mj_mainPage" style="text-decoration: none;" class="text-black">
            <img src="../../resources/img/another/logo_black.png" alt="" class="img-fluid">
            </a>
            </div>
            <div class="col p-0 align-self-center text-black fw-bold fs-3">
            <a href="./mj_mainPage" style="text-decoration: none;" class="text-black">
                MK <span class="fs-4">대학교</span> <span class="fs-6"> | </span> <span class="fs-6"> 기숙사 관리</span> 
            </a>
            </div>
        </div>
   	</div>
   	<div class="col-4 align-self-center">
   		<div class="row">
   			<div class="col">
    		</div>
    		<div class="col text-center border-end align-self-center">
    			<a href="./sj_registerDormInfo" style="text-decoration: none; color: black; font-size: 0.8em">건물 관리</a>
    		</div>
    		<div class="col text-center border-end align-self-center">
    			<a href="./mj_readApplyDormInfoPage" style="text-decoration: none; color: black; font-size: 0.8em">사생 관리</a>
    		</div>
    		<div class="col-4 text-center align-self-center">
				<div class="row text-center align-self-center">
					<div class="col text-center px-0">
						<!-- 가능하면 알림 기능 -->
						<i class="fs-5 bi bi-bell"></i>
					</div>
	
					<!-- 교직원정보 -->
					<div class="col-6 fs-5 me-4 px-0 text-start align-self-center nav-item dropdown ms-auto">
						<!-- 로그인/회원가입 -->
	                   <div class="col text-end">
	                       <c:choose>
	                           <c:when test="${!empty sessionStaffInfo }">
	                           <a class="fw-bold nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                   ${sessionStaffInfo.name }<span class="fs-6" style="font-size: 0.8em">님</span></a>
	                           	 
	                           	
	                           	<ul class="dropdown-menu">
                                  <li><button class="dropdown-item" data-bs-toggle="modal" data-bs-target="#topExampleModal">마이페이지</button></li>
                                  <li><hr class="dropdown-divider"></li>
                                  <li><a href="./logoutProcess" class="dropdown-item">로그아웃</a></li>
                                </ul>
	                           	
	                           </c:when>
	                           <c:otherwise>
		                           <a class="fw-bold text-black dropdown-toggle" role="button" href="./loginPage" style="text-decoration: none;">
				                   GUEST<span class="fs-6" style="font-size: 0.8em">님</span></a>
	                           </c:otherwise>
	                       </c:choose>
						</div>
					</div>
                    <div class="col-1"></div>
                    
                    <!-- 모달 -->
					<div class="modal fade" id="topExampleModal" tabindex="-1" aria-labelledby="topModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header" style="background-color: #E5EFF6">
									<h1 class="modal-title fs-5 fw-bold" id="topModalLabel">마이페이지</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row py-1">
										<div class="col-3 fw-bold text-center border-end">사번</div>
										<div class="col ms-2">${sessionStaffInfo.staff_id}</div>
									</div>
									<div class="row py-1">
										<div class="col-3 fw-bold text-center border-end">이름</div>
										<div class="col ms-2">${sessionStaffInfo.name}</div>
									</div>
									<div class="row py-1 ">
										<div class="col-3 fw-bold text-center border-end">전화번호</div>
										<div class="col ms-2">${sessionStaffInfo.phone}</div>
									</div>
									<div class="row py-1 ">
										<div class="col-3 fw-bold text-center border-end">이메일</div>
										<div class="col ms-2">${sessionStaffInfo.email}</div>
									</div>
								</div>
								<div class="modal-footer">
									<div class="row d-flex">
										<div class="col">
											<button type="button" class="btn btn-secondary mx-0 rounded-0 text-white fw-bold" data-bs-dismiss="modal" >닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                    
			<!-- 원래 choose공간 -->
    		</div> 	
   		</div>
   	</div>
  </div>
</div>
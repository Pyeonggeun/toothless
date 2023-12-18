<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


		<script>
		    document.addEventListener("DOMContentLoaded", function() {
		        const dropdownMenus = document.querySelectorAll('.nav-item.dropdown');
		
		        dropdownMenus.forEach(function(menu) {
		            menu.addEventListener('mouseover', function() {
		                menu.querySelector('.dropdown-menu').classList.add('show');
		            });
		
		            menu.addEventListener('mouseout', function() {
		                menu.querySelector('.dropdown-menu').classList.remove('show');
		            });
		        });
		    });
		</script>

        <div class="row sticky-top">
            <div class="col">
                <nav class="navbar navbar-expand-lg py-1" style="background-color: #ffffff">
                    <div class="container-fluid">
				            <div class="col p-0 align-self-center text-black fw-bold fs-3">
				            <a href="./jw_mainPage" style="text-decoration: none;" class="text-black align-self-center">
				            <img src="../../resources/img/another/logo_black.png" alt="" style="height: 50px; width: 50px;">
				                MK <span class="fs-4">대학교</span> <span class="fs-6"> | </span> <span class="fs-5"> 기숙사</span> 
				            </a>
			            </div>
                      <div class="col-6">
                        <div class="row fw-bold fs-5">
                            <div class="col">
                                <nav class="navbar navbar-expand-lg bg-body-white">
                                    <div class="container-fluid">
                                      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                        <span class="navbar-toggler-icon"></span>
                                      </button>
                                      <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
                                        <ul class="navbar-nav">
                                            <li class="nav-item dropdown mx-4"  style="text-align: right;">
                                                <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span class="fw-bold" style="color: #190D0F; font-size: large;">기숙사 소개</span>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item disabled">기숙사 소개</a></li>
                                                    <li><hr class="dropdown-divider"></li>  
                                                    <li><a class="dropdown-item" href="./dm_dormIntroduction">인삿말</a></li>
                                                  <li><a class="dropdown-item" href="./dm_dormOrganizationChart">조직 및 전화번호</a></li>
                                                  <li><a class="dropdown-item" href="./dm_dormSearchMap">찾아오시는 길</a></li>
                                                </ul>
                                              </li>
                                            <li class="nav-item dropdown mx-4">
                                                <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                  <span class="fw-bold" style="color: #190D0F; font-size: large;">기숙시설</span>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item disabled">기숙시설</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                  <li><a class="dropdown-item" href="./dm_dormCapacity">수용인원 현황</a></li>
                                                  <li><a class="dropdown-item" href="./dm_dormBulidingStatus">건물 현황</a></li>
                                                </ul>
                                              </li>
                                            <li class="nav-item dropdown mx-4">
                                                <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <span style="color: #190D0F; font-size: large;">모집 안내</span>
                                                </a>
                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item disabled">모집 안내</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                                  <li><a class="dropdown-item" href="./mj_dormPosted">공고 및 입주신청</a></li>
                                                  <li><a class="dropdown-item" href="./dm_dormSelectionGuide">선발 안내</a></li>
                                                  <li><a class="dropdown-item" href="./dm_streetDistribution">거리 배점표</a></li>
                                                  <li><a class="dropdown-item" href="./dm_paymentMoney">납부금 안내</a></li>
                                                  <li><a class="dropdown-item" href="./mj_announcePassPage">합격 조회</a></li>
                                                </ul>
                                            </li>
                                          
                                          <li class="nav-item dropdown mx-4">
                                            <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                <span style="color: #190D0F; font-size: large;">기숙사 커뮤니티</span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item disabled">기숙사 커뮤니티</a></li>
                                                    <li><hr class="dropdown-divider"></li>
                                              <li><a class="dropdown-item" href="./dm_dormNoticePage">공지사항</a></li>
                                              <li><a class="dropdown-item" href="./mainGaesipan">자유게시판</a></li>
                                              <li><a class="dropdown-item" href="./jw_exitApplyPage">외박 및 외출신청</a></li>
                                              <li><a class="dropdown-item" href="./jw_checkDormStudentPointPage">상벌점 확인</a></li>
                                              <li><a class="dropdown-item" href="./sj_requestRepairPage">고장수리요청</a></li>
                                              <li><a class="dropdown-item" href="./jw_diartApplyPage">일지 등록</a></li>
                                              <li><a class="dropdown-item" href="./dm_FAQ">FAQ</a></li>
                                            </ul>
                                          </li>
                                        </ul>
                                      </div>
                                    </div>
                                  </nav>
                            </div>
                        </div>
                      </div>
                      
                      <!-- 로그인/로그아웃 -->
                      <!-- 장바구니/로그인/회원가입/입점신청 -->
			           <div class="col-3">
			               <div class="row">
			                   <!-- 로그인/회원가입 -->
			                   <div class="col text-end">
			                       <c:choose>
			                           <c:when test="${!empty sessionStudentInfo }">
			                           		<div class="row justify-content-end">
		                           				<div class="col-6 align-self-center nav-item dropdown ms-auto">
			                                       <a class="fw-bold nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			                                       ${sessionStudentInfo.name }</a>
			                                   
			                                     <ul class="dropdown-menu">
			                                       <li><a class="dropdown-item" href="#">마이페이지</a></li>
			                                       <li><a class="dropdown-item" href="#">뭘 넣을까</a></li>
			                                       <li><hr class="dropdown-divider"></li>
			                                       <li><a href="./logoutProcess" class="dropdown-item">로그아웃</a></li>
			                                     </ul>
			                                   </div>
			                           			<div class="col-2 me-3">
			                           				<div class="row">
			                           					 <div class="col text-center" style="font-size: xx-large; text-align: center;"><a href="../../another/student/mainPage" role="button" class="btn-fluid bi bi-hospital" style="color: black;"></a></div>
			                           				</div>
			                           				<div class="row">
			                           					<div class="col text-center" style="font-size: small; text-align: center;">학사</div>
			                           				</div>
			                           			</div>
			                           		</div>
			                           </c:when>
			                           <c:otherwise>
			                           		<div class="row justify-content-end">
			                           			<div class="col-2">
			                           				<div class="row">
			                           					 <div class="col text-center" style="font-size: xx-large;"><a href="./loginPage" role="button" class="bi bi-person" style="color: black;"></a></div>
			                           				</div>
			                           				<div class="row">
			                           					<div class="col text-center" style="font-size: small;">로그인</div>
			                           				</div>
			                           			</div>
			                           			<div class="col-2 me-3">
			                           				<div class="row">
			                           					 <div class="col text-center" style="font-size: xx-large; text-align: center;"><a href="../../another/student/loginPage" role="button" class="btn-fluid bi bi-hospital" style="color: black;"></a></div>
			                           				</div>
			                           				<div class="row">
			                           					<div class="col text-center" style="font-size: small; text-align: center;">학사</div>
			                           				</div>
			                           			</div>
			                           		</div>
			                           </c:otherwise>
			                       </c:choose>
			                   </div>						
			               </div>                     
			           </div>	
                    </div>
                  </nav>
            </div>
            
        </div>
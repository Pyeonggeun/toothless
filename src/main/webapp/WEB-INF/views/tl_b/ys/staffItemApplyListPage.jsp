<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                             	<div class="col col-auto border-end">
									<div class="row">
								        <div class="col">
								            <div class="row">
								                <div class="col">
								                    <div class="row mt-4">
								                        <div class="col text-center" style="font-size: xx-large;">
								                            MENU
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col text-center">
								                            <i class="bi bi-person-lines-fill" style="font-size: 4em;"></i>
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col text-center">
								                            보건직원 이름 님
								                        </div>
								                    </div>
								                </div>
								            </div>
								            <div class="row mt-2">
								                <div class="col">
								                    <div class="row">
								                        <div class="col text-center" style="font-size: small;">
								                            마이페이지&nbsp;&nbsp;|&nbsp;&nbsp;로그아웃
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </div>
								    </div>
								    <div class="row mt-3">
								        <div class="col">
								            <div class="row mt-2">
								                <div class="col">
								                    <div class="row">
								                        <div class="col px-0">
								                            <p class="d-grid mb-0">
								                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
								                                    <div class="row py-2 mx-1">
								                                        <div class="col text-start">
								                                            <i class="bi bi-capsule"></i>&nbsp;&nbsp;의약품관리
								                                        </div>
								                                        <div class="col-1 me-3 text-end pe-0">
								                                            &or;
								                                        </div>
								                                    </div>
								                                </button>
								                            </p>
								                            <div class="collapse" id="collapseExample1">
								                                <div class="card card-body rounded-0 py-0 border-0">
								                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
								                                        재고관리
								                                    </a>
								                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
								                                        입고관리
								                                    </a>
								                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
								                                        코드관리
								                                    </a>
								                                </div>
								                            </div>
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col px-0">
								                            <p class="mb-0">
								                                <a class="d-grid link-underline link-underline-opacity-0" href="../hn/clinicPage">
								                               		<button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
								                                     <div class="row py-2 mx-1">
								                                         <div class="col text-start">
								                                             <i class="bi bi-ui-checks"></i>&nbsp;&nbsp;진료관리
								                                         </div>
								                                     </div>
								                                 </button>
								                                </a>
								                            </p>
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col px-0">
								                            <p class="d-grid mb-0">
								                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
								                                    <div class="row py-2 mx-1">
								                                        <div class="col text-start">
								                                            <i class="bi bi-person-exclamation"></i>&nbsp;&nbsp;요보호학생관리
								                                        </div>
								                                    </div>
								                                </button>
								                            </p>
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col px-0">
								                            <p class="d-grid mb-0">
								                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
								                                    <div class="row py-2 mx-1">
								                                        <div class="col text-start">
								                                            <i class="bi bi-box-seam"></i>&nbsp;&nbsp;물품관리
								                                        </div>
								                                        <div class="col-1 me-3 text-end pe-0">
								                                            &or;
								                                        </div>
								                                    </div>
								                                </button>
								                            </p>
								                            <div class="collapse" id="collapseExample2">
								                                <div class="card card-body rounded-0 py-0 border-0">
								                                    <a class="btn btn-transparent text-start" href="../ys/itemListAndRegistPage" style="font-size: small;">
								                                        등록
								                                    </a>
								                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
								                                        현황관리
								                                    </a>
								                                </div>
								                            </div>
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col px-0">
								                            <p class="d-grid mb-0">
								                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
								                                    <div class="row py-2 mx-1">
								                                        <div class="col text-start">
								                                            <i class="bi bi-highlighter"></i>&nbsp;&nbsp;교육프로그램관리
								                                        </div>
								                                        <div class="col-1 me-3 text-end pe-0">
								                                            &or;
								                                        </div>
								                                    </div>
								                                </button>
								                            </p>
								                            <div class="collapse" id="collapseExample3">
								                                <div class="card card-body rounded-0 py-0 border-0">
								                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
								                                        등록
								                                    </a>
								                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
								                                        조회
								                                    </a>
								                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
								                                        이수자관리
								                                    </a>
								                                </div>
								                            </div>
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col px-0">
								                            <p class="d-grid mb-0">
								                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
								                                    <div class="row py-2 mx-1">
								                                        <div class="col text-start">
								                                            <i class="bi bi-calendar-check"></i>&nbsp;&nbsp;일정관리
								                                        </div>
								                                    </div>
								                                </button>
								                            </p>
								                        </div>
								                    </div>
								                    <div class="row">
								                        <div class="col px-0">
								                            <p class="d-grid mb-0">
								                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
								                                    <div class="row py-2 mx-1">
								                                        <div class="col text-start">
								                                            <i class="bi bi-question-octagon"></i>&nbsp;&nbsp;공지사항
								                                        </div>
								                                    </div>
								                                </button>
								                            </p>
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </div>
								    </div>
								</div>
								<div class="col">
                                    <div class="row mt-5 ms-2 mx-auto">
                                        <div class="col-1 vr px-0" style="border-width:0.1em; border-style: solid; border-color: #0000FF;"></div>
                                        <div class="col-2 ps-1 fw-bold">
                                            물품대여&nbsp;현황관리   
                                        </div>  
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <div class="row ms-1">
                                            	<div class="col-1 fw-bold" style="text-align: center; font-size: small;">
                                                    <span>학번</span>
                                                </div>
                                                <div class="col-1 ps-1 fw-bold" style="text-align: center; font-size: small;">
                                                    물품번호
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center; font-size: small;">
                                                    <span>물품카테고리명</span>
                                                </div>
                                                <div class="col-1 fw-bold" style="text-align: center; font-size: small;">
                                                    <span>물품명</span>
                                                </div>
                                                <div class="col-1 fw-bold" style="text-align: center; font-size: small;">
                                                    <span>대여사유</span>
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center; font-size: small;">
                                                    <span>대여시작일</span>
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center; font-size: small;">
                                                    <span>대여반납일</span>
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center; font-size: small;">
                                                    <span>대여/반납</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col ps-4">
                                                    <hr style="border: solid 0.05em rgb(15, 15, 15);">
                                                </div>
                                            </div>
                                            <c:forEach items="${itemApplyList }" var="e">
                                            <div class="row ms-1">
                                            	<div class="col-1" style="text-align: center;">
                                                    <span>${e.STUDENT_ID }</span>
                                                </div>
                                                <div class="col-1" style="text-align: center;">
                                                    <span>${e.ITEM_PK }</span>
                                                </div>
                                                <div class="col-2" style="text-align: center;">
                                                    <span>${e.CAT_NAME }</span>
                                                </div>
                                                <div class="col-1" style="text-align: center;">
                                                    <span>${e.ITEM_NAME }</span>
                                                </div>
                                                <div class="col-1" style="text-align: center;">
                                                    <span>${e.REASON }</span>
                                                </div>
                                                <div class="col-2" style="text-align: center;">
                                                    <span><fmt:formatDate value="${e.RENTAL_DATE }" pattern="yyyy-MM-dd"/></span>
                                                </div>
                                                <div class="col-2" style="text-align: center;">
                                                    <span><fmt:formatDate value="${e.RETURN_DATE }" pattern="yyyy-MM-dd"/></span>
                                                </div>
                                                <div class="col-2" style="text-align: center;">
                                                    <c:choose>
                                                    	<c:when test="${e.STATUS eq 'N'}">
                                                    		<a href="./rentalProcess?item_apply_pk=${e.ITEM_APPLY_PK }" class="btn btn-primary">대여</a>		
                                                    	</c:when>
                                                    	<c:when test="${e.STATUS eq 'Y'}">
                                                    		<a href="./returnProcess?item_apply_pk=${e.ITEM_APPLY_PK }" class="btn btn-primary">반납</a>
                                                    	</c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col ps-4">
                                                    <hr style="border-color:black">
                                                </div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>     
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col py-4" style="background-color: #F2F2F2;">
                                <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col-1 my-auto">
                                                    <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                            </div>
                                           	<div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                                    MK University | 보건센터
                                           	</div>
                                            <div class="col text-body-tertiary" style="font-size: small;">
                                                <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                                <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
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
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-ui-checks"></i>&nbsp;&nbsp;진료관리
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
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
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
                                            물품등록    
                                        </div>  
                                    </div>
                                    <form action="./itemRegistProcess" method="post" enctype="multipart/form-data">
                                    <div class="row mt-2 ms-2 me-1 border-1" style="background-color: #DEF4F5; border-style: solid; border-color: #454545;">
                                        <div class="col">
                                            <div class="row mt-4 me-0">
                                                <div class="col-1"></div>  
                                                <div class="col-1 ps-1 pe-0 fw-bold">물품카테고리</div>
                                                <div class="col-2 ps-4">
                                                    <select name="item_cat_pk" class="form-select form-select-sm d-grid rounded-0" aria-label="Small select example" style="border-color: black;">
                                                        <option class="text-center" selected>---선택해주세요---</option>
                                                        <c:forEach items="${itemCategoryList }" var="itemCategory">
                                                        <option value="${itemCategory.item_cat_pk }">${itemCategory.name }</option>
                                                        </c:forEach>
                                                    </select> 
                                                </div>
                                                <div class="col-1 ps-3 fw-bold"><span>물품명</span></div>
                                                <div class="col-2 ps-4">
                                                    <input name="name" type="text">
                                                </div>
                                                <div class="col-1 ps-4 fw-bold"><span>수량</span></div>
                                                <div class="col-1 pe-0">
                                                    <input name="quantity" type="number" min="0">
                                                </div>
                                                <div class="col-2"></div> 
                                            </div>
                                            <div class="row mt-3 mb-3">
                                                <div class="col-1"></div>
                                                <div class="col-1 ps-1 pe-0 fw-bold">
                                                    <span>물품설명서</span>
                                                </div>
                                                <div class="col-2 ps-4 pe-5">
                                                    <textarea name="content"></textarea>
                                                </div>
                                                <div class="col-1  fw-bold">
                                                    <span>물품이미지</span>
                                                </div>
                                                <div class="col-2 ps-4">
                                                    <input type="file" name="mainImage" accept="image/*">
                                                </div>
                                                <div class="col-5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-2 mx-0">
                                        <div class="col-11"></div>
                                        <div class="col ps-5 pe-1">
                                            <input type="submit" value="등록">
                                        </div>
                                    </div>
                                    </form>
                                    <div class="row mt-5 ms-2 mx-auto">
                                        <div class="col-1 vr px-0" style="border-width:0.1em; border-style: solid; border-color: #0000FF;"></div>
                                        <div class="col-2 ps-1 fw-bold">
                                            물품목록정보   
                                        </div>  
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <div class="row ">
                                                <div class="col-2 fw-bold" style="text-align: center;">
                                                    <span>물품번호</span>
                                                </div>
                                                <div class="col-3 fw-bold" style="text-align: center;">
                                                    <span>물품카테고리</span>
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center;">
                                                    <span>물품명</span>
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center;">
                                                    <span>수량</span>
                                                </div>
                                                <div class="col-3 fw-bold" style="text-align: center;">
                                                    <span>등록일</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col ps-4">
                                                    <hr style="border: solid 0.05em rgb(15, 15, 15);">
                                                </div>
                                            </div>
                                            <c:forEach items="${itemAndCategoryList }" var="e">
                                            <div class="row">
                                                <div class="col-2" style="text-align: center;">
                                                    <span>${e.ITEM_PK }</span>
                                                </div>
                                                <div class="col-3" style="text-align: center;">
                                                    <span>${e.CAT_NAME }</span>
                                                </div>
                                                <div class="col-2" style="text-align: center;">
                                                    <a href="./itemUpdateAndDeleteDetailPage?item_pk=${e.ITEM_PK }" style="text-decoration-line: none; color: #212529;"><span>${e.ITEM_NAME }</span></a>
                                                </div>
                                                <div class="col-2" style="text-align: center;">
                                                    <span>${e.QUANTITY }</span>
                                                </div>
                                                <div class="col-3" style="text-align: center;">
                                                    <span><fmt:formatDate value="${e.CREATED_AT }" pattern="yyyy-MM-dd"/></span>
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
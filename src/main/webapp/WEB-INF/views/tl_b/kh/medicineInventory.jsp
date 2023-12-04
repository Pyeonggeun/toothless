<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="row">
                        <div class="col px-0">
                            <img class="img-fluid" src="./img/health/구름.jpg" style="height: 10vh; width: 100%; object-fit: cover; object-position: 50% 43%;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row bg-secondary" style="height: 4vh;">
                                <div class="col"></div>
                                <div class="col"></div>
                            </div>
                        </div>
                    </div>
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
                                                                    <a class="btn btn-transparent text-start" href="./medicineInventory" style="font-size: small;">
                                                                        재고관리
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="./medicineAdd" style="font-size: small;">
                                                                        입고관리
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="./codeRegistPage" style="font-size: small;">
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
                                    <!-- 내가 쓸꺼!!-->
                                    <div class="row mx-3 my-5">
                                        <div class="col">
                                            <div class="container">
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <div class="fw-bold">재고 변경 관리</div>
                                                    </div>
                                                </div>
                                                
                                                <form action="" method="get">
                                                <div class="row ">
                                                    <div class="col">
                                                    	<div class="btn-group">
														  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
														    의약품명
														  </button>
														  <ul class="dropdown-menu">
														  <c:forEach items="${medicineList}" var="e">
														    <li><a class="dropdown-item" href="./medicineInventory?medicine_code_pk=${e.medicine_code_pk}">${e.name }</a></li>
														    <input name="medicine_code_pk" type="hidden" value="${e.medicine_code_pk}">
	                                                      </c:forEach>
														  </ul>
														</div>
                                                    </div>
                                                    <div class="col">
                                                    	<div class="input-group mb-3">
														  <span class="input-group-text" id="basic-addon1">코드번호</span>
														  <input type="text" class="form-control" placeholder="코드번호" aria-label="Username" aria-describedby="basic-addon1" value="${medicine_code_pk}">
														</div>
                                                    </div>
                                                    <div class="col">
                                                    	<div class="input-group mb-3">
														  <span class="input-group-text" id="basic-addon1">변경수량</span>
														  <input name="quantity" type="number" class="form-control" placeholder="변경수량" aria-label="Username" aria-describedby="basic-addon1" min="-5" max="5">
														</div>
                                                    </div>
                                                    <div class="col">
                                                    <select name="medicine_mgmt_cat_pk" class="form-select" aria-label="Default select example">
													<option selected>재고 관리</option>
														<c:forEach items="${MedicineMgmtCatDtoList}" var="e">
															<option value="${e.medicine_mgmt_cat_pk}">${e.name}</option>
														</c:forEach>
													</select>
                                                    </div>
                                                    <div class="col">
                                                    	<div class="input-group mb-3">
														  <span class="input-group-text" id="basic-addon1">비고</span>
														  <input name="reason" type="text" class="form-control" placeholder="비고" aria-label="Username" aria-describedby="basic-addon1" value="">
														</div>
                                                    </div>
                                                    <div class="col">
                                                    	<button type="submit" class="btn btn-secondary">수정하기</button>
                                                    </div>
                                                </div>
                                                </form>
                                                
                                                <div class="row">
                                                    <div class="col-11"></div>
                                                    <div class="col-1 text-end">
                                                        <div class="btn-group">
														  <button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
														    정렬
														  </button>
														  <ul class="dropdown-menu">
														    <li><a class="dropdown-item" href="#">코드번호</a></li>
														    <li><a class="dropdown-item" href="#">의약품명</a></li>
														    <li><a class="dropdown-item" href="#">약품카테고리</a></li>
														    <li><a class="dropdown-item" href="#">회사</a></li>
														    <li><a class="dropdown-item" href="#">효능</a></li>
														    <li><a class="dropdown-item" href="#">주의사항</a></li>
														    <li><a class="dropdown-item" href="#">등록일(최신순)</a></li>
														    <li><a class="dropdown-item" href="#">등록일(오래된순)</a></li>
														  </ul>
														</div>
                                                    </div>
                                                </div>
                                                <div class="row my-3">
                                                    <div class="col">
                                                        <table class="table table-hover">
                                                            <thead>
                                                              <tr>
                                                                <th scope="col">약품코드</th>
                                                                <th scope="col">의약품명</th>
                                                                <th scope="col">변동수량</th>
                                                                <th scope="col">현재수량</th>
                                                                <th scope="col">변경사유</th>
                                                                <th scope="col">비고</th>
                                                                <th scope="col">재고관리자</th>
                                                                <th scope="col">재고 변경일</th>
                                                              </tr>
                                                            </thead>
                                                            <tbody>
                                                            
                                                            <c:forEach items="${inventoryList}" var="e">
                                                              <tr>
                                                                <td>안연고</td>
                                                                <td>1개(변경)</td>
                                                                <td>폐기</td>
                                                                <td>망실</td>
                                                                <td>조정</td>
                                                                <td>사유</td>
                                                                <td>재고관리자</td>
                                                                <td>최근 변경일</td>
                                                              </tr>
                                                             </c:forEach>
                                                              
                                                            </tbody>
                                                          </table>
                                                    </div>
                                                </div>
                                            </div>

                                    <!-- 내가 쓸꺼!!-->
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
                                                <div class="col-4 my-auto">
                                                    <img class="img-fluid" src="./img/health/health_ci.gif">
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
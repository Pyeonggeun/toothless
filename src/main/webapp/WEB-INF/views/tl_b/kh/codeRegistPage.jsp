<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <style>
        .customColor {
            border-radius: 0%;
            color: white;
            background-color: #014195;
        }
   		</style>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                            	<jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                    <!-- 내가 쓸꺼!!-->
                                    <div class="row mx-3 my-5">
                                        <div class="col">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="fw-bold">의약품 현황</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-11"></div>
                                                    <div class="col-1 text-end">
                                                    	<div class="btn-group">
														  <button class="btn btn-sm btn-primary customColor dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
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
                                                                <th scope="col">코드번호</th>
                                                                <th scope="col">의약품명</th>
                                                                <th scope="col">약품 종류</th>
                                                                <th scope="col">회사</th>
                                                                <th scope="col">효능</th>
                                                                <th scope="col">주의사항</th>
                                                                <th scope="col">등록일</th>
                                                                <th scope="col">삭제</th>
                                                              </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${MedicineList}" var="e">
                                                              <tr>
                                                                <td>${e.medicineInfo.medicine_code_pk}</td>
                                                                <td>${e.medicineInfo.name}</td>
                                                                <td>${e.medicineCatInfo.name}</td>
                                                                <td>${e.medicineInfo.company}</td>
                                                                <td>${e.medicineInfo.efficacy}</td>
                                                                <td>${e.medicineInfo.precaution}</td>
                                                                <td><fmt:formatDate value="${e.medicineInfo.created_at}" pattern="yyyy-MM-dd"/></td>
                                                                <td>
																	<a href="./codeDeleteProcess?medicine_code_pk=${e.medicineInfo.medicine_code_pk }"><i class="bi bi-x-square text-danger"></i></a>
                                                                </td>
                                                                
                                                              </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                          </table>
                                                    </div>
                                                </div>
                                                
                                                <%-- 약품등록 라인 --%>
                                                
                                                <div class="row">
                                                	<form action="./codeRegistProcess" method="get">
                                                    <div class="col">
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">코드번호</span>
                                                                    <input name="medicine_code_pk" type="text" class="form-control rounded-0">
                                                                 </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text btn-primary customColor" id="basic-addon1">의약품명</span>
                                                                    <input name="name" type="text" class="form-control rounded-0">
                                                                  </div>
                                                            </div>
                                                            <div class="col-4 d-grid">
                                                                <button class="btn btn-primary customColor" type="submit">등록하기</button>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <select name="medicine_cat_pk" class="form-select rounded-0" aria-label="Default select example">
                                                                	<%-- 이부분은 임시.. 귀찮아서 일단 번호로 해버림 --%>
                                                                    <option selected>약품 카테고리</option>
                                                                    <option value="1">알러지</option>
                                                                    <option value="2">외상</option>
                                                                    <option value="3">소화기</option>
                                                                    <option value="4">호흡기</option>
                                                                    <option value="5">일반</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">회사</span>
                                                                    <input name="company" type="text" class="form-control rounded-0" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">효능</span>
                                                                    <input name="efficacy" type="text" class="form-control rounded-0" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">주의사항</span>
                                                                    <input name="precaution" type="text" class="form-control rounded-0"  placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                        </div>
                                                    
                                                    </div>
                                                	</form>    
                                                </div>
                                                
                                                <%-- 약품  --%>
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
        <script>
	        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
        </script>
    </body>
</html>
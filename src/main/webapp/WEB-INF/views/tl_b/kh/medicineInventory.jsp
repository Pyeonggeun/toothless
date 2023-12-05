<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                                <div class="row mb-3">
                                                    <div class="col">
                                                        <div class="fw-bold">재고 변경 관리</div>
                                                    </div>
                                                </div>
                                                
                                                <form action="./inventoryModifyProcess" method="get">
                                                <div class="row ">
                                                    <div class="col">
                                                    	<div class="btn-group">
														  <button class="btn btn-secondary dropdown-toggle customColor" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
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
														  <span class="input-group-text customColor" id="basic-addon1">코드번호</span>
														  <input type="text" class="form-control rounded-0" placeholder="코드번호" aria-label="Username" aria-describedby="basic-addon1" value="${medicine_code_pk}">
														</div>
                                                    </div>
                                                    <div class="col">
                                                    	<div class="input-group mb-3">
														  <span class="input-group-text customColor" id="basic-addon1">변경수량</span>
														  <input name="quantity" type="number" class="form-control rounded-0" placeholder="변경수량" aria-label="Username" aria-describedby="basic-addon1" min="-5" max="5">
														</div>
                                                    </div>
                                                    <div class="col">
                                                    <select name="medicine_mgmt_cat_pk" class="form-select rounded-0" aria-label="Default select example">
													<option selected>재고 관리</option>
														<c:forEach items="${MedicineMgmtCatDtoList}" var="e">
															<option value="${e.medicine_mgmt_cat_pk}">${e.name}</option>
														</c:forEach>
													</select>
                                                    </div>
                                                    <div class="col">
                                                    	<div class="input-group mb-3">
														  <span class="input-group-text customColor" id="basic-addon1">비고</span>
														  <input name="reason" type="text" class="form-control rounded-0" placeholder="비고" aria-label="Username" aria-describedby="basic-addon1" value="">
														</div>
                                                    </div>
                                                    <div class="col">
                                                    	<button type="submit" class="btn btn-secondary customColor">수정하기</button>
                                                    </div>
                                                </div>
                                                </form>
                                                
                                                <div class="row">
                                                    <div class="col-11"></div>
                                                    <div class="col-1 text-end">
                                                        <div class="btn-group">
														  <button class="btn btn-sm btn-secondary dropdown-toggle customColor" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
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
                                                                <th scope="col">변동사유</th>
                                                                <th scope="col">변동수량</th>
																
																<c:choose>                                                                
                                                                <c:when test="${medicine_code_pk == null }">
                                                            	</c:when>
                                                            	<c:otherwise>
                                                            		<th scope="col">현재수량</th>
                                                            	</c:otherwise>
                                                            	</c:choose>
                                                                <th scope="col">재고관리자</th>
                                                                <th scope="col">재고 변경일</th>
                                                              </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:choose>
                                                            	<c:when test="${medicine_code_pk == null }">
                                                            		<c:forEach items="${inventoryStatisticsList}" var="e">
		                                                              <tr>
		                                                                <td>${e.MEDICINE_CODE_PK}</td>
		                                                                <td>${e.MEDI_NAME}</td>
		                                                                <td>${e.M_TYPE}</td>
		                                                                <c:choose>
		                                                                	<c:when test="${e.M_TYPE eq '처방'}">
		                                                        	            <td>${-e.QUANTITY}</td>
		                                                                	</c:when>
		                                                                	<c:otherwise>
		                                                                		<td>${e.QUANTITY}</td>
		                                                                	</c:otherwise>
		                                                                </c:choose>
		                                                                <td>${e.M_NAME}</td>
		                                                                <td><fmt:formatDate value="${e.DATE}"/> </td>
		                                                              </tr>
		                                                             </c:forEach>
                                                            	</c:when>
	                                                            <c:otherwise>
    																<c:forEach items="${inventoryMedicineStatisticsList}" var="e">
		                                                              <tr>
		                                                                <td>${e.MEDICINE_CODE_PK}</td>
		                                                                <td>${e.MEDI_NAME}</td>
		                                                                <td>${e.M_TYPE}</td>
		                                                                <c:choose>
		                                                                	<c:when test="${e.M_TYPE eq '처방'}">
		                                                        	            <td>${-e.QUANTITY}</td>
		                                                                	</c:when>
		                                                                	<c:otherwise>
		                                                                		<td>${e.QUANTITY}</td>
		                                                                	</c:otherwise>
		                                                                </c:choose>
		                                                                <td>${e.sum }</td>
		                                                                <td>${e.M_NAME}</td>
		                                                                <td><fmt:formatDate value="${e.DATE}"/> </td>
		                                                              </tr>
		                                                             </c:forEach>
    	                                                        </c:otherwise>
	                                                            
                                                            </c:choose>
                                                            
                                                             
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
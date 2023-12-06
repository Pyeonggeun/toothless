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
       	<style>
		    .custom-popover {
		        white-space: pre-line;
		    }
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
                                                        <div class="fw-bold">입고 관리</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-7">
                                                        <div class="row">
                                                            <div class="col text-end">
                                                            
                                                                <a href="" class="btn-sm btn btn-outline-primary rounded-0">최신순</a>
                                                                <a href="" class="btn-sm btn btn-outline-primary rounded-0">오래된순</a>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                  <tr>
                                                                    <th scope="col">입고번호</th>
                                                                    <th scope="col">의약품이름</th>
                                                                    <th scope="col">수량</th>
                                                                    <th scope="col">입고자</th>
                                                                    <th scope="col">입고일</th>
                                                                    <th scope="col"></th>
                                                                  </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${addInfoAndMedicineInfoList }" var="e">
                                                                  <tr>
                                                                    <td>${e.addInfo.medicine_add_pk }</td>
                                                                    <td>${e.medicineInfo.name }</td>
                                                                    <td>${e.addInfo.quantity }</td>
                                                                    <td>${e.staffInfo.name }</td>
                                                                    <td><fmt:formatDate value="${e.addInfo.add_at }" pattern="yyyy-MM-dd"/></td>
                                                                    <td><button type="button" class="btn btn-outline-info btn-sm rounded-0"
																	    data-bs-toggle="popover" data-bs-placement="right"
																	    data-bs-custom-class="text-center custom-popover"
																	    data-bs-title="제품 정보"
																	    data-bs-content="약품명 : ${e.medicineInfo.name }
																	    				약품효능 : ${e.medicineInfo.efficacy}
																	    				제조사 : ${e.medicineInfo.company }
																	    				주의사항 : ${e.medicineInfo.precaution }">
																	    상세보기
																	    </button>
																	</td>
                                                                  </tr>
                                                                </c:forEach>  
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-1"></div>
                                                    
                                                    <div class="col-4">
                                                    	<form action="./medicineAddProcess" method="get">
                                                        <div class="row mt-5">
                                                            <div class="col">
                                                                <select name="medicine_code_pk" class="form-select rounded-0" aria-label="Default select example">
                                                                    <option selected>의약품선택</option>
                                                                    <c:forEach items="${medicineInfo }" var="e">
                                                                    	<option value="${e.medicine_code_pk }">${e.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3">
                                                            <div class="col">
                                                                수량 : <input class="rounded-0 form-control" name="quantity" type="number" min="1" max="5">
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3">
                                                            <div class="col">
                                                                입고일 : <input class="rounded-0 form-control" name="add_at" type="date">
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3">
                                                            <div class="col d-grid">
                                                            	<button class="btn btn-secondary customColor" type="submit">입고하기</button>
                                                            </div>
                                                        </div>
                                                   		</form>
                                                    </div>
                                                </div>
                                                <div class="row my-3">
                                                    <div class="col">
                                                        
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
        <script>
	    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	    </script>
    </body>
</html>
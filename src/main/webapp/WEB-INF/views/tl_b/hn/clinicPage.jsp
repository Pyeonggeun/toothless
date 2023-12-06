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

        <script>
            
            function showAddClinicPatientModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#addNewClinicPatient");
                modal.show();
            }

            function showWriteClinicPatientLogModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#writeClinicPatientLog");
                modal.show();
            }

            function showDetailClinicPatientLogModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#detailClinicPatientLog");
                modal.show();
            }

        </script>

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
                                                                <button class="btn btn-transparent rounded-0 fw-bold text-white" style="font-size: small; background-color: #014195;" type="button">
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
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2 pt-4 px-4 border-end">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 1.1em;">
                                                            환자 리스트
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="input-group mb-3">
                                                                <input type="text" class="form-control border-0 border-bottom pb-0" placeholder="이름 / 생년월일을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" style="font-size: 0.7em;">
                                                                <button class="btn btn-transparent rounded-0 border-bottom pb-0" type="button" id="button-addon2">
                                                                    <i class="bi bi-search" style="font-size: 0.8em;"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="row mb-2">
                                                                <div class="col-1 d-grid justify-content-center">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input rounded-0" type="checkbox" value="" style="font-size: 0.7em;">
                                                                    </div>
                                                                </div>
                                                                <div class="col-2 fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    번호
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    이름
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    생년월일
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    등급
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                            	<div class="col">
                                                            		<!-- 환자리스트 clinicPatientWrapper -->
                                                            	</div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row mt-1">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col d-grid justify-content-end">
                                                                    <button class="btn text-white rounded-0 py-1" style="background-color: #014195; font-size: 0.7em;">대기 추가</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col d-grid justify-content-center">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination mb-0">
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black" href="#" aria-label="Previous">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">1</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">2</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">3</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">4</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">5</a></li>
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black" href="#" aria-label="Next">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3 pt-4 px-4 border-end">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 1.1em;">
                                                            대기자 리스트
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col d-grid justify-content-end">
                                                                    <button onclick="showAddClinicPatientModal()" class="btn btn-transparent rounded-0 pb-0" style="color: #014195; font-size: 0.75em;">+신규환자 추가+</button>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <hr class="mt-1 mb-2 border-secondary">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="row mb-3">
                                                                <div class="col-2 fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    번호
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    이름
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    생년월일
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    등급
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    기능
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                            	<div class="col">
                                                            		<!-- 대기자리스트 waitingClinicPatientWrapper -->
                                                            	</div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col d-grid justify-content-center">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination mb-0">
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black" href="#" aria-label="Previous">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">1</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">2</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">3</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">4</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">5</a></li>
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black" href="#" aria-label="Next">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col pt-4 px-4 border-end">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
                                                                            환자정보
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <hr class="border-secondary mb-1 mt-2">
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col px-4" style="font-size: 0.8em;">
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            이름
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            <!-- 류하나 -->
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            주민번호
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            <!-- 010204-4321321 -->
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            나이
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            <!-- 23 -->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div>
                                                                                <hr class="border-secondary mb-1 mt-2">
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col px-4" style="font-size: 0.8em;">
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            주소
                                                                                        </div>
                                                                                        <div class="col-6">
                                                                                            <!-- 서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층 -->
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            전화번호
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            <!-- 010-4420-2106 -->
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div>
                                                                                <hr class="border-secondary mb-1 mt-2">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col fw-bold my-auto" style="font-size: 1.1em;">
                                                                            진료내역
                                                                        </div>
                                                                        <div class="col d-grid justify-content-end">
                                                                            <button onclick="showWriteClinicPatientLogModal()" class="btn text-white rounded-0" style="font-size: 0.8em; background-color: #014195;">진료보기</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mb-4 mt-2">
                                                                        <div class="col overflow-auto" style="height: 33em; background-image: url(./img/health/cutebaduck.gi); background-repeat: no-repeat; background-size: contain; background-position: center;">
                                                                            
                                                                            <!-- 진료내역 clinicPatientLogWrapper -->

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
                                                <div class="col text-body-tertiary my-auto" style="font-size: small;">
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
        
        <div id="templete" class="d-none">
        
        	<div class="clinicPatientWrapper row">
	            <div class="col-1 d-grid justify-content-center">
	                <div class="form-check">
	                    <input class="form-check-input rounded-0" type="checkbox" value="" style="font-size: 0.7em;">
	                </div>
	            </div>
	            <div class="col-2 mx-auto px-0 text-center" style="font-size: 0.7em;">
	                123
	            </div>
	            <div class="col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                김수한무
	            </div>
	            <div class="col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                01.02.04
	            </div>
	            <div class="col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                외부인
	            </div>
	        </div>
	        
	        <div class="waitingClinicPatientWrapper row mt-2">
	            <div class="col-2 mx-auto px-0 text-center" style="font-size: 0.7em;">
	                123
	            </div>
	            <div class="col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                김수한무
	            </div>
	            <div class="col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                01.02.04
	            </div>
	            <div class="col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                외부인
	            </div>
	            <div class="col mx-auto px-0 d-grid justify-content-center">
	                <button class="btn text-white rounded-0 py-0 px-2" style="background-color: #014195; font-size: 0.65em;">호출</button>
	            </div>
	        </div>
	        
	        <div class="clinicPatientLogWrapper row mt-3">
	            <div class="col">
	                <div class="row">
	                    <div class="col fw-bold my-auto" style="font-size: 0.8em;">
	                        2023.12.05
	                    </div>
	                    <div class="col text-end my-auto" style="font-size: 0.75em;">
	                        교직원
	                    </div>
	                </div>
	                <div class="row mt-2">
	                    <div class="col my-auto" style="font-size: 0.85em;">10527 질병명</div>
	                    <div class="col my-auto d-grid justify-content-end">
	                        <button class="btn rounded-0 py-0" style="font-size: 0.8em; border-color: #014195;">상세보기</button>
	                    </div>
	                </div>
	                <div>
	                    <hr class="border-secondary">
	                </div>
	            </div>
	        </div>
	        
        </div>
        
        <div id="addNewClinicPatient" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content rounded-0">
                    <div class="modal-header py-2 rounded-0" style="background-color: #014195;">
                        <span class="modal-title fw-bold text-white" style="font-size: 1.1em;">신규환자 등록</span>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.9em;"></button>
                    </div>
                    <div class="modal-body pt-4 pb-1">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        주민번호
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group">
                                            <input type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                            <span class="my-auto">&nbsp;-&nbsp;</span>
                                            <input type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                        </div>
                                    </div>
                                    <div class="col text-success my-auto" style="font-size: 0.7em;">
                                        ※ 외부인
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        이름
                                    </div>
                                    <div class="col-4">
                                        <input type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        생년월일
                                    </div> 
                                    <div class="col-3">
                                        <input type="date" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        전화번호
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group">
                                            <input type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                            <span class="my-auto">&nbsp;-&nbsp;</span>
                                            <input type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                            <span class="my-auto">&nbsp;-&nbsp;</span>
                                            <input type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        주소
                                    </div>
                                    <div class="col">
                                        <input type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer py-2 border-0">
                        <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal" style="font-size: 0.8em;">취소</button>
                        <button type="button" class="btn rounded-0  text-white" style="font-size: 0.8em; background-color: #014195;">등록하기</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="writeClinicPatientLog" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content rounded-0">
                    <div class="modal-header py-2 rounded-0" style="background-color: #014195;">
                        <span class="modal-title fw-bold text-white" style="font-size: 1.1em;">진료 등록</span>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.9em;"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                질병사유
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-2">
                                            <div class="col">
                                                <input class="form-control rounded-0" list="datalistOptions" id="exampleDataList" placeholder="질병사유를 입력해주세요" style="font-size: 0.7em;">
                                                <datalist id="datalistOptions">
                                                    <option value="10000 알레르기"></option>
                                                    <option value="10001 복통약"></option>
                                                    <option value="10005 냥"></option>
                                                    <option value="20156 묭"></option>
                                                    <option value="54321 쀼쀼"></option>
                                                </datalist>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                진료내용
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col">
                                                <textarea class="form-control rounded-0" rows="10" style="font-size: 0.8em;"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                처방의약품
                                            </div>
                                            <div class="col d-grid justify-content-end">
                                                <button class="text-danger btn btn-transparent py-0" style="font-size: 1.1em;">+</button>
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-2">
                                            <div class="col">
                                                <input class="form-control rounded-0" list="datalistOptions" id="exampleDataList" placeholder="처방할 의약품을 입력해주세요" style="font-size: 0.7em;">
                                                <datalist id="datalistOptions">
                                                    <option value="10000 알레르기"></option>
                                                    <option value="10001 복통약"></option>
                                                    <option value="10005 냥"></option>
                                                    <option value="20156 묭"></option>
                                                    <option value="54321 쀼쀼"></option>
                                                </datalist>
                                            </div>
                                            <div class="col-1">
                                                <input type="number" class="form-control rounded-0" style="font-size: 0.7em;" value="1" min="1">
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer py-2 border-0">
                        <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal" style="font-size: 0.8em;">취소</button>
                        <button type="button" class="btn rounded-0  text-white" style="font-size: 0.8em; background-color: #014195;">등록하기</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="detailClinicPatientLog" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content rounded-0">
                    <div class="modal-header py-2 rounded-0" style="background-color: #014195;">
                        <span class="modal-title fw-bold text-white" style="font-size: 1.1em;">상세내역</span>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.9em;"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                질병사유
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-2">
                                            <div class="col" style="font-size: 0.8em;">
                                                10532 복통
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                진료내용
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col" style="font-size: 0.8em;">
                                                <p class="my-0">안녕하세요</p>
                                                <p class="my-0">진료내용입니다</p>
                                                <p class="my-0">나중에는 p 태그 없애버릴거에요</p>
                                                <p class="my-0">배가 너무 고픈데 칸쵸먹고 싶은데 밥 먹기 20분이라 먹지못해 슬프다..</p>
                                                <p class="my-0">꼬르륵거리는데 꼬르륵소리 좀 안났으면 좋겠다</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                처방의약품
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-2">
                                            <div class="col" style="font-size: 0.8em;">
                                                54321 쀼쀼
                                            </div>
                                            <div class="col-1" style="font-size: 0.8em;">
                                                1
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer py-1 border-0">
                        <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal" style="font-size: 0.8em;">닫기</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
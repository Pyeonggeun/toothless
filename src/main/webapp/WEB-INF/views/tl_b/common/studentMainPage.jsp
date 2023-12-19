<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <!-- jsp:includ -->
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col px-0">
                                    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                                        <div class="carousel-indicators">
                                            <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                            <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                            <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                        </div>
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="../../resources/img/healthRoom/carousel3.jpg" class="d-block w-100 img-fluid" style="height: 40vh; object-fit: cover; object-position: 50% 79%;">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="../../resources/img/healthRoom/carousel2.jpg" class="d-block w-100 img-fluid" style="height: 40vh; object-fit: cover; object-position: 50% 75%;">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="../../resources/img/healthRoom/carousel1.jpg" class="d-block w-100 img-fluid" style="height: 40vh; object-fit: cover; object-position: 50% 65%;">
                                            </div>
                                        </div>
                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Previous</span>
                                        </button>
                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="visually-hidden">Next</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4 mb-5" style="margin-left: 16%; margin-right: 16%;">
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col pe-0 d-grid justify-content-center">
                                            <button class="rounded-circle btn text-white" style="aspect-ratio: 1/1; width: 130%; background-color: #014195;"
                                            onclick="location.href='../ty/studentBoardPage'">
                                                <div class="row">
                                                    <div class="col">
                                                        <i class="bi bi-bell" style="font-size: x-large;"></i>
                                                    </div>
                                                </div>
                                                <div class="row mt-1">
                                                    <div class="col">
                                                        공지사항
                                                    </div>
                                                </div>
                                            </button>
                                        </div>
                                        <div class="col pe-0 d-grid justify-content-center">
                                            <button class="rounded-circle btn text-white" style="aspect-ratio: 1/1; width: 130%; background-color: #014195;">
                                                <div class="row">
                                                    <div class="col">
                                                        <i class="bi bi-alarm" style="font-size: x-large;"></i>
                                                    </div>
                                                </div>
                                                <div class="row mt-1">
                                                    <div class="col">
                                                        진료안내
                                                    </div>
                                                </div>
                                            </button>
                                        </div>
                                        <div class="col px-0 d-grid justify-content-center">
                                            <button class="rounded-circle btn text-white" style="aspect-ratio: 1/1; width: 130%; background-color: #014195;">
                                                <div class="row">
                                                    <div class="col">
                                                        <i class="bi bi-card-checklist" style="font-size: x-large;"></i>
                                                    </div>
                                                </div>
                                                <div class="row mt-1">
                                                    <div class="col">
                                                        진료신청
                                                    </div>
                                                </div>
                                            </button>
                                        </div>
                                        <div class="col px-0 d-grid justify-content-center">
                                            <a class="link-underline link-underline-opacity-0" href="../ys/studentItemApplyInformationPage">
                                            	<button class="rounded-circle btn text-white" style="aspect-ratio: 1/1; width: 130%; background-color: #014195;">
	                                                <div class="row">
	                                                    <div class="col">
	                                                        <i class="bi bi-prescription2" style="font-size: x-large;"></i>
	                                                    </div>
	                                                </div>
	                                                <div class="row mt-1">
	                                                    <div class="col">
	                                                        물품신청
	                                                    </div>
	                                                </div>
	                                            </button>
                                            </a>
                                        </div>
                                        <div class="col px-0 d-grid justify-content-center">
                                            <button class="rounded-circle btn text-white" style="aspect-ratio: 1/1; width: 130%; background-color: #014195;"
                                            onclick="location.href='../hs/eduMainPageForStudent'">
                                                <div class="row">
                                                    <div class="col">
                                                        <i class="bi bi-pencil-square" style="font-size: x-large;"></i>
                                                    </div>
                                                </div>
                                                <div class="row mt-1">
                                                    <div class="col">
                                                        교육신청
                                                    </div>
                                                </div>
                                            </button>
                                        </div>
                                        <div class="col ps-0 d-grid justify-content-center">
                                            <button class="rounded-circle btn text-white" style="aspect-ratio: 1/1; width: 130%; background-color: #014195;">
                                                <div class="row">
                                                    <div class="col">
                                                        <i class="bi bi-pin-map" style="font-size: x-large;"></i>
                                                    </div>
                                                </div>
                                                <div class="row mt-1">
                                                    <div class="col">
                                                        오시는길
                                                    </div>
                                                </div>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mx-4 mt-5">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-5">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row pb-2">
                                                                <div class="col ps-1 my-auto fw-bold" style="font-size: large;">
                                                                    공지사항
                                                                </div>
                                                                <div class="col pe-1 text-danger text-end" style="font-size: large;">
                                                                    +
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col px-0">
                                                            <table class="table table-borderless">
                                                                <thead style="font-size: small;">
                                                                    <tr>
                                                                        <th scope="col" class="col-9 py-0"></th>
                                                                        <th scope="col" class="py-0"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody style="font-size: small;">
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(1월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(12월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(11월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(11월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(11월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row pb-2">
                                                                <div class="col ps-1 my-auto fw-bold" style="font-size: large;">
                                                                    건의사항
                                                                </div>
                                                                <div class="col pe-1 text-danger text-end" style="font-size: large;">
                                                                    +
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col px-0">
                                                            <table class="table table-borderless">
                                                                <thead style="font-size: small;">
                                                                    <tr>
                                                                        <th scope="col" class="col-9 py-0"></th>
                                                                        <th scope="col" class="py-0"></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody style="font-size: small;">
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(1월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(12월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(11월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="pt-0 pb-1 text-secondary">대학보건소 운영 안내(11월)</td>
                                                                        <td class="pt-0 pb-1 text-end">2020-01-85</td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col mx-4 px-4">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row pb-2">
                                                        <div class="col my-auto fw-bold text-center" style="font-size: large;">
                                                            보건실 일정
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col px-0">
                                                    <img class="img-fluid" src="../../resources/img/healthRoom/2023-11 cal.jpg">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="row mt-5">
                                                <div class="col py-4 px-3 rounded" style="background-color: #F2F2F2;">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col fw-bold">
                                                                    진료시간
                                                                </div>
                                                            </div>
                                                            <div class="row mt-2">
                                                                <div class="col text-body-tertiary" style="font-size: small;">
                                                                    <p class="my-0">월~금요일 : 09:00~18:00</p>
                                                                    <p class="my-0">(점심시간 : 12:00~13:00)</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col fw-bold">
                                                                    아무개 정보
                                                                </div>
                                                            </div>
                                                            <div class="row mt-2">
                                                                <div class="col text-body-tertiary" style="font-size: small;">
                                                                    <p class="my-0">월~금요일 : 09:00~18:00</p>
                                                                    <p class="my-0">(점심시간 : 12:00~13:00)</p>
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
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
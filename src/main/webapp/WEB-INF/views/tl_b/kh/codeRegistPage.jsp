<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                                            보건직원 ${list}이름 님
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
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="fw-bold">의약품 현황</div>
                                                    </div>
                                                </div>
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
                                                              <tr>
                                                                <th scope="row">1</th>
                                                                <td>Mark</td>
                                                                <td>Otto</td>
                                                                <td>@mdo</td>
                                                              </tr>
                                                              <tr>
                                                                <th scope="row">2</th>
                                                                <td>Jacob</td>
                                                                <td>Thornton</td>
                                                                <td>@fat</td>
                                                              </tr>
                                                              <tr>
                                                                <th scope="row">3</th>
                                                                <td colspan="2">Larry the Bird</td>
                                                                <td>@twitter</td>
                                                              </tr>
                                                            </tbody>
                                                          </table>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text" id="basic-addon1">코드번호</span>
                                                                    <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text" id="basic-addon1">의약품명</span>
                                                                    <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                            <div class="col-4 d-grid">
                                                                <div class="btn btn-secondary">등록하기</div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <select class="form-select" aria-label="Default select example">
                                                                    <option selected>약품 카테고리</option>
                                                                    <option value="1">알러지</option>
                                                                    <option value="2">외상</option>
                                                                    <option value="3">소화기</option>
                                                                    <option value="3">호흡기</option>
                                                                    <option value="3">일반</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text" id="basic-addon1">회사</span>
                                                                    <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text" id="basic-addon1">효능</span>
                                                                    <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text" id="basic-addon1">주의사항</span>
                                                                    <input type="text" class="form-control" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                        </div>
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
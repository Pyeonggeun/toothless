<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script src="https://kit.fontawesome.com/fdd6196f61.js" crossorigin="anonymous"></script>

        <style>
            
            @font-face {
                font-family: 'Jal_Onuel';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            .mkmk {
                font-family: 'Jal_Onuel';
            }

            .nav-pills .nav-link.active, .nav-pills .show>.nav-link {

                color: #f7a505;
                background-color: #fff;
                border-bottom: solid;
                border-color: #f7a505;

            }

            .nav-link {

                color: #909294;

            }

            .nav-link:focus, .nav-link:hover {

                color: #f7a505;

            }

        </style>

        <script>

            function showWriteReviewModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#writeReviewModal");
                modal.show();
            }

            function showReviewModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#reviewModal");
                modal.show();
            }

        </script>
        
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="./top.jsp"></jsp:include>
                    <div class="row">
                        <div class="col py-4 progress-bar progress-bar-striped" style="background-color: #7844ae;">
                            <div class="row">
                                <div class="col text-white text-center fw-bold" style="font-size: 2em; letter-spacing: -0.05em;">
                                    나의 강의실
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="col">
                            <div class="row" style="margin-left: 10.5%; margin-right: 10.5%;">
                                <div class="col-2">
                                    <div class="row sticky-top" style="top: 8em;">
                                        <div class="col rounded border">
                                            <div class="row">
                                                <div class="col fw-bold text-secondary py-3 ps-3" style="font-size: 0.95em;">
                                                    홈
                                                </div>
                                                <div class="col text-end fw-bold text-secondary py-3 pe-3">
                                                    &gt;
                                                </div>
                                            </div>
                                            <div>
                                                <hr class="my-0">
                                            </div>
                                            <div class="row">
                                                <div class="col fw-bold text-secondary py-3 ps-3" style="font-size: 0.95em;">
                                                    학습
                                                </div>
                                                <div class="col text-end fw-bold text-secondary py-3 pe-3">
                                                    &gt;
                                                </div>
                                            </div>
                                            <div>
                                                <hr class="my-0">
                                            </div>
                                            <div class="row">
                                                <div class="col fw-bold py-3 ps-3" style="font-size: 0.95em; color: #7844ae;">
                                                    만족도/후기
                                                </div>
                                                <div class="col text-end fw-bold py-3 pe-3" style="color: #7844ae;">
                                                    &gt;
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col ms-5">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col px-0 fw-bold" style="font-size: 2em;">
                                                    만족도/후기
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col px-0">
                                                    <div class="row">
                                                        <div class="col py-1 text-secondary" style="font-size: 0.9em;">
                                                            총 <span class="fw-semibold">155</span> 건
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <hr class="mt-0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">

                                                    <div class="row mt-3">
                                                        <div class="col py-4 rounded border">
                                                            <div class="row">
                                                                <div class="col px-4">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <span class="text-body-tertiary border-secondary-subtle ps-2 pe-1 py-1 fw-bold" style="border: solid; border-width: 0.01em; font-size: 0.85em;">
                                                                                &#91;123&#93;<span style="font-size: 0.9em;">차</span>
                                                                            </span>
                                                                            <span class="ms-2 px-2 py-1 fw-bold" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #f7a505;">
                                                                                오프라인
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-3">
                                                                        <div class="col fw-bold text-body-tertiary" style="font-size: 0.95em;">
                                                                            파이썬
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
                                                                            기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vr px-0 text-body-tertiary"></div>
                                                                <div class="col-3 my-auto">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button onclick="showWriteReviewModal()" class="btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae;">참여하기</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row mt-3">
                                                        <div class="col py-4 rounded border">
                                                            <div class="row">
                                                                <div class="col px-4">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <span class="text-body-tertiary border-secondary-subtle ps-2 pe-1 py-1 fw-bold" style="border: solid; border-width: 0.01em; font-size: 0.85em;">
                                                                                &#91;123&#93;<span style="font-size: 0.9em;">차</span>
                                                                            </span>
                                                                            <span class="ms-2 px-2 py-1 fw-bold" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #f7a505;">
                                                                                오프라인
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-3">
                                                                        <div class="col fw-bold text-body-tertiary" style="font-size: 0.95em;">
                                                                            파이썬
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-2">
                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
                                                                            기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="vr px-0 text-body-tertiary"></div>
                                                                <div class="col-3 my-auto">
                                                                    <div class="row">
                                                                        <div class="col d-grid justify-content-center">
                                                                            <button onclick="showReviewModal()" class="btn fw-bold px-5 py-2" style="font-size: 0.9em; color: #7844ae; border: solid; border-color: #7844ae; border-width: 0.01em;">보기</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    

                                                    <div class="row mt-5">
                                                        <div class="col d-grid justify-content-center">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination mb-0">
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black fw-bold" href="#" aria-label="Previous" style="font-size: 1.1em;">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">1</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">2</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">3</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">4</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">5</a></li>
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black fw-bold" href="#" aria-label="Next" style="font-size: 1.1em;">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
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
                    <jsp:include page="./bottom.jsp"></jsp:include>
                </div>
            </div>
        </div>

        <jsp:include page="./writeReviewModal.jsp"></jsp:include>

        <jsp:include page="./reviewModal.jsp"></jsp:include>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
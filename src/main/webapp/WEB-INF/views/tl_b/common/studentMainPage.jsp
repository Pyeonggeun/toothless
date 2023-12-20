<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <script src="../../resources/js/hn/topBanner.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>

    <!-- 부트스트랩 CSS 파일 포함 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- 다른 head 내용 ... -->
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- FullCalendar CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />

    <!-- FullCalendar JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>

    <style>
        /* 달력 사이 간격 조정 */
        #calendar {
            margin: 1em;
        }
        .fc-prev-button, .fc-next-button {
            font-size: 5em; /* 원하는 크기로 조절 */
        }

        /* 타이틀의 색상 및 크기 조절 */
        .fc-center h2 {
            color: #E15562; /* 원하는 색상으로 조절 */
            font-size: 1.5em; /* 원하는 크기로 조절 */
            font-weight: bold;
        }
    </style>

    <script>
        $(document).ready(function() {
            $('#calendar').fullCalendar({
            header: {
            left: 'prev',
            center: 'title',
            right: 'next'
            },
            defaultDate: '2023-01-01', // 시작 날짜
            editable: true,
            eventLimit: true, // 한 날에 이벤트가 많을 경우 '더 보기' 버튼 표시
            events: [
            { 
                title: '이벤트 1',
                start: '2023-01-01'
            },    
            { 
                title: '이벤트 2',
                start: '2023-01-05',
                end: '2023-01-07'
            } ,
                // 추가적인 이벤트들을 원하는 만큼 추가할 수 있습니다.
            ]
        });   
        });
    </script>

    <script>
        function changeColor(targetElement) {
        // 원하는 배경색으로 변경하십시오
        targetElement.style.backgroundColor = 'orange';
        }
        // 마우스가 벗어났을 때 원래의 배경색으로 복원하는 함수
        function changeColorReset(targetElement) {
            targetElement.style.backgroundColor = ''; // 빈 문자열로 설정하여 기본 스타일로 복원
        }

    </script>
    
</head>
<body>
	<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
	<jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
    <div class="container-fluid">

        <div class="row">
            <div class="col px-0">
                <img class="img-fluid" src="../../resources/img/healthRoom/mainPage/adhy-savala-zbpgmGe27p8-unsplash.jpg">
            </div>
        </div>

        <!-- <div class="row">
            <div class="col px-0 rounded-5">
                <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="./img/medicine/img_0ea6v3b19=75v0b=4evfa=8ev26=6992vdec6veaed_v6063.png" class="d-block w-100 img-fluid" style="height: 70vh; object-fit: cover; object-position: 50% 79%;">
                        </div>
                        <div class="carousel-item">
                            <img src="./img/medicine/img_0ea6v3b19=75v0b=4evfa=8ev26=6992vdec6veaed_v6063.png" class="d-block w-100 img-fluid" style="height: 70vh; object-fit: cover; object-position: 50% 75%;">
                        </div>
                        <div class="carousel-item">
                            <img src="./img/medicine/img_0ea6v3b19=75v0b=4evfa=8ev26=6992vdec6veaed_v6063.png" class="d-block w-100 img-fluid" style="height: 70vh; object-fit: cover; object-position: 50% 65%;">
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
        </div> -->
        <div class="container">
            <div class="row px-5 text-center mt-4 py-3 rounded-5" style="background-color: #FCF5E1;">
                <div class="col-3">
                    <div class="row">
                        <button class="btn rounded-pill" onclick="location.href=''" onmouseover="changeColor(this)" onmouseout="changeColorReset(this)">
                            <div class="col img-fluid">
                                <img src="../../resources/img/healthRoom/mainPage/0028_ico01_link02.png">
                            </div>
                            <div class="col fw-bold fs-5 pt-3">보건소소개</div>
                        </button>
                    </div>
                </div>

                <div class="col-3">
                    <div class="row">
                        <button class="btn rounded-pill" onclick="location.href='../ys/studentItemApplyInformationPage'" onmouseover="changeColor(this)" onmouseout="changeColorReset(this)">
                            <div class="col img-fluid">
                                <img src="../../resources/img/healthRoom/mainPage/0028_ico01_link03.png">
                            </div>
                            <div class="col fw-bold fs-5 pt-3">물품신청</div>
                        </button>
                    </div>  
                </div>

                <div class="col-3">
                    <div class="row">
                        <button class="btn rounded-pill" onclick="location.href='../hs/eduMainPageForStudent'" onmouseover="changeColor(this)" onmouseout="changeColorReset(this)">
                        <div class="col img-fluid">
                            <img src="../../resources/img/healthRoom/mainPage/0028_ico01_link04.png">
                        </div>
                        <div class="col fw-bold fs-5 pt-3">교육프로그램신청</div>
                        </button>
                    </div>
                </div>

                <div class="col-3">
                    <div class="row">
                        <button class="btn rounded-pill" onclick="location.href=''" onmouseover="changeColor(this)" onmouseout="changeColorReset(this)">
                        <div class="col img-fluid">
                            <img src="../../resources/img/healthRoom/mainPage/0028_ico01_link01.png" >
                        </div>
                        <div class="col fw-bold fs-5 pt-3">정보마당</div>
                        </button>
                    </div>
                </div>

            </div>
            <div class="row my-4">
                <div class="col-4 me-5 d-flex justify-content-center align-items-center rounded-5 text-center py-3" style="background-color: #FFE7EB;">
                    <div class="row">
                    	<div class="col">
                    		<div class="row my-3">
		                        <div class="col fw-bold fs-6">
		                            진료시간
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col">
		                            월~금요일 : 09:00~18:00
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col">
		                            (점심시간 : 12:00~13:00)
		                        </div>
		                    </div>
		                    <div class="row my-3">
		                        <div class="col fw-bold fs-6">
		                            아무개 정보
		                        </div>
		                    </div>
		                    <div class="row">
		                        <div class="col">
		                            월~금요일 : 09:00~18:00
		                        </div>
		                    </div>
		                    <div class="row mb-3">
		                        <div class="col">
		                            (점심시간 : 12:00~13:00)
		                        </div>
		                    </div>
                    	</div>
                    </div>
                </div>
                
                <div class="col">
                    <div class="row text-white rounded-5 py-3 px-3 " style="background-color:#133369;">
                        <div class="col-10 d-flex align-items-center fw-bold fs-5">
                            공지사항
                        </div>
                        <div class="col-2 text-end">
                            <i class="bi bi-plus-circle-fill fw-bold fs-2 text-white" onclick="location.href='../ty/studentBoardPage'"></i>
                        </div>
                    </div>
                    <div class="row mt-3" >
                        <div class="col ps-3 me-3 border border-2 rounded-5" style="background-color: #F7FBFF;">
                            <div class="row my-3">
                                <div class="col fw-bold fs-6">
                                    보건실을 이용하는 모든 학생들에게
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <span>보건실 이용이 끝난후 뛰어나가다가 다시 보건실에 입원하는 경우가 속출하고 있습니다.</span>
                                    <span>퇴원하실때는 걸어나가셔서 부디 재입원을 하게되는 경우가없도록 부탁드립니다.</span>
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="col">
                                    2023.12.20 보건소장
                                </div>
                            </div>  
                        </div>
                        <div class="col ps-3 ms-3 border border-2 rounded-5 "style="background-color: #F7FBFF;">
                            <div class="row my-3">
                                <div class="col fw-bold fs-6">
                                    보건실을 이용하는 모든 학생들에게
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <span>보건실 이용이 끝난후 뛰어나가다가 다시 보건실에 입원하는 경우가 속출하고 있습니다.</span>
                                    <span>퇴원하실때는 걸어나가셔서 부디 재입원을 하게되는 경우가없도록 부탁드립니다.</span>
                                </div>
                            </div>
                            <div class="row my-3">
                                <div class="col">
                                    2023.12.20 보건소장
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-9 bg-body-tertiary rounded-4 pe-5">
                    <div class="row">
                        <div class="col-6">
                            <div id="calendar"></div>
                        </div>
                        <div class="col-6 my-0 text-center">
                            <div class="row my-3 rounded-5 py-1" style="background-color: #133369;">
                                <div class="col fw-bold text-center fs-5 text-white">
                                    Event
                                </div>
                            </div>
                            <div class="row my-2 py-2 border-bottom border-2">
                                <div class="col-4 border-end">
                                    2023.11.28
                                </div>
                                <div class="col-8">
                                    이런저러한일을해야합니다
                                </div>
                            </div>
                            <div class="row my-2 py-2 border-bottom border-2">
                                <div class="col-4 border-end">
                                    2023.11.28
                                </div>
                                <div class="col-8">
                                    이런저러한일을해야합니다
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="row">
                        <div class="col text-center fw-bold fs-2">
                            <span>Map&nbsp;</span><i class="bi bi-pin-map-fill text-danger"></i>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col text-center">
                            <img class="img-fluid rounded-5" src="../../resources/img/healthRoom/mainPage/map.jpg" style="height : 100%" >
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
    </div>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <!--부트스트랩 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script>
        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
    </script>
</body>
</html>
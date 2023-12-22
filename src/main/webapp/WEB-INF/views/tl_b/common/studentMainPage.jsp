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
        /* CSS로 회전 효과를 줄 클래스 정의 */
        .rotate-90 {
            transform: rotate(90deg);
            transition: transform 0.3s ease; /* 회전 효과에 대한 CSS 트랜지션 */
        }
        .element-with-pointer-cursor {
            cursor: pointer;
            font-weight: bold;
        }
        .bi-plus-circle-fill:hover{
            font-size: 30px;
            line-height: 30px;
            color:cadetblue;
        }
        .rotateRight {
        transform: rotate(90deg);
        transition: all ease 0.5s;
     	}
        .rotateLeft {
        transform: rotate(-90deg);
        transition: all ease 0.5s;
     	}
        body span {
            display: block;  
        }
        .card {
        max-width: calc(100% - 38px);
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        }
        
            
    </style>

    <script>
        function changeColor(targetElement) {
        // 원하는 배경색으로 변경하십시오
        targetElement.style.backgroundColor = 'orange';
        }
        // 마우스가 벗어났을 때 원래의 배경색으로 복원하는 함수
        function changeColorReset(targetElement) {
            targetElement.style.backgroundColor = ''; // 빈 문자열로 설정하여 기본 스타일로 복원
        }
        function rotateRight(element) {
            var img = document.getElementById("plus");
            element.setAttribute ("class","rotateRight");
        }
        function rotateLeft(element){
            var img = document.getElementById("plus");
            element.setAttribute ("class","rotateLeft");
        }
        
        function borderChange(element){
            var border = document.querySelector(".borderChange");
            element.classList.toggle("border-primary");
        }
    </script>

    <script>
        function reloadNotice(){

            const url = "../kh/boardNotice"

            fetch(url)
            .then(response => response.json())
            .then(response => {

                let i = 0;

                //붙일장소
                const noticeStation = document.querySelector("#noticeStation");
                for(e of response.data){
                    
                    if(i==2){return;}
                    if(i == 0){
                    const borderChange = document.querySelector("#templete .borderChange").cloneNode(true);
                    borderChange.classList.add("me-3");

                    const boardTitle = borderChange.querySelector(".boardTitle");
                    boardTitle.innerText = e.title;
                    
                    const boardContent = borderChange.querySelector(".boardContent");
                    boardContent.innerText = e.content;
                    
                    const boardDate = borderChange.querySelector(".boardDate");
                    const date = new Date(e.created_at);
                    boardDate.innerText = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
                    
                    noticeStation.appendChild(borderChange);
                    }else{

                    const borderChange = document.querySelector("#templete .borderChange").cloneNode(true);

                    const boardTitle = borderChange.querySelector(".boardTitle");
                    boardTitle.innerText = e.title;
                    
                    const boardContent = borderChange.querySelector(".boardContent");
                    boardContent.innerText = e.content;
                    
                    const boardDate = borderChange.querySelector(".boardDate");
                    const date = new Date(e.created_at);
                    boardDate.innerText = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
                    
                    noticeStation.appendChild(borderChange);
                    }
                    i += 1;
                }
            })

        }

        window.addEventListener("DOMContentLoaded", () => {
            reloadNotice();
            });
    </script>

    <script>
        $(document).ready(function() {
            $('#calendar').fullCalendar({
            header: {
            left: 'prev',
            center: 'title',
            right: 'next'
            },
            defaultDate: '2023-12-01', // 시작 날짜
            editable: true,
            eventLimit: true, // 한 날에 이벤트가 많을 경우 '더 보기' 버튼 표시
            events: [
            { 
                title: '대동제',
                start: '2023-12-13'
            },    
            { 
                title: '크리스마스연휴',
                start: '2023-12-23',
                end: '2023-12-26'
            } ,
            { 
                title: '기말고사',
                start: '2023-12-04',
                end: '2023-12-09'
            } ,
                // 추가적인 이벤트들을 원하는 만큼 추가할 수 있습니다.
            ]
        });   
        });
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
        
            <div class="row" style="margin-left: 7%; margin-right: 7%;">
                <div class="col">

                
                    <div class="row px-5 text-center mt-4 py-3 rounded-5" style="background-color: #FCF5E1;">
                        <div class="col-3">
                            <div class="row">
                                <button id="aaa" class="btn rounded-pill" onclick="location.href='../ys/healthCenterInfoPage'" onmouseover="changeColor(this)" onmouseout="changeColorReset(this)">
                                    <div class="col img-fluid">
                                        <img src="../../resources/img/healthRoom/mainPage/0028_ico01_link02.png">
                                    </div>
                                    <div class="col fw-bold fs-5 pt-3">보건센터안내</div>
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
                                <button class="btn rounded-pill" onclick="location.href='../ys/informationForumPageOne'" onmouseover="changeColor(this)" onmouseout="changeColorReset(this)">
                                <div class="col img-fluid">
                                    <img src="../../resources/img/healthRoom/mainPage/0028_ico01_link01.png" >
                                </div>
                                <div class="col fw-bold fs-5 pt-3">정보마당</div>
                                </button>
                            </div>
                        </div>

                    </div>
                    <div class="row my-4">
                        <div class="col-4 me-3 d-flex justify-content-center align-items-center rounded-5 text-center py-3" style="background-color: #FFE7EB;">
                            <div class="row">
                                <div class="col">
                                    <div class="row my-1">
                                        <div class="col fw-bold fs-6">
                                            진료시간
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
                                    <div class="row border-top border-2 border-danger ">
                                        <div class="col fw-bold fs-6 pt-1 mt-3">
                                            간호사 근무시간
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
                                    <div class="row mb-3">
                                        <div class="col text-secondary fw-bold">
                                            비상연락망 : 010-1004-1004
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
                                <div class="col-2 text-end fs-6 element-with-pointer-cursor">
                                    <!-- <i class="bi bi-plus-circle-fill abc:hover fw-bold fs-2 text-white element-with-pointer-cursor" onclick="location.href='../ty/studentBoardPage'" onmouseover="rotateIcon(this, 90)"
                                    onmouseout="rotateIcon(this, 0)"></i> -->
                                    <svg id="plus" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16"
                                    onmouseover="rotateRight(this)" onmouseout="rotateLeft(this)" onclick="location.href='../ty/studentBoardPage'">
                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
                                    </svg>
                                </div>
                            </div>
                            <div id="noticeStation"class="row mt-3" >
                                <!-- 공지사항 출력되는곳-->
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col bg-body-tertiary rounded-4 pe-5">
                            <div class="row">
                                <div class="col-6">
                                    <div id="calendar"></div>
                                </div>
                                <div class="col-6 my-0 text-center">
                                    <div class="row my-3 rounded-5 py-1" style="background-color: #133369;">
                                        <div class="col fw-bold text-start fs-5 text-white ps-3">
                                            Event
                                        </div>
                                        <div class="col fw-bold text-end fs-5 text-white pb-1 element-with-pointer-cursor">
                                            <svg id="plus2" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16"
                                            onmouseover="rotateRight(this)" onmouseout="rotateLeft(this)" onclick="location.href='../kh/calendarPage'">
                                                <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="row my-2 py-2 border-bottom border-2">
                                        <div class="col-4 border-end">
                                            2023.12.08
                                        </div>
                                        <div class="col-8">
                                            기말고사
                                        </div>
                                    </div>
                                    <div class="row my-2 py-2 border-bottom border-2">
                                        <div class="col-4 border-end">
                                            2023.12.13
                                        </div>
                                        <div class="col-8">
                                            대동제
                                        </div>
                                    </div>
                                    <div class="row my-2 py-2 border-bottom border-2 text-danger">
                                        <div class="col-4 border-end">
                                            2023.12.23
                                        </div>
                                        <div class="col-8">
                                            크리스마스 연휴
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 ms-2">
                            <div class="row">
                                <div class="col text-center fw-bold fs-4">
                                    <span>찾아오시는길&nbsp;</span><i class="bi bi-pin-map-fill text-danger"></i>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col text-center pe-0" >
                                    <div class="rounded-4" id="map" style="width:100%; height:352.13px;"></div>
                                    <div id="clickLatlng"></div>

                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </div>
    <div class="row mt-3">
    	<div class="col">
        	<jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
        </div>
    </div>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <!--부트스트랩 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script>
        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
    </script>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b22c10f227ab026df2162c47788f95c8"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(37.499605278039844, 127.03044921990401), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(37.499605278039844, 127.03044921990401); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);    
    </script>

    <div id="templete" class="d-none">
        <div onmouseover="borderChange(this)" onmouseout="borderChange(this)" class="borderChange col ps-3 border border-2 rounded-5" 
        style="max-height: 300px; background-color: #F7FBFF;">
            <div class="row my-3">
                <div class="col fw-bold fs-6 text-center boardTitle">
                    <!-- 제목 -->
                </div>
            </div>
            <div class="row">
                <div class="col boardContent">
                    <!-- 내용 -->
                </div>
            </div>
            <div class="row my-3">
                <div class="col fw-bold text-center boardDate">
                    <!-- 입력일 -->
                </div>
            </div>  
        </div>
    </div>
    
</body>
</html>
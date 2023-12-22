<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    	<script src="../../resources/js/hn/topBanner.js"></script>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <!-- FullCalendar CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />

        <!-- FullCalendar JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>

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
            <div class="row mt-2 ps-5" style="margin-left: 16%; margin-right: 16%;">
                <div class="col">
                    <div class="row">
                        <div class="col text-end">
                            <a href="#" style="text-decoration-line : none; color: black;"><span style="font-size: 0.8em; opacity: 70%; ">HOME</span></a>&nbsp;<span style="font-size: 0.8em; opacity: 70%; position: relative; bottom: 7%;">></span>&nbsp;<span class="fw-bold" style="font-size: 0.8em;">보건센터 일정</span>                   
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col text-center fw-bold">
                            <span style="font-size: 2.3em;">보건센터 안내</span>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col"></div>
                        <div class="col-3 px-0" style="border-style: solid; border-bottom: 0.08em; border-width: 0.08em; border-bottom-color: black;"></div>
                        <div class="col"></div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-8 me-3 ">
                            <div id="calendar"></div>
                        </div>
                        <div class="col bg-body-tertiary">
                            <div class="row mt-4 border-bottom border-2 pb-3">
                                <div class="col text-center fw-bold fs-5">
                                    이달의 일정
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-4 border-end border-2 pe-0">
                                    2023.12.04
                                </div>
                                <div class="col">
                                    기말고사
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-4 border-end border-2 pe-0">
                                    2023.12.13
                                </div>
                                <div class="col">
                                    대동제
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-4 border-end border-2 pe-0">
                                    2023.12.23
                                </div>
                                <div class="col text-danger ">
                                    크리스마스연휴
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row mt-5">
                <div class="col">
                    <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>      
    </body>
</html>
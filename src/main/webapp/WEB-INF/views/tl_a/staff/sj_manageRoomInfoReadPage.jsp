<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <title>Room Info Read Page</title>
</head>
<body>
    <div class="container-fluid">
        <!-- 최상단 -->
        <jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>

        <!-- 기숙사관리 탭 페이지 -->
        <jsp:include page="../commons/staff/topNavi3.jsp"></jsp:include>

        <!-- 내용시작 -->
        <div class="row">
            <!-- 좌측 카테고리 -->
            <jsp:include page="../commons/staff/leftCategory2.jsp"></jsp:include>

            <!-- 우측내용 -->
            <div class="col mx-5">
                <!-- 카테고리명 -->
                <div class="row my-3">
                    <div class="col fs-4 fw-bold">
                        호 정보 관리
                    </div>
                </div>
                
                <!-- 카테고리 -->
			<div class="row mt-2">
				<div class="col fw-bold text-center px-2 py-2 mb-3">
					
					<ul class="nav nav-tabs">
					<li class="nav-item ta">
					    <a class="nav-link  text-black" href="./sj_manageRoomInfo">전체보기</a>
					  </li>
					<c:forEach items="${dormBuilding }" var="dorm">
					  <li class="nav-item ">
					    <a class="nav-link active text-black" href="./sj_manageRoomInfoReadPage?dorm_pk=${dorm.dorm_pk }">${dorm.name }</a>
					  </li>
					  </c:forEach>
					  
					</ul>
				</div>
			</div>

                <!-- 세부내용 시작 -->
 
                <div class="row">
				    <div class="col text-center fw-bold fs-5 my-3">
				        <c:forEach items="${forDorm}" var="map">
				            <c:if test="${map.buildingDto.dorm_pk == param.dorm_pk }">
				                ${map.buildingDto.name}
				            </c:if>
				        </c:forEach>
				    </div>
				</div>
				
				
                <div class="row border rounded p-3">
                    <div class="col">
                        <div class="row text-center fw-bold my-3 fs-5">
                            <div class="col">
                                동
                            </div>
                            <div class="col">
                                층
                            </div>
                            <div class="col">
                                호실
                            </div>
                            <div class="col">
                                정원
                            </div>
                            <div class="col">
                                성별
                            </div>
                            <div class="col">수정</div>
                            <div class="col">삭제</div>
                        </div>

                        <c:forEach items="${rooms}" var="roomMap">
                            <c:if test="${roomMap.dormRoomDto.dorm_pk == param.dorm_pk}">
                                <div class="row text-center">
                                    <div class="col my-2">
                                        <div class="row">
                                            <div class="col">
                                                ${roomMap.dormBuildingDto.name }
                                            </div>
                                            <div class="col">
                                                ${roomMap.dormRoomDto.dorm_floor } 층
                                            </div>
                                            <div class="col">
                                                ${roomMap.dormRoomDto.room_name }
                                            </div>
                                            <div class="col">
                                                ${roomMap.categoryDto.dorm_amount }인실
                                            </div>
                                            <div class="col">
                                                ${roomMap.dormRoomDto.gender }
                                            </div>
                                            <div class="col">
                                                <a href="#" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">
                                                    수정
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a href="./deleteForRoomProcess?dorm_room_pk=${roomMap.dormRoomDto.dorm_room_pk }" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">
                                                    삭제
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>

            </div> <!-- 우측내용 col 끝 -->

        </div> <!-- main row 끝 -->

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>
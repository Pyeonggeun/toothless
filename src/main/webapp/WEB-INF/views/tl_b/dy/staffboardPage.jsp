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
            div.no1title{
                font-weight: 700;
                font-size: x-large;
                float: left;
            }
            div.loginMent{
                vertical-align : bottom;
            }
            div.box{
                padding-top: 8px;
                padding-bottom: 8px;
                width: 60%;
                border: 0.1px solid gainsboro;
                float: left;
                border-top-style: none;

            }
            a{
                text-decoration-line: none;
                color: black;
            }
            div.title{
                font-size: 1.0rem;
                font-weight: 600;
            }
            div.writerInfo{
                color: silver;
                font-size: 0.8rem;
            }
            i.icon{
            	color: #005EAD;
            }
            span.replyCount{
            	color: #005EAD;
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
                                    <!--여기서 부터 -->
                                    <div class="row"></div>
                                    <div class="row box">
                                    	<div class="col">
	                                    	<div class="row">
                                                <div class="col-md-3 no1title">직원 게시판</div>
                                                <div class="col-md-6"></div>
                                                <div class="col-md-3 pt-1 text-end">
                                                    <c:choose>
                                                        <c:when test="${!empty sessionStaffInfo}">
                                                            <button type="button" class="btn btn-primary" onclick="location.href='./writeTextPage'">글쓰기</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button type="button" class="btn btn-primary" onclick="location.href='../../another/staff/loginPage'">로그인</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                    	</div>
                                    </div>
                                    <c:forEach items="${list}" var="map">
                                    <div class="row box">
                                        <div class="col">
                                            <div class="row title">
                                            	<div class="col">
                                            		<a href="./readTextPage?staffboard_pk=${map.staffboardDto.staffboard_pk}">${map.staffboardDto.title}
                                                	</a>
                                                	<span class="replyCount"><c:if test="${0 <map.staffboardReplyDto}">(${map.staffboardReplyDto})</c:if></span>
                                            	</div>
                                            </div>
                                            <div class="row"></div>
                                            <div class="row pt-2">
                                                <div class="col writerInfo">${map.staffInfoDto.name} &nbsp;&nbsp;|&nbsp;&nbsp; 조회 ${map.staffboardDto.read_count} &nbsp;&nbsp;|&nbsp;&nbsp; <fmt:formatDate value="${map.staffboardDto.created_at}" pattern="yyyy/MM/dd HH:mm"/></div>
                                            </div>
                                        </div>
                                        <div class="col-md-1 text-end d-flex align-items-center"><i class="bi bi-hand-thumbs-up-fill icon "></i>&nbsp;${map.staffboardLikeDto}</div>
                                    </div>
                                    </c:forEach>
                                </div>
                                <!-- 여기 까지-->
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
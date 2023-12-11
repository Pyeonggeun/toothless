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
                                    <h1>교직원 게시판</h1>
	                                    <c:choose>
	                                    	<c:when test="${!empty sessionStaffInfo}">
		                                    	${sessionStaffInfo.name} 님 로그인 하셨습니다.
		                                    	<br>
		                                   		<button type="button" onclick="location.href='./logoutProcess'">로그아웃</button>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<button type="button" onclick="location.href='../../another/staff/loginPage'">로그인</button>
	                                    	</c:otherwise>
	                                    </c:choose>
                                    <table border="1">
                                    	<tr>
                                    		<td>글번호</td>
											<td>제목</td>
											<td>작성자</td>
											<td>조회수</td>
											<td>추천</td>
											<td>작성일</td>
                                    	</tr>
                                    	<c:forEach items="${list}" var="map">
	                                    	<tr>
	                                    		<td>${map.staffboardDto.staffboard_pk}</td>
	                                    		<td><a href="./readTextPage?staffboard_pk=${map.staffboardDto.staffboard_pk}">${map.staffboardDto.title}
	                                    		<c:if test="${0 < map.staffboardReplyDto}">
	                                    		[${map.staffboardReplyDto}]
	                                    		</c:if>
	                                    		</a></td>
	                                    		<td>${map.staffInfoDto.name}</td>
	                                    		<td>${map.staffboardDto.read_count}</td>
	                                    		<td>${map.staffboardLikeDto}</td>
	                                    		<td><fmt:formatDate value="${map.staffboardDto.created_at}" pattern="yyyy.MM.dd(HH:mm:ss)"/> </td>
	                                    	</tr>
                                    	</c:forEach>	
                                    </table>
                                    <c:if test="${!empty sessionStaffInfo}">
                                    	<button type="button" onclick="location.href='./writeTextPage'">글쓰기</button>
                                    </c:if>
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
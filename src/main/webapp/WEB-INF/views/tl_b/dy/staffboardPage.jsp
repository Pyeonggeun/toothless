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
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
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
                                <div class="col bg-body-tertiary">
                                    <!--여기서 부터 -->
                                    <div class="row"></div>
                                    <div class="row box bg-white text-dark">
                                    	<div class="col">
                                    	<form action="./staffboardPage" method="get">
	                                    	<div class="row">
                                                <div class="col-md-4 no1title">직원 게시판</div>
                                                <div class="col-md-2 pt-1 d-flex align-items-center text-right">
                                                	<div class="row d-flex align-items-center">
                                                		<div class="col align-items-center px-0">
	                                                		<select name="searchType" class="form-select align-items-center rounded-0" aria-label="Default select example" style="font-size: small;">
															  <option value="title" ${searchType == 'title' ? 'selected' : null}>제목</option>
															  <option value="content"${searchType == 'content' ? 'selected' : null}>내용</option>
															  <option value="name"${searchType == 'name' ? 'selected' : null}>작성자</option>
															</select>
														</div>	
                                                	</div>
                                                </div>
                                                <div class="col-md-6 pt-1 text-left">
                                                	<div class="row d-flex align-items-center text-end px-0">
                                                		<div class="col-9 text-end d-flex px-0" role="search">
                                                			<input name="searchWord" class="form-control d-flex me-1 rounded-0" type="search" placeholder="검색" value="${searchWord}" aria-label="Search" style="font-size: small;">
        													<button class="btn btn-outline-primary rounded-0" type="submit" style="font-size: small;"><i class="bi bi-search"></i></button>
                                                		</div>
                                                		<div class="col ps-1 px-0 text-center">
                                                			<c:choose>
		                                                        <c:when test="${!empty sessionStaffInfo}">
		                                                            <button type="button" class="btn btn-primary rounded-0" style="font-size: small;" onclick="location.href='./writeTextPage'">글쓰기</button>
		                                                        </c:when>
		                                                        <c:otherwise>
		                                                            <script>
																		alert("로그인 후 이용해주세요");
																		location.href='../../another/staff/loginPage';
																	</script>
		                                                        </c:otherwise>
                                                   			</c:choose>
                                                		</div>
                                                	</div>
                                                </div>
                                            </div>
                                            </form>
                                    	</div>
                                    </div>
                                    <c:forEach items="${list}" var="map">
                                    <div class="row box bg-white text-dark">
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
                    <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
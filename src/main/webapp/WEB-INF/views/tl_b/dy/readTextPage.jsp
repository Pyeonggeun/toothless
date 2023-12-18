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
            div.boxEmptyLine1{
                padding-top: 0.6px;
                width: 60%;
                border: 0.4px solid gainsboro;
                float: left;
                border-top-style: none;
                background-color: gainsboro;
            }
            div.boxEmptyLine2{
                padding-top: 0.6px;
                width: 60%;
                border: 0.5px solid gainsboro;
                float: left;
                border-top-style: none;
                background-color: gainsboro;
            }
            div.boxEmptyLine3{
                padding-top: 17px;
                width: 60%;
                border: 2px solid gainsboro;
                float: left;
                border-top-style: none;
                background-color: gainsboro;
            }
            div.contentBox{
            	padding-top: 15px;
                padding-bottom: 15px;
                padding-left: 12px;
                padding-right: 12px;
                font-size: 0.9rem;
            }
            div.likeBox{
            	padding-top: 20px;
                padding-bottom: 20px;
                padding-left: 172px;
                padding-right: 172px;
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
            span.writerInfo{
                color: silver;
                font-size: 0.8rem;
            }
            div.name{
                color: dimgray;
                font-size: 0.8rem;
                font-weight: 600;
            }
            span.name{
                color: dimgray;
                font-size: 0.8rem;
                font-weight: 600;
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
                                			<div class="row">
                                				<div class="col-md-3 d-flex align-items-center">직원 게시판</div>
                                				<div class="col-md-6"></div>
                                				<div class="col-md-3 text-end">
													<button type="button" class="btn btn-secondary" style="font-size: smaller; background-color: whitesmoke; color: black; border: none;" onclick="location.href='./staffboardPage'">목록</button>
												</div>
                                			</div>
                                		</div>
                                	</div>
                                	<div class="row box bg-white text-dark">
                                		<div class="col">
                                			<div class="row pt-3">
                                				<div class="col no1title">${readText.staffboardDto.title}</div>
                                			</div>
                                			<div class="row pt-2 pb-3">
                                				<div class="col">
                                					<div class="row d-flex align-items-center">
                                						<div><span class="col name text-start">${readText.staffInfoDto.name}</span>&nbsp;&nbsp;&nbsp;<span class="col writerInfo text-start"><fmt:formatDate value="${readText.staffboardDto.created_at}" pattern="yyyy/MM/dd HH:mm"/>&nbsp;&nbsp;|&nbsp;&nbsp;조회 ${readText.staffboardDto.read_count}</span><span class="col writerInfo text-start">&nbsp;&nbsp;|&nbsp;&nbsp;댓글 ${replyCountInContent}</span><span class="col writerInfo text-start">&nbsp;&nbsp;|&nbsp;&nbsp;추천 ${likeCount}</span></div>
                                						<div class="col"></div>
                                					</div>
                                                </div>
                                			</div>
                                		</div>
                                	</div>
                                	<div class="row box bg-white text-dark">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col contentBox">${readText.staffboardDto.content}</div>
                                            </div>
                                            <div class="row">
                                                <div class="col likeBox bg-white text-dark text-center">
                                                    <c:if test="${!empty sessionStaffInfo }">
                                                        <c:choose>
                                                            <c:when test="${count == 1}">
                                                                <button type="button" class="btn btn-primary" onclick="location.href='./canselLikeProcess?staff_pk=${sessionStaffInfo.staff_pk }&staffboard_pk=${readText.staffboardDto.staffboard_pk}'"><i class="bi bi-hand-thumbs-up-fill"></i>&nbsp;${likeCount}</button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button type="button" class="btn btn-primary" onclick="location.href='./addLikeProcess?staff_pk=${sessionStaffInfo.staff_pk }&staffboard_pk=${readText.staffboardDto.staffboard_pk}'"><i class="bi bi-hand-thumbs-up"></i>&nbsp;${likeCount}</button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                	</div>
                                    <div class="row box bg-white text-dark">
                                        <div class="col text-end bg-white text-dark">
                                            <c:if test="${!empty sessionStaffInfo && sessionStaffInfo.staff_pk == readText.staffboardDto.staff_pk}">
                                                <button type="button" class="btn btn-outline-light" style="color: #000000ba; font-size: smaller; font-weight: 600;" onclick="location.href='./deleteTextProcess?staffboard_pk=${readText.staffboardDto.staffboard_pk}'">삭제</button>
                                                <button type="button" class="btn btn-outline-light" style="color: #000000ba; font-size: smaller; font-weight: 600" onclick="location.href='./modifyTextPage?staffboard_pk=${readText.staffboardDto.staffboard_pk}'">수정</button>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row boxEmptyLine2  bg-white text-dark"></div>
                                    <div class="row box  bg-white text-dark">
                                        <div class="col title d-flex align-items-center">댓글쓰기</div>
                                    </div>
                                    <div class="row boxEmptyLine1"></div>
                                    <div class="row box  bg-white text-dark">
                                        <c:if test="${!empty sessionStaffInfo}">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col">${sessionStaffInfo.name}</div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <form action="./writeReplyProcess?staffboard_pk=${readText.staffboardDto.staffboard_pk}" method="post">
                                                        <div class="row">
                                                            <div class="col">
                                                                <textarea class="form-control" style="border: none; font-size: small;" name="content" placeholder="댓글을 입력해주세요."></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col text-end"><input class="mt-1 btn btn-primary" style="font-size: small; font-weight: 700;" type="submit" value="댓글쓰기"></div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
                                    </div>
                                    <div class="row"></div>
                                    <div class="row boxEmptyLine3"></div>
                                    <div class="row box bg-white text-dark">
                                        <div class="col title d-flex align-items-center">댓글</div>
                                    </div>
                                    <c:forEach items="${replyList}" var="map">
                                    <div class="row box bg-white text-dark">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-md-2 pe-0 name text-start">${map.staffInfo.name}</div>
                                                <div class="col-md-8 ps-0 writerInfo text-start"><fmt:formatDate value="${map.staffboardReplyDto.created_at}" pattern="yyyy/MM/dd HH:mm"/></div>
                                                <div class="col-md-2"></div>
                                            </div>
                                            <div class="row">
                                                <div class="col" style="font-size: 15px;">${map.staffboardReplyDto.content}</div>
                                                <div class="col text-end">
                                                    <c:if test="${!empty sessionStaffInfo && sessionStaffInfo.staff_pk == map.staffboardReplyDto.staff_pk}">
                                                        <button type="button" class="btn btn-outline-light" style="color: #000000ba; font-size: smaller; font-weight: 600" onclick="location.href='./modifyReplyPage?staffboard_reply_pk=${map.staffboardReplyDto.staffboard_reply_pk}'">수정</button>
                                                        <button type="button" class="btn btn-outline-light" style="color: #000000ba; font-size: smaller; font-weight: 600" onclick="location.href='./deleteReplyProcess?staffboard_reply_pk=${map.staffboardReplyDto.staffboard_reply_pk}&staffboard_pk=${map.staffboardReplyDto.staffboard_pk}&staff_pk=${sessionStaffInfo.staff_pk}'">삭제</button>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="row"></div>
                                        </div>
                                    </div>
                                    </c:forEach>
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
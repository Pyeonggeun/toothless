<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <h1>작성 글 보기</h1>
                                    제목 ${readText.staffboardDto.title }
                                    <br>
                                    작성자 ${readText.staffInfoDto.name}
                                    <br>
                                    조회수 ${readText.staffboardDto.read_count}
                                    <br>
                                    내용 <br>
                                    ${readText.staffboardDto.content}
                                    <br>
                                    <c:if test="${!empty sessionStaffInfo }">
                                    	<c:choose>
                                    		<c:when test="${count == 1}">
                                    			<button type="button" onclick="location.href='./canselLikeProcess?staff_pk=${sessionStaffInfo.staff_pk }&staffboard_pk=${readText.staffboardDto.staffboard_pk}'"><i class="bi bi-hand-thumbs-up-fill"></i></button>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<button type="button" onclick="location.href='./addLikeProcess?staff_pk=${sessionStaffInfo.staff_pk }&staffboard_pk=${readText.staffboardDto.staffboard_pk}'"><i class="bi bi-hand-thumbs-up"></i></button>
                                    		</c:otherwise>
                                    	</c:choose>
                                    </c:if>
									${likeCount}
                                    <br>
                                    <button type="button" onclick="location.href='./staffboardPage'">목록으로</button>
                                    <c:if test="${!empty sessionStaffInfo && sessionStaffInfo.staff_pk == readText.staffboardDto.staff_pk}">
	                                    <button type="button" onclick="location.href='./deleteTextProcess?staffboard_pk=${readText.staffboardDto.staffboard_pk}'">삭제</button>
	                                    <button type="button" onclick="location.href='./modifyTextPage?staffboard_pk=${readText.staffboardDto.staffboard_pk}'">수정</button>
									</c:if>
									<br>
									<h3>댓글</h3>
									<table>
                                    	<c:forEach items="${replyList}" var="map">
	                                    	<tr>
                                                <td>${map.staffboardReplyDto.content}</td>
	                                    		<td>${map.staffInfo.name}</td>
	                                    		<td>${map.staffboardReplyDto.created_at}</td>
                                                <td>
                                                    <c:if test="${!empty sessionStaffInfo && sessionStaffInfo.staff_pk == map.staffboardReplyDto.staff_pk}">
                                                        <button type="button" onclick="location.href='./modifyReplyPage?staffboard_reply_pk=${map.staffboardReplyDto.staffboard_reply_pk}'">수정</button>
                                                        <button type="button" onclick="location.href='./deleteReplyProcess?staffboard_reply_pk=${map.staffboardReplyDto.staffboard_reply_pk}&staffboard_pk=${map.staffboardReplyDto.staffboard_pk}&staff_pk=${sessionStaffInfo.staff_pk}'">삭제</button>
                                                    </c:if>
                                                </td>
	                                    	</tr>
                                    	</c:forEach>
                                    </table>
									<c:if test="${!empty sessionStaffInfo}">
									<form action="./writeReplyProcess?staffboard_pk=${readText.staffboardDto.staffboard_pk}" method="post">
									댓글자 ${sessionStaffInfo.name}
									<br>
									<textarea name="content" rows='3' cols='60'></textarea>
									<input type="submit" value="댓글등록">
									</form>
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
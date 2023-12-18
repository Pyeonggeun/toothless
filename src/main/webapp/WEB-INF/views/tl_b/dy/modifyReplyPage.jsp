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
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
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
                                    <h1>작성 댓글 수정</h1>
                                    <form action="./modifyReplyProcess?staffboard_pk=${replyInfo.staffboardReplyDto.staffboard_pk}" method="post">
                                        작성자 ${sessionStaffInfo.name}
                                        <br>
                                        수정할 내용 <br>
                                        <textarea name="content" rows='3' cols='60'>${replyInfo.staffboardReplyDto.content}</textarea>
                                        <input name="staffboard_reply_pk" type="hidden" value="${replyInfo.staffboardReplyDto.staffboard_reply_pk }">
                                        <input type="submit" value="수정완료">
                                    </form>
                                   <button type="button" onclick="location.href='./readTextPage?staffboard_pk=${replyInfo.staffboardReplyDto.staffboard_pk}'">취소</button>
                                </div>
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
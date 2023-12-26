<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<script src="../../resources/js/hn/topBanner.js"></script>
    </head>
    	<style>
    		a {
            	text-decoration: none; /* 밑줄 제거 */
       	 	}
    	</style>
    	 <script>
            function formSubmit(){
                const frm = document.getElementById("frm");

                const inputComment =document.getElementById("inputComment");
                    if(inputComment.value ==''){
                        alert("댓글을 입력해주세요!!")
                        inputComment.focus;
                        return;

                    }
                   
                 frm.submit();
            }
        </script>
    <body>
    	<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
		<jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                  <div class="row">
                    <div class="col">
                        
                        <div class="row py-2" style="background-color:#F2F2F2 ;">
                            <div class="col">
                                <a href="../common/studentMainPage";
	                                 style="text-decoration: none; color:#015A9E;">
	                                 홈
                                </a>>
                                <a href="./studentBoardPage"; 
                                    style="text-decoration: none; color:#015A9E;">
                                    공지사항
                                </a>>
                                    상세글
                            </div>
                        </div>
                        <div>
                        <div class="row">
                            <div class="col"></div>
								
                            <div class="col-7 mt-5 pt-5">
                                <div class="row my-2 border-2 border-top  border-black">
                                    <div class="col fw-bold mt-2" style="font-size: 25px">
                                        [공지] &nbsp;
                                        ${read.noticeboardDto.title }
                                    </div>
                                </div>
                                <div class="row border-2 border-bottom  ">
                                    <div class="col mb-2" style="font-size: 13px">
                                        ${read.staffInfoDto.name } &nbsp;
                                        <fmt:formatDate value="${read.noticeboardDto.created_at }" pattern="yy년 MM월 dd일"/>
                                        &nbsp; | 
                                        <i class="bi bi-eye"></i>
                                        ${read.noticeboardDto.read_count }
                                        &nbsp; | <i class="text-danger bi bi-heart-fill"></i>${likeCount }
                                     	<i class="bi bi-chat-dots"></i>${replyCount}
                                    </div>
                                </div>
                                <div class="row mb-5 mt-5 pt-3">
                                    <div class="col" style="font-size: 18px";>
                                        ${read.noticeboardDto.content }
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col text-center">
                                        <c:forEach items="${read.boardImageDtoList }" var="boardImageDto">
                                            <img src="/uploadFiles/mainImage/${boardImageDto.img_link }">
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="row mt-5 pt-3 ">
                                    <div class="col">
                                        
                                        <div class="row mb-2 border-2 border-bottom border-black">
                                        	<div class="col text-secondary" style="font-size: 15px;">
                                        		댓 글
                                        		[${replyCount}] |
                                        	</div>
                                        </div>
                                        
                                        <c:forEach items="${reply }" var="boardReply">
                                        <div class="row">
                                            <div class="col" style="font-size:20px;">
                                                ${boardReply.replyDto.content }
                                            </div>
                                        </div>
                                        <div class="row my-1">
                                            <div class="col border-bottom" style="font-size: 15px;">
                                                작성자: ${boardReply.studentDto.name }
	                                            <span class="col text-secondary" style="font-size: 13px;">
	                                                <fmt:formatDate value="${boardReply.replyDto.created_at }" pattern="yy년 MM월 dd일 "/>
	                                                <c:if test="${sessionStudentInfo.student_pk == boardReply.replyDto.student_pk || sessionStaffInfo != null  }">
	                                                    <a href="./replyDeleteProcess?id=${boardReply.replyDto.studentboard_reply_pk }
	                                                        &deleteId=${boardReply.studentDto.student_pk}
	                                                        &boardPk=${read.noticeboardDto.studentboard_pk}"
	                                                        style="text-decoration: none; color:#015A9E;">
	                                                        <i class="bi bi-trash"></i>
	                                                    </a>
	                                                </c:if>    
	                                            </span>
                                             </div>
                                        </div>
                                        </c:forEach>
                                        <c:if test="${!empty sessionStudentInfo }">
                                        <form id="frm" action="./studentReplyProcess" method="post">
                                        <div class="row mt-2">
                                            <div class="col">
                                                <div class="form-floating">
												  <textarea id="inputComment" name="content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
												  <label for="floatingTextarea">Comments</label>
												</div>
                                                <input name="studentboard_pk" type="hidden" value="${read.noticeboardDto.studentboard_pk }">
                                            </div>
                                            <div class="col mt-3">
                                                <input type="button" onclick="formSubmit()" class="btn btn-outline-primary" value="작성하기">
                                            </div>
                                        </div>
                                        </form>
                                        </c:if>
                                    </div>
                                </div>
                                	
                          		<div class="row text-end my-4">
                          			<div class="col pe-0">
                          				<a href="./studentBoardPage">
                          					<input class="btn btn-outline-primary" type="button" value="목록">
                          				</a>
                          			</div>
                          		</div>
                                       	
                            </div>
							<div class="col"></div>
							<div class="col-2" style="background-color:#F2F2F2";>
                               	<div class="row" >
                               		<div class="col-1"></div>
                               		<div class="col">
                               			<div class="row"></div>
                               			<div class="row mt-5 pt-1" style="background-color:#F2F2F2";>
                              				<div class="col fw-bold mb-4 text-center" style="font-size: 1.1em;">
	                               				<i class="bi bi-asterisk"></i>
	                               				인기검색어
	                               				<i class="bi bi-asterisk"></i>
                              				</div>
                              			</div>
                               			<c:forEach items="${readList }" var="notice" varStatus="loop">
                                    	<c:if test="${loop.index<5 }">
                               			<div class="row mx-2" >
                               				<div class="col-1 mt-2">
                               					<i class="bi bi-award-fill" style="color:#F7C113"></i>
                               				</div>
                               				<div class="col mt-2">
	                   							<span class="d-inline-block text-truncate" style="max-width: 9em;">
	                                     			<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
	                                               	class="navbar-brand"
	                                               	style="text-decoration:none; font-size: 0.9em;">
	                                               	${notice.noticeboardDto.title }
	                                            	</a>
	                                            </span>
                               				</div>
                                     	</div>
										</c:if>
                                    	</c:forEach>                                        			
                               		</div>
	                               		
                               		<div class="col-1"></div>
                               		
                            	</div>
                            	<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                           		<div class="row">&nbsp;</div>
                            </div>
                        </div>

                    </div>
                </div>
	                
                    
                </div>
            </div>
        	</div>
        </div>
        
        <div class="row">
        	<div class="col">
       			<jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
       		</div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
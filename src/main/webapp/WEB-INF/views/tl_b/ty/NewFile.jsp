<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>        
    </head>
		 
		 <script>
		 
            function formSubmit(){
                const frm = document.getElementById("frm");

                const inputComment = document.getElementById("inputComment");
                console.log(inputComment);
                    if(inputComment.value == ''){
                        alert("댓글 입력");
                        inputComment.focus;
                        return;

                    }
           		frm.submit();
            }
        </script>
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
                                    
                              <div class="row">
                        <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row mt-5  ">
                                                <div class="col fw-bold fs-2 text-center ">보건진료소</div>
                                            </div>

                                            <div class="row px-5 mx-3">
                                                <div class="col">
                                                    <form id="frm" action="./staffBoardPage" method="get">
                                                    
                                                        <div class="row mt-4">
                                                        <div class="col">
                                                            <span style="font-size: 20px; font-weight: bold;">Total</span>
                                                            <span style="font-size: 15px;">${total }개</span> 
                                                        </div>
                                                        <div class="col-2">
                                                            <select name="searchType" class="form-select" aria-label="Default select example">
                                                                <option selected value="title">제목</option>
                                                                <option value="content">내용</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-3 pe-0 text-end">
                                                            <input id="inputComment" name="searchWord" class="form-control" type="text" placeholder="내용을검색하세요">
                                                        </div> 
                                                        <div class="col-1 text-start">
                                                            <input type="submit" onclick="formSubmit()" class="btn btn-outline-primary" value="검색">
                                                        </div>
                                                    </div>
                                                    </form>
                                                    <div class="row">
                                                        <div class="col text-start" style="font-size: 15px;">
	                                                        <a href="../common/staffMainPage";
	                                                        style="text-decoration: none; color:#015A9E;">
	                                                        	홈
	                                                        </a>
	                                                        >공지사항
                                                        </div>
                                                    </div>
                                                    <div class="row">
		                                                <div class="col text-start" style="font-size: 20px;">
			                                                <a href="./staffBoardImgPage";
			                                                style="text-decoration:none; color: black">
			                                                <i class="bi bi-file-text"></i>
			                                                </a> |
			                                                <i class="bi bi-file-richtext-fill"></i>
	                                              	  </div>
	                                            	</div>

                                                    <div class="row mt-4">
                                                        <div class="col">
                                                            <div class="row ">
                                                                <div class="col fw-bold fs-5 text-center">[ 인기 게시글 ]</div>
                                                            </div>
                                                                <div class="row mt-3" >
                                                                    <div class="col text-center">
                                                                        <div class="row border border-3 text-center text-white" style="background-color: #133369";">
                                                                            <div class="col-3">인기글 순위</div>
                                                                            <div class="col-5">제목</div>
                                                                            <div class="col-2">작성자</div>
                                                                            <div class="col-2">조회수</div>                                                                   
                                                                        </div>
                                                                        <c:forEach items="${readList }" var="notice" varStatus="loop">
                                                                        <c:if test="${loop.index<3 }">
                                                                        <div class="row border-1 border-bottom">
                                                                            <div class="col-3 fw-bold text-danger">${loop.index+1}</div>
                                                                            <div class="col-5" style="text-decoration:none;" >
                                                                            	<span class="d-inline-block text-truncate" style="max-width: 10em;">
	                                                                            	<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
			                                                                        	class="navbar-brand"
			                                                                        	style="text-decoration:none;">
			                                                                        	${notice.noticeboardDto.title }
			                                                                        </a>
		                                                                        </span>
                                                                            	</div>
                                                                            <div class="col-2">${notice.staffDto.name }</div>
                                                                            <div class="col-2">${notice.noticeboardDto.read_count }</div>
                                                                        </div>
                                                                        </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>  
                                                        </div>
                                                        <div class="col-7 text-center">
                                                        	<div class="row mt-2">
                                                        		<div class="col fw-bold fs-5 text-center text-danger ">
                                                        		<i class="bi bi-asterisk"></i>
                                                        			필독사항
                                                        		<i class="bi bi-asterisk"></i>
                                                        		</div>
                                                        	</div>
                                                        	<div class="row mt-3">
                                                        		<div class="col fw-bold">
                                                        			건전한 공지사항을 위해 아래항목은 꼭 지켜주세요!!
                                                        		</div>
                                                        	</div>
                                                        	<div class="row mt-3">
                                                        		<div class="col-2"></div>
                                                        		<div class="col text-start">
                                                        			1. 댓글은 공지사항과 관련된 글만 올려주세요
                                                        			(불건전한 내용은 예고없이 삭제 처리 됩니다.) 
                                                        		</div>
                                                        	</div>
                                                        	<div class="row">
                                                        		<div class="col-2"></div>
                                                        		<div class="col text-start">
                                                        			2. 요청사항 및 건의사항은 s001lec@naver.com 으로 보내주세요.
                                                        		</div>
                                                        	</div>
                                                        	<div class="row">
                                                        		<div class="col-2"></div>
                                                        		<div class="col text-start">
                                                        			3. 게시글 대표이미지는 꼭 설정 부탁드립니다.
                                                        		</div>
                                                        	</div>
                                                        </div>
                                                    </div>


                                                    <div class="row mt-5">
                                                        <div class="col">
                                                        	<div class="row">
                                                        		<div class="col fw-bold fs-5 text-center">[ 공지사항 ]</div>
                                                        	</div>
                                                            <div class="row mt-3 my-2">
                                                                <div class="col fw-bold fs-5">
                                                                    <div class="row border border-3 text-center text-white" style="background-color: #133369";">
                                                                        <div class="col-1">글 번호</div>
                                                                        <div class="col-5">제목</div>
                                                                        <div class="col-1">작성자</div>
                                                                        <div class="col">작성일</div>
                                                                        <div class="col-1">좋아요</div>
                                                                        <div class="col-1">조회수</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                           <%--  <c:forEach items="${readList }" var="notice">
                                                                        <div class="row border-1 border-bottom text-center">
                                                                            <div class="col-1 fw-bold text-danger">[인기글]</div>
                                                                            <div class="col-5" style="text-decoration:none;" >
                                                                            	<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
		                                                                        	style="text-decoration:none;">
		                                                                        	${notice.noticeboardDto.title }
		                                                                        </a>
                                                                            	</div>
                                                                            <div class="col-1">${notice.staffDto.name }</div>
                                                                            <div class="col">
		                                                                        <fmt:formatDate value="${notice.noticeboardDto.created_at  }" pattern="yyyy년 MM월 dd일"/>
		                                                                    </div>
	                                                                        <div class="col-1">${notice.likeDto }</div>
                                                                            <div class="col-1">${notice.noticeboardDto.read_count }</div>
                                                                        </div>
                                                                        </c:forEach> --%>
                                                            
                                                            <c:forEach items="${noticeList }" var="notice">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="row border-bottom border-0 text-center">
                                                                        <div class="col-1">${notice.noticeboardDto.studentboard_pk }</div>
                                                                        <div class="col-5 ">
                                                                        	<span class="d-inline-block text-truncate" style="max-width: 23em;">
	                                                                        	<a href="./staffBoardReadPage?id=${notice.noticeboardDto.studentboard_pk }"
		                                                                        	class="navbar-brand"
		                                                                        	style="text-decoration:none;">
		                                                                        	${notice.noticeboardDto.title }
	                                                                        	</a>
                                                                        	</span>
                                                                        	<c:if test="${notice.replyDto !=0 }">
                                                                        		&nbsp;[${notice.replyDto }]
                                                                        	</c:if>
                                                                        	<c:if test="${notice.imgDto !=0}">
                                                                        		<i class="bi bi-images"></i>
                                                                        	</c:if>
                                                                        </div>
                                                                        <div class="col-1">${notice.staffDto.name }</div>
                                                                        <div class="col">
                                                                        <fmt:formatDate value="${notice.noticeboardDto.created_at  }" pattern="yyyy년 MM월 dd일"/>
                                                                        </div>
                                                                        <div class="col-1">${notice.likeDto }</div>
                                                                        <div class="col-1">${notice.noticeboardDto.read_count }</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            </c:forEach> 
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col text-end">
                                                            <a href="./staffWriteBoardPage">
                                                            	<input type="button" class="btn btn-outline-primary " value="글쓰기">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-4">
                                                        <div class="col">
                                                            <nav aria-label="Page navigation example ">
                                                                <ul class="pagination  justify-content-center ">
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#" aria-label="Previous">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                    </a>
                                                                </li>
                                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                                <li class="page-item">
                                                                    <a class="page-link" href="#" aria-label="Next">
                                                                    <span aria-hidden="true">&raquo;</span>
                                                                    </a>
                                                                </li>
                                                                </ul>
                                                            </nav>
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
                    </div>
                   <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
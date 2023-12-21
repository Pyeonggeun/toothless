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
    	<script src="../../resources/js/hn/topBanner.js"></script>
    </head>
    	<script>
            function formSubmit(){
                const frm = document.getElementById("frm");
                
                const inputComment=document.getElementById("inputComment");
                if(inputComment.value == ''){
                    alert("검색어를 입력하세요.");
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
                    <div class="row mx-5">
                        <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row mt-5  ">
                                                <div class="col fw-bold fs-2 text-center border-bottom border-2">보건진료소</div>
                                            </div>
                                            <form id="frm" action="./studentBoardPage" method="get">
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
                                                    <input id="inputComment" name="searchWord" class="form-control " type="text" placeholder="내용을검색하세요">
                                                </div> 
                                                <div class="col-1 text-start">
                                                    <input type="button" onclick="formSubmit()" class="btn btn-outline-primary" value="검색">
                                                </div>
                                            </div>
                                            </form>
                                            <div class="row">
                                                <div class="col text-start" style="font-size: 15px;">
	                                                <a href="../common/studentMainPage";
	                                                style="text-decoration:none;">
	                                                홈
	                                                </a>
	                                                >공지사항
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col text-start" style="font-size: 20px;">
	                                                <i class="bi bi-file-text"></i> | 
	                                                <a href="./studentBoardPage";
	                                                style="text-decoration:none; color: black">
	                                                <i class="bi bi-file-richtext-fill"></i>
	                                                </a>
                                                </div>
                                            </div>

                                            <div class="row mx-3 mt-5  border border-3 ">
                                                <div class="col">
                                                    
                                                    
                                                    <div class="row ms-4 ps-5">
                                                    <c:forEach items="${noticeList }" var="board">
                                                        <div class="col-2 mx-3 my-3 border border-black">
                                                            <div class="row ">
                                                                <div class="col fs-4 fw-bold">
                                                                	<a href="./studentAndStaffBoardReadPage?id=${board.noticeboardDto.studentboard_pk }"
                                                                		style="text-decoration:none;">
                                                                		${board.noticeboardDto.title }
                                                                	</a>
                                                                </div>
                                                            </div>
                                                            <div class="row  ">
                                                                <div class="col" style="font-size: 13px;">
                                                                    ${board.staffDto.name } |
                                                                    <fmt:formatDate value="${board.noticeboardDto.created_at  }" pattern="yyyy년 MM월 dd일"/> |
                                                                    <i class="bi bi-eye"></i>
                                                                    ${board.noticeboardDto.read_count }
                                                                </div>
                                                            </div>
                                                            <c:choose>
	                                                            <c:when test="${!empty board.noticeboardDto.img_link  }">
	                                                            <div class="row mx-1 my-1 border border-black ">
	                                                                <div class="col text-center">
	                                                                	<img class=" img-thumbnail img img-fluid" src="/uploadFiles/mainImage/${board.noticeboardDto.img_link}"
	                                                                	style="height: 160px; width: 180px;"> 
	                                                                </div>
	                                                            </div>
	                                                            </c:when>
	                                                            <c:otherwise>
	                                                            	<img class="text-center" src="../../resources/img/healthRoom/TY/noimage.jpeg"
	                                                                style="max-height: 200px; width: 190px;" >
	                                                            </c:otherwise>
	                                                        </c:choose>    
                                                            <div class="row ">
                                                                <div class="col text-secondary" style="font-size: 13px;">
                                                                   	&nbsp;
                                                                   	<i class="bi bi-heart-fill"></i>
                                                                    ${board.likeDto } &nbsp;|&nbsp;
                                                                    <i class="bi bi-chat"></i>
                                                                    ${board.replyDto }
                                                                </div>
                                                            </div>
                                                        </div>
                                                   	 </c:forEach>
                                                    </div>
                                                    



                                                </div>
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
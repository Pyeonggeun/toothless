<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .menus{
            text-align: center;
            float: inline-block;
        }
        
 
    </style>
    <script>
        //js주석
        /*여러줄 주석*/
        
    </script>
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
            <jsp:include page="../commons/student/leftButtons4.jsp"></jsp:include>
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">공지사항</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 공지사항</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <div class="row">
                            <div class="col-2 pb-3 text-center fw-bold" style="font-size: large;">
                                글번호
                            </div>
                            <div class="col text-center fw-bold" style="font-size: large;">
                                제목
                            </div>
                            <div class="col-2 text-center fw-bold" style="font-size: large;">
                                작성자
                            </div>
                            <div class="col-2 text-center fw-bold" style="font-size: large;">
                                작성일
                            </div>
                        </div>
                    </div>
                </div><!-- 여기까지-->
                <!-- row col 반복문 돌릴곳, 제목 클릭시 게시판 상세내용-->
                <c:forEach items="${noticeList}" var="NList">
                <div class="row">
                    <div class="col">
                        <div class="row" style="border-top: 0.03em solid black;">
                            <div class="col-2 py-3 text-center" style="font-size: large;">${NList.dormNoticeDto.dorm_notice_pk }</div>
                            <div class="col py-3 text-center" style="font-size: large;"><a href="./dm_NoticeArticlePage?dorm_notice_pk=${NList.dormNoticeDto.dorm_notice_pk }" style="text-decoration: none; color: black;">${NList.dormNoticeDto.title }</a></div>
                            <div class="col-2 py-3 text-center" style="font-size: large;">${NList.staffInfoDto.name }</div>
                            <div class="col-2 py-3 text-center" style="font-size: large;"><fmt:formatDate value="${NList.dormNoticeDto.created_at }"/></div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- 반복문 여기까지 게시판 내용 + 사생정보 내용 -->
                <div class="row">
                    <div class="col">
                        <div class="row" style="border-top: 0.03em solid black;">
                           
                        </div>
                    </div>
                </div>
                <c:if test="${!empty sessionStaffInfo}">
                <div class="row my-5 pb-5">	
			             <div class="col px-0 text-end">
			                	<a href="./dm_NoticeWritePage">
					               <button type="button" class="rounded-0 fw-bold btn btn-lg btn-primary text-white ms-1">공지사항 등록</button>
					            </a>
			             </div>                    
			     </div>
			     </c:if>
			     
			     
           </div>
        </div>
    </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>  
       
<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>
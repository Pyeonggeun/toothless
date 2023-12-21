<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
		<title>교육 교직원 상세페이지</title>
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
                                <div class="col pb-5">
                                    <!-- 여기 안에만 사용하면 됨 -->
                                    <div class="row mt-4">
                                        
                                         <div class="col-8" >
                                             <div class="row border-bottom border-dark border-2">
                                                <div class="col text-white" style="font-size: 1.5em; background-color: #014195;">교육프로그램 정보</div>
                                            </div>
                                            <div class="row border-bottom ">
                                                <div class="col-3 align-self-center my-3">
                                                    <img class="img img-fluid"
                                                    src="/uploadFiles/eduImage/${qwer.eduDto.img_link }"
                                                    style="max-height: 350px; width: 290px;" >
                                                </div>
                                                <div class="col px-0 mt-3">
                                                    <div class="row">
                                                        <h5>
                                                            <span class="badge px-3 text-white" 
                                                            style="background-color: #133369;">진행중
                                                            </span>
                                                            <span class="badge px-3 text-white" 
                                                            style="background-color: #F3AD12;">학생
                                                            </span>
                                                        </h5>
                                                        <!-- <h5 class="d-inline-block">
                                                            <span class="badge px-3 text-white" 
                                                            style="background-color: #F3AD12;">학생
                                                            </span>
                                                        </h5> -->
                                                    </div>
                        
                                                    <div class="row">
                                                        <div class="col fw-bold" style="font-size: 1.5em;">
                                                            ${qwer.eduDto.name }
                                                        </div>
                                                    </div>
                                                    <div class="row my-2">
                                                        <div class="col fw-bold">
                                                            <span style="font-size: 18px;">
                                                                교육일자 &nbsp;
                                                            </span> 
                                                            <span style="font-size: 18px;">
                                                                <fmt:formatDate 
                                                                value="${qwer.eduDto.edu_date }"
                                                                pattern="yy년 MM월 dd일 hh시"
                                                                />
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row my-2">
                                                        <div class="col fw-bold">
                                                            <span style="font-size: 18px;">
                                                                신청기간 &nbsp;
                                                            </span> 
                                                            <span style="font-size: 18px;">
                                                                <fmt:formatDate 
                                                                value="${qwer.eduDto.apply_start_date }"
                                                                pattern="yy년 MM월 dd일 hh시"/>
                                                                ~
                                                                <fmt:formatDate 
                                                                value="${qwer.eduDto.apply_end_date }"
                                                                pattern="yy년 MM월 dd일 hh시"/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row my-2">
                                                        <div class="col fw-bold" style="font-size: 18px;">
                                                            <span>
                                                                모집인원 &nbsp;
                                                            </span> 
                                                            <span>
                                                                ${qwer.eduDto.capacity}명
                                                            </span>
                                                        </div>
                        
                                                    </div>
                                                </div>
                                            </div>
                        
                                            <!-- 이게 상세정보 로우 -->
                                            <div class="row">
                                                <div class="col">
                                                    <!-- 상세에서 제목 -->
                                                    <div class="row mt-3">
                                                        <div class="col fw-bold" 
                                                        style="font-size: 24px;
                                                        color: #2969B0;">
                                                            ${qwer.eduDto.name }
                                                        </div>
                                                    </div>
                        
                                                    <!-- 상세내용 -->
                                                    <div class="row mt-4"> 
                                                        <div class="col">
                                                            
                                                            <div class="row">
                                                                <div class="col fw-bold" 
                                                                style="color: #B8312F; font-size: 18px;">
                                                                    *신청기간
                                                                    <fmt:formatDate value="${qwer.eduDto.apply_start_date }"
                                                                    pattern="yy년 MM월 dd일 hh시"/>
                                                                    ~
                                                                    <fmt:formatDate value="${qwer.eduDto.apply_end_date }"
                                                                    pattern="yy년 MM월 dd일 hh시"/>
                                                                    (선착순모집)
                                                                </div>
                                                            </div> 
                                                            
                                                            <div class="row mt-1">
                                                                <div class="col fw-bold"
                                                                style= "font-size: 18px; color: #535D66;">
                                                                    *교육장소 ${qwer.eduDto.place }
                                                                </div>
                                                            </div> 
                                                            <div class="row mt-1">
                                                                <div class="col fw-semibold"
                                                                style="font-size: 18px; color: #535D66;">
                                                                    *모집인원 ${qwer.eduDto.capacity }명
                                                                </div>
                                                            </div> 
                                                           
                                                            <div class="row mt-1">
                                                                <div class="col fw-semibold text-secondary"
                                                                style="font-size: 18px; color: #535D66;">
                                                                    *신청방법<br> 
                                                                    MK대학교 보건센터 > 교육프로그램 > 수강신청 <br>
                 													(전화접수는 12.31일부터 가능)<br>
                                                                    *강사 한고은 <br>
                                                                    <br>
                                                                    상세교육 내용<br>
                                                                    <span class="fw-normal" style="font-size: 0.9em;">${qwer.eduDto.content }</span>
                                                                    
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row mt-4"> 
                                                                <div class="col">
                                                                    <img class="img img-fluid"
                                                                    src="/uploadFiles/eduImage/${qwer.eduDto.img_link }"
                                                                    style="max-height: 800px;">
                                                                </div>
                                                            </div>
                        
                                                        </div>
                                                    </div>
                        
                                                    
                                                    <div class="row"> 
                                                        <div class="col fw-bold text-secondary"
                                                        style="font-size: 18px; color: #363C48;">
                                                            - 프로그램 운영 사진 및 영상물은 MK대학교 보건센터 홍보영상등으로 활용될 수 있습니다.<br>
                                                            - 접수 취소시, 반드시 보건센터로 사전 연락 부탁드립니다.<br>
                                                            <span style="font-size: 18px;">
                                                                &nbsp;&nbsp;(예고없이
                                                            
                                                                <span style="color: #B8312F;">
                                                                    <strong>불참시 프로그램 참여가 불가함</strong>
                                                                </span>
                        
                                                            을 안내드립니다.)
                                                            </span>
                                                            <br>
                                                            <span style="font-size: 18px;">
                                                                문의 010-6379-0626
                                                            </span>
                                                            <br>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row my-5"> 
                                                        <div class="col fw-bold">
                                                            작성자 ${qwer.staffInfoDto.name }<br>
                                                            등록일
                                                            <fmt:formatDate value="${qwer.eduDto.created_at}"
                                                            pattern="yy년 MM월 dd일 hh시"/>
                                                        </div>
                                                    </div>
                                                    <!---->
                                                        <div class="row mt-5 justify-content-end"> 
                                                            <div class="col text-end">
                                                                <button class="btn rounded-0" 
                                                                        style="background-color: #EFF0F2;" 
                                                                        onclick="location.href='./eduMainPageForStaff'">
                                                                        목록
                                                                </button>
                                                            
                                                   			<c:if test="${!empty sessionStaffInfo && sessionStaffInfo.staff_pk == qwer.staffInfoDto.staff_pk}">
                                                                <button class="btn text-white rounded-0" 
                                                                        style="background-color: #014195;" 
                                                                        onclick="location.href='./updateEduProgPage?edu_pk=${qwer.eduDto.edu_pk }'">
                                                                    글 수정
                                                                </button>
                                                                <button class="btn text-white rounded-0" 
                                                                        style="background-color: #B8312F;" 
                                                                        onclick="location.href='./deleteEduProgProcess?edu_pk=${qwer.eduDto.edu_pk}'">
                                                                    글 삭제
                                                                </button>
                                                            </c:if>    
                                                            </div>
                                                        </div>

                                                    


                                                </div>
                                            </div>
                        
                                           
                                        
                                        </div><!--콜  끝나는거  -->
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